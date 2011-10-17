package  common.components
{
	[Bindable]
	public class SelectableItem
	{
		
		public function SelectableItem(text:String,value:*=null,selectionEnabled:Boolean=true):void
		{
			this.text = text;
			this.value = value;
			this.selectionEnabled = selectionEnabled;
		}
		
		
		public var value:*;
		public var text:String;
		public var selectionEnabled:Boolean;
		
		public function get label():String
		{
			return text;
		}
		
		public function set label(value:String):void
		{
			text = value;
		}
	}
}