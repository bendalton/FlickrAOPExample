package common
{
	
	import common.events.LoadingEvent;
	
	import flash.events.IEventDispatcher;
	import flash.utils.getQualifiedClassName;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	import org.swizframework.aop.support.IMethodInvocation;
	import org.swizframework.aop.support.Method;
	import org.swizframework.reflection.BaseMetadataTag;

	public class NetworkStatusAdvisor
	{
		public function NetworkStatusAdvisor()
		{
		}
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Around( annotation="ShowLoading" )]
		public function showLoadingStatus( invocation:IMethodInvocation,  md:BaseMetadataTag  ):*
		{
			
			trace('showLoadingStatus');
			var loadingMessage:String = md.getArg( "message" ).value || "Loading...";
			
			var token:AsyncToken = invocation.proceed();
			
			token.loadingMessage = loadingMessage;
			token.addResponder(new Responder(onLoadingResult,onLoadingFault));
			dispatcher.dispatchEvent(new LoadingEvent(LoadingEvent.LOADING,loadingMessage));
			return token;
		}
		
		private function onLoadingResult(event:ResultEvent):void
		{
			trace('onLoadingResult');
			dispatcher.dispatchEvent(new LoadingEvent(LoadingEvent.LOADED,event.token.loadingMessage));
		}
		
		private function onLoadingFault(event:FaultEvent):void
		{
			trace('onLoadingFault');
			dispatcher.dispatchEvent(new LoadingEvent(LoadingEvent.LOADED,event.token.loadingMessage));
		}
	}
}