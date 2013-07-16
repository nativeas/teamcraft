package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", width="1024", height="768", backgroundColor="0xffffff")]
	public class TeamCraft extends Sprite
	{
		private var _starling :Starling;
		public function TeamCraft()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedStage);
		}
		
		protected function onAddedStage(event:Event):void
		{
			// TODO Auto-generated method stub
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedStage);
			_starling = new Starling(Game,stage);
			_starling.antiAliasing =1;
			_starling.showStats=true;
			_starling.showStatsAt("right","top");
			_starling.start();
		}
	}
}