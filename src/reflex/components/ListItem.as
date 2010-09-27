package reflex.components
{
	import mx.core.IDataRenderer;
	import mx.core.IFactory;
	
	import reflex.behaviors.ButtonBehavior;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SelectBehavior;
	//import reflex.events.PropertyEvent;
	
	/**
	 * @alpha
	 */
	public class ListItem extends ButtonDefinition
	{
		
		public function ListItem()
		{
			super();
			skin = new ButtonGraphic();
			behaviors.addItem(new MovieClipSkinBehavior(this));
			behaviors.addItem(new ButtonBehavior(this));
			behaviors.addItem(new SelectBehavior(this));
		}
		
	}
}