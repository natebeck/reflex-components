package reflex.behaviors
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Matrix3D;
	import flash.geom.Point;
	import flash.geom.Transform;
	import flash.geom.Vector3D;
	
	import reflex.behaviors.Behavior;
	import reflex.data.IPosition;
	import reflex.measurement.resolveHeight;
	import reflex.measurement.resolveWidth;
	
	//[HostComponent("flash.display.DisplayObject")]
	public class TouchScrollBehavior extends Behavior
	{
		
		private var point:Point;
		private var speed:Point;
		private var drag:Number = 0.95;
		
		[Bindable]
		[Binding(target="target.verticalPosition")]
		public var verticalPosition:IPosition;
		
		[Bindable]
		[Binding(target="target.horizontalPosition")]
		public var horizontalPosition:IPosition;
		
		[Bindable]
		[Binding(target="target.skin.container")]
		public var container:Object;
		
		public var horizontalControl:Boolean = true;
		public var verticalControl:Boolean = true;
		
		public function TouchScrollBehavior(target:IEventDispatcher=null)
		{
			super(target);
			point = new Point();
			speed = new Point();
		}
		
		[EventListener(type="mouseDown", target="target")]
		public function onMouseDown(event:MouseEvent):void {
			point.x = (target as DisplayObject).mouseX;
			point.y = (target as DisplayObject).mouseY;
			(target as DisplayObject).removeEventListener(Event.ENTER_FRAME, animation_enterFrameHandler, false);
			target.addEventListener(Event.ENTER_FRAME, scrolling_enterFrameHandler, false, 0, true);
			(target as DisplayObject).stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp, false, 0, true);
			drag = 0.95;
		}
		
		private function onMouseUp(event:MouseEvent):void {
			speed.x = point.x - (target as DisplayObject).mouseX;
			speed.y = point.y - (target as DisplayObject).mouseY;
			point.x = (target as DisplayObject).mouseX;
			point.y = (target as DisplayObject).mouseY;
			//(target as DisplayObject).removeEventListener(MouseEvent.MOUSE_MOVE, scrolling_enterFrameHandler, false);
			(target as DisplayObject).removeEventListener(Event.ENTER_FRAME, scrolling_enterFrameHandler, false);
			(target as DisplayObject).stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp, false);
			(target as DisplayObject).addEventListener(Event.ENTER_FRAME, animation_enterFrameHandler, false, 0, true);
		}
		
		private function scrolling_enterFrameHandler(event:Event):void {
			speed.x = point.x - (target as DisplayObject).mouseX;
			speed.y = point.y - (target as DisplayObject).mouseY;
			point.x = (target as DisplayObject).mouseX;
			point.y = (target as DisplayObject).mouseY;
			updatePositions();
		}
		
		private function animation_enterFrameHandler(event:Event):void {
			
			updatePositions();
			speed.x = speed.x * drag;
			speed.y = speed.y * drag;
			drag -= 0.005;
			if(drag < 0.1) {
				(target as DisplayObject).removeEventListener(Event.ENTER_FRAME, animation_enterFrameHandler, false);
			}
			
		}
		
		private function updatePositions():void {
			if(horizontalPosition && horizontalControl) {
				var percentX:Number = speed.x/(container.measured.width-(target as Object).height);
				var potentialX:Number = percentX*(horizontalPosition.maximum - horizontalPosition.minimum);
				var px:Number = horizontalPosition.value + potentialX;
				horizontalPosition.value = Math.max(horizontalPosition.minimum, Math.min(horizontalPosition.maximum, px));
			}
			if(verticalPosition && verticalControl) {
				var percentY:Number = speed.y/(container.measured.height-(target as Object).height);
				var potentialY:Number = percentY*(verticalPosition.maximum - verticalPosition.minimum);
				var py:Number = verticalPosition.value + potentialY;
				verticalPosition.value = Math.max(verticalPosition.minimum, Math.min(verticalPosition.maximum, py));
			}
		}
		
	}
}