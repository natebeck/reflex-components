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
		}
		
		private function onMouseUp(event:MouseEvent):void {
			speed.x = point.x - (target as DisplayObject).mouseX;
			speed.y = point.y - (target as DisplayObject).mouseY;
			point.x = (target as DisplayObject).mouseX;
			point.y = (target as DisplayObject).mouseY;
			(target as DisplayObject).removeEventListener(Event.ENTER_FRAME, scrolling_enterFrameHandler, false);
			(target as DisplayObject).stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp, false);
			(target as DisplayObject).addEventListener(Event.ENTER_FRAME, animation_enterFrameHandler, false, 0, true);
		}
		
		private function scrolling_enterFrameHandler(event:Event):void {
			if(horizontalPosition && horizontalControl) {
				speed.x = point.x - (target as DisplayObject).mouseX;
				var px:Number = horizontalPosition.value + speed.x;
				horizontalPosition.value = Math.max(horizontalPosition.minimum, Math.min(horizontalPosition.maximum, px));
			}
			if(verticalPosition && verticalControl) {
				speed.y = point.y - (target as DisplayObject).mouseY;
				var py:Number = verticalPosition.value + speed.y;
				verticalPosition.value = Math.max(verticalPosition.minimum, Math.min(verticalPosition.maximum, py));
			}
			point.x = (target as DisplayObject).mouseX;
			point.y = (target as DisplayObject).mouseY;
			drag = 0.95;
		}
		
		private function animation_enterFrameHandler(event:Event):void {
			if(horizontalPosition && horizontalControl) {
				var px:Number = horizontalPosition.value + speed.x;
				horizontalPosition.value = Math.max(horizontalPosition.minimum, Math.min(horizontalPosition.maximum, px));
			}
			if(verticalPosition && verticalControl) {
				var py:Number = verticalPosition.value + speed.y;
				verticalPosition.value = Math.max(verticalPosition.minimum, Math.min(verticalPosition.maximum, py));
			}
			speed.x = speed.x * drag;
			speed.y = speed.y * drag;
			drag -= 0.005;
		}
		
	}
}