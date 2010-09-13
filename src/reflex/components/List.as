package reflex.components
{
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
		}
		
	}
}