package reflex.skins
{
	import reflex.binding.Bind;
	import reflex.collections.SimpleCollection;
	import reflex.containers.Container;
	import reflex.containers.Group;
	import reflex.invalidation.Invalidation;
	import reflex.layouts.BasicLayout;
	import reflex.layouts.VerticalLayout;
	import reflex.layouts.XYLayout;

	public class ListSkin extends Skin
	{
		
		[Bindable]
		public var container:Container;
		
		public function ListSkin()
		{
			super();
			container = new Container();
			container.setStyle("horizontalCenter", 0);
			container.setStyle("verticalCenter", 0);
			content = new SimpleCollection([container]);
		}
		
	}
}