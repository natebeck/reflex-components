package reflex.components
{
	import reflex.behaviors.ButtonBehavior;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SelectBehavior;
	import reflex.binding.Bind;

	public class CheckBox extends ButtonDefinition
	{
		public function CheckBox()
		{
			super();
			skin = new ReflexCheckBoxSkin();
			behaviors.addItem(new MovieClipSkinBehavior(this));
			behaviors.addItem(new ButtonBehavior(this));
			behaviors.addItem(new SelectBehavior(this));
			Bind.addBinding(this, "skin.label.text", this, "label", false);
			Bind.addBinding(this, "skin.currentState", this, "currentState", false);
			measured.width = 120;
			measured.height = 30;
		}
	}
}