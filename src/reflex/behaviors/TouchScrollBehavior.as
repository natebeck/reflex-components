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
		
		[Bindable]
		[Binding(target="target.verticalPosition")]
		public var verticalPosition:IPosition
		
		public function TouchScrollBehavior(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		[EventListener(type="mouseDown", target="target")]
		public function onMouseDown(event:MouseEvent):void {
			//point = new Point(event.localX, (target as DisplayObject).mouseY);
			lastY = (target as DisplayObject).mouseY;
			(target as DisplayObject).removeEventListener(Event.ENTER_FRAME, animation_enterFrameHandler, false);
			target.addEventListener(Event.ENTER_FRAME, scrolling_enterFrameHandler, false, 0, true);
			(target as DisplayObject).stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp, false, 0, true);
		}
		
		private function onMouseUp(event:MouseEvent):void {
			speed = lastY - (target as DisplayObject).mouseY;
			lastY = (target as DisplayObject).mouseY;
			(target as DisplayObject).removeEventListener(Event.ENTER_FRAME, scrolling_enterFrameHandler, false);
			(target as DisplayObject).stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp, false);
			(target as DisplayObject).addEventListener(Event.ENTER_FRAME, animation_enterFrameHandler, false, 0, true);
		}
		
		//private var tilt:Number = 0;
		private var speed:Number = 0;
		private var lastY:Number = 0;
		private function scrolling_enterFrameHandler(event:Event):void {
			if(verticalPosition) {
				speed = lastY - (target as DisplayObject).mouseY;
				var p:Number = verticalPosition.value + speed;
				verticalPosition.value = Math.max(verticalPosition.minimum, Math.min(verticalPosition.maximum, p));
				
			}
			lastY = (target as DisplayObject).mouseY;
			//if(lastY > (target as DisplayObject).mouseY) {
				//tilt -= 0.5;
			//} else if(lastY < (target as DisplayObject).mouseY) {
				//tilt += 0.5;
			//}
			//tilt = Math.min(tilt, 30);
			//tilt = Math.max(tilt, -30);
			var child:DisplayObject = (target as Object).skin.container as DisplayObject;
			var height:Number = reflex.measurement.resolveHeight(child);
			var width:Number = reflex.measurement.resolveWidth(child);
			drag = 0.95;
		}
		
		private var drag:Number = 0.95;
		private function animation_enterFrameHandler(event:Event):void {
			if(verticalPosition) {
				var p:Number = verticalPosition.value + speed;
				verticalPosition.value = Math.max(verticalPosition.minimum, Math.min(verticalPosition.maximum, p));
			}
			speed = speed * drag;
			drag -= 0.005;
		}
		
	}
}