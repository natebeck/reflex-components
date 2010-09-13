package reflex.components
{
	import mx.core.IDataRenderer;
	import mx.core.IFactory;
	
	import reflex.behaviors.ButtonBehavior;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SelectableBehavior;
	import reflex.events.PropertyEvent;
	
	/**
	 * @alpha
	 */
	public class ListItem extends ListItemDefinition
	{
		
		public function ListItem()
		{
			super();
			skin = new ButtonGraphic();
			behaviors.movieClipSkin = new MovieClipSkinBehavior();
			behaviors.button = new ButtonBehavior();
			behaviors.selectable = new SelectableBehavior();
		}
		
	}
}