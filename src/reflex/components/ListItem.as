package reflex.components
{
	
	import reflex.behaviors.ButtonBehavior;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SelectBehavior;
	
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