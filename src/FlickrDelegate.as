package
{
	import flash.events.EventDispatcher;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.http.mxml.HTTPService;

	public class FlickrDelegate
	{
		[Inject(source='flickrService')]
		public var service:HTTPService;
		
		[ShowLoading(message='Loading Flickr Data')]
		public function test():AsyncToken
		{
			return service.send();
		}
	}
}