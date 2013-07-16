package com.sevencool.teamcraft.screens
{
	import com.sevencool.teamcraft.avater.Soldier;
	import com.sevencool.teamcraft.layer.BGLayer;
	
	import flashx.textLayout.elements.BreakElement;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
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
			
			var touch:Touch  = event.getTouch(_background);
			if(touch!=null){
				switch(touch.phase)
				{
					case TouchPhase.BEGAN:
					{
						
						trace("down!");
						break;
					}
					case TouchPhase.ENDED:
					{
						trace("end!");
						trace("move to ",touch.globalX,touch.globalY);
						soliderMoveTo(touch.globalX,touch.globalY);
						break;
					}
					
					default:
					{
//						trace("FUCK",touch.phase);
						break;
					}
				}
			}
		}
		
		
		private var _background:BGLayer = null;
		private var solider:Soldier = new Soldier();
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			
			
			
			
			_background= new BGLayer();
			addChild(_background);
			
			
			addChild(solider);
			solider.x = this.stage.stageWidth/2;
			solider.y = this.stage.stageHeight/2;
		}		
		
		
		private function soliderMoveTo($x:int,$y:int):void
		{
			
			solider.moveTo($x,$y);
		}
		
	}
}