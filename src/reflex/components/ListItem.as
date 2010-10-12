package reflex.components
{
	
	import flash.utils.getQualifiedClassName;
	
	import mx.core.IDataRenderer;
	import mx.core.IFactory;
	
	import reflex.behaviors.ButtonBehavior;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SelectBehavior;
	import reflex.binding.Bind;
	
	/**
	 * @alpha
	 */
	public class ListItem extends ListItemDefinition
	{
		
		public function ListItem()
		{
			super();
			skin = new ButtonSkin();
			behaviors.addItem(new MovieClipSkinBehavior(this));
			behaviors.addItem(new ButtonBehavior(this));
			behaviors.addItem(new SelectBehavior(this));
			Bind.addBinding(this, "skin.label.text", this, "data.label");
			Bind.addBinding(this, "skin.label.text", this, "data.name");
			percentWidth = 100;
			measured.width = 120;
			measured.height = 30;
		}
		
	}
}