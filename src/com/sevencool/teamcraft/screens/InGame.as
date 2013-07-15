package com.sevencool.teamcraft.screens
{
	import com.sevencool.teamcraft.avater.Soldier;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class InGame extends Sprite
	{
		
		
		public function InGame()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			
			var solider:Soldier = new Soldier();
			addChild(solider);
			solider.x = this.stage.stageWidth/2;
			solider.y = this.stage.stageHeight/2;
		}		
		
	}
}