package reflex.skins
{
	import flash.display.Shape;
	
	import mx.graphics.SolidColor;
	
	import reflex.binding.Bind;
	import reflex.collections.SimpleCollection;
	import reflex.containers.Container;
	import reflex.graphics.Rect;
	import reflex.layouts.BasicLayout;

	public class ScrollerSkin extends Skin
	{
		
		[Bindable]
		public var container:Container;
		
		public function ScrollerSkin()
		{
			super();
			layout = new BasicLayout();
			container = new Container();
			var mask:Rect = new Rect();
			mask.fill = new SolidColor(0, 1);
			mask.percentWidth = 100;
			mask.percentHeight = 100;
			container.mask = mask;
			content = new SimpleCollection([container, mask]);
		}
		
	}
}