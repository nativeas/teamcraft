package com.sevencool.teamcraft.avater
{
	import flash.geom.Point;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Soldier extends Sprite
	{
		private var art :MovieClip;
		
		/**
		 * state
		 * 1 stand
		 * 2 walking
		 * 3 attack
		 * 4 dead 
		 */
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
			setState(1);
		}
		
		
		private function setState($s:int):void
		{
			if($s == _state)
				return;
			var key:String = '';
			switch($s)
			{
				case 1:
				{
					key = "stand";			
					break;
				}
				case 2:
				{
					key="walking";
					break;
				}
					
				default:
				{
					break;
				}
					
			}
			if(art!=null)
			{
				this.removeChild(art);
				Starling.juggler.remove(art);
				art=null;
			}
			art = new MovieClip(Assets.getAtlas().getTextures(key),12);
			art.x = Math.ceil(-art.width/2);
			art.y = Math.ceil(-art.height/2);
			Starling.juggler.add(art);
			this.addChild(art);	
		}
		
		private var _lastTween:Tween = null;
		public function moveTo($x:int, $y:int):void
		{
			if(_lastTween!=null){
				_lastTween = null;
			}
			var dst:int = distTimt($x,$y);
			var tween:Tween = new Tween(this, 1*dst, Transitions.LINEAR);
			tween.animate("x", $x);
			tween.animate("y", $y);
			Starling.juggler.add(tween); 
			tween.onComplete = function():void{
				_lastTween = null;
				setState(1);
			}
			if($x < this.x)
				faceTo(-1);
			else
				faceTo(1);
			setState(2);
		}
		
		/**
		 * 面向
		 * 1： 向右
		 * -1： 向左 
		 * @param side
		 * 
		 */
		private function faceTo(side:int):void
		{
			this.scaleX =side;
		}
		
		
		
		/**
		 * 计算时间 
		 * 根据距离计算需要行走的时间 
		 * @param $distX
		 * @param $distY
		 * @return 
		 * 
		 */
		internal function distTimt($distX:int, $distY:int):int{
			var sp:Point = new Point(this.x, this.y);
			var dp:Point = new Point($distX,$distY);
			var dst:int = Point.distance(sp,dp);
			
			return dst/30;
		}
	}
}