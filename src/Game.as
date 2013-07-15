package
{
	import com.sevencool.teamcraft.screens.InGame;
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class Game extends Sprite
	{ 
		/**
		 * screen for game 
		 */
		private var screenInGame:InGame;
		
		public function Game()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedStage);
		}
		
		private function onAddedStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedStage);
			initScreens();
		}
		
		private function initScreens():void
		{
			screenInGame = new InGame();
			this.addChild(screenInGame);
		}
	}
}