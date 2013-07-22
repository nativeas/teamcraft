package com.sevencool.teamcraft.avater
{
	import de.polygonal.ds.Array2;
	
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import starling.display.Sprite;

	public class Team
	{
		public function Team()
		{
		}
		
		private var _teamArray2:Array2 = null;
		private var _member:Vector.<Soldier> = null;
		public function createTeam(memberCount:int, centX:int,centY:int,parent:Sprite):void
		{
			_parent = parent;
			var side:int =Math.ceil(Math.sqrt( memberCount));
			 _teamArray2= new Array2(side,side);
			
			var x_member:Array=[];
			for (var i:int = 0; i < memberCount; i++) 
			{
				var meb:Soldier = new Soldier();
				x_member.push(meb);
				_teamArray2.setAtIndex(i,meb);	
			}
			
			_centX = centX;
			_centY = centY;
			_targetX = centX;
			_targetY = centY;
			_teamArray2.walk(addToPoint);
			
		}
		
		private var _centX:int ; 
		private var _centY:int;
		private var _stepLen:int = 30;
		private var _parent:Sprite =null;
		
		private function addToPoint(st:Soldier, xIndex:int, yIndex:int):Soldier
		{
			if(!st)
				return null;
			st.x = _centX +(_teamArray2.getW()/2-xIndex)*_stepLen;
			st.y = _centY +(_teamArray2.getH()/2-yIndex)*_stepLen;
			
			_parent.addChild(st);
			
			return st;		
		}
		
		private function soldMoveto($st:Soldier,xIndex:int , yIndex:int):Soldier
		{
			var targetX:int = _targetX +(_teamArray2.getW()/2 - xIndex)*_stepLen;
			var targetY:int = _targetY +(_teamArray2.getH()/2- yIndex)*_stepLen;
			$st.moveTo(targetX,targetY);
			$st.addEventListener("MOVE_COMPLETE",onMoveComplete);
			return $st;
		}
		
		private function onMoveComplete():void
		{
			// TODO Auto Generated method stub
			trace("FUCK");
		}
		
		private var _targetX:int = -1;
		private var _targetY:int = -1;
		
		public function moveTo($x:int, $y:int):void
		{
			_targetX = $x;
			_targetY = $y;
			_teamArray2.walk(soldMoveto);
		}
	
		private var faceto:int = -1;
		
		private function toAttack($st:Soldier,x:int,y:int):Soldier{
			$st.atteck(_attackPoint.x,_attackPoint.y);
			return $st;
		}
		
		private var _attackPoint:Point ;
		
		public function attack($x:int, $y:int):void
		{
			_attackPoint = new Point($x,$y);
			_teamArray2.walk(toAttack);
		}
	}
}