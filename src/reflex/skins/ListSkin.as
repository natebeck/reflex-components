package reflex.skins
{
	import reflex.binding.Bind;
	import reflex.collections.SimpleCollection;
	import reflex.containers.Group;

	public class ListSkin extends Skin
	{
		
		private var container:Group;
		
		public function ListSkin()
		{
			super();
			container = new Group();
			Bind.addBinding(this, "container.children", this, "target.dataProvider");
			Bind.addBinding(this, "container.template", this, "target.template");
			Bind.addBinding(this, "container.layout", this, "target.layout");
			// need a better solution for this
			Bind.addBinding(this, "container.width", this, "target.width");
			Bind.addBinding(this, "container.height", this, "target.height");
			content = new SimpleCollection([container]);
		}
		
	}
}