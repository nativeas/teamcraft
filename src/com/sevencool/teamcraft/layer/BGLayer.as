package com.sevencool.teamcraft.layer
{
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class BGLayer extends Sprite
	{
		
		private var _image:Image ;
		public function BGLayer()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedStage);
		}
		
		private function onAddedStage(event:Event):void
		{
			// TODO Auto Generated method stub
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedStage);
			_image = new Image(Assets.getTexture("BgLayer1"));
			_image.blendMode = BlendMode.NONE;
			
			_image.x = 0;
			_image.y = stage.stageHeight - _image.height;
			
			
			addChild(_image);
		}
	}
}