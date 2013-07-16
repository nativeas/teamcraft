package com.sevencool.teamcraft.screens
{
	import com.sevencool.teamcraft.avater.Soldier;
	import com.sevencool.teamcraft.layer.BGLayer;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class InGame extends Sprite
	{
		
		
		public function InGame()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			this.addEventListener(TouchEvent.TOUCH,onTouched);
		}
		
		private function onTouched(event:TouchEvent):void
		{
			trace(event);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			
			
			
			
			var bg:BGLayer = new BGLayer();
			addChild(bg);
			
			var solider:Soldier = new Soldier();
			addChild(solider);
			solider.x = this.stage.stageWidth/2;
			solider.y = this.stage.stageHeight/2;
		}		
		
	}
}