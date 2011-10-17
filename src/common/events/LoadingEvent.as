package common.events
{
	import flash.events.Event;
	
	public class LoadingEvent extends Event
	{
		public static const LOADING:String = "loading";
		public static const LOADED:String = "loaded";
		
		public var message:String;
		
		public function LoadingEvent(type:String,message:String = null)
		{
			this.message = message;
			super(type, true);
		}
		
		override public function clone():Event{
			return new LoadingEvent(type,message);
		}
	}
}