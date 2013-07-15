package com.sevencool.teamcraft.avater
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Soldier extends Sprite
	{
		private var art :MovieClip;
		
		private var _state:int;
		
		
		public function Soldier()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			
			createArt();
		}
		
		private function createArt():void
		{
			art = new MovieClip(Assets.getAtlas().getTextures("s"),12);
			art.x = Math.ceil(-art.width/2);
			art.y = Math.ceil(-art.height/2);
			Starling.juggler.add(art);
			this.addChild(art);
		}
	}
}