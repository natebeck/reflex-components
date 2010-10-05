package reflex.components
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import reflex.behaviors.ListSelectionBehavior;
	import reflex.binding.Bind;
	import reflex.data.Selection;
	import reflex.layouts.VerticalLayout;
	import reflex.skins.ListSkin;

	public class List extends ListDefinition
	{
		
		public function List()
		{
			super();
			skin = new ListSkin();
			layout = new VerticalLayout();
			template = ListItem;
			behaviors.addItem(new ListSelectionBehavior(this));
			selection = new Selection();
		}
		
	}
}