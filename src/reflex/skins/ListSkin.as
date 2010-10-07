package reflex.skins
{
	import reflex.binding.Bind;
	import reflex.collections.SimpleCollection;
	import reflex.containers.Container;
	import reflex.containers.Group;
	import reflex.layouts.VerticalLayout;

	public class ListSkin extends Skin
	{
		
		public var container:Container;
		
		public function ListSkin()
		{
			super();
			container = new Container();
			content = new SimpleCollection([container]);
			Bind.addBinding(this, "container.content", this, "target.dataProvider");
			Bind.addBinding(this, "container.template", this, "target.template");
			Bind.addBinding(this, "container.layout", this, "target.layout");
			// need a better solution for this
			Bind.addBinding(this, "container.width", this, "target.width");
			Bind.addBinding(this, "container.height", this, "target.height");
		}
		
	}
}