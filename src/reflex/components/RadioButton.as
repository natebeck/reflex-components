package reflex.components
{
	import reflex.behaviors.ButtonBehavior;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SelectableBehavior;
	import reflex.binding.Bind;

	public class RadioButton extends ButtonDefinition
	{
		
		public function RadioButton()
		{
			super();
			skin = new ButtonGraphic(); // needs graphic
			behaviors.movieClipSkin = new MovieClipSkinBehavior();
			behaviors.button = new ButtonBehavior();
			behaviors.selectable = new SelectableBehavior();
			Bind.addBinding(this, "skin.label.text", this, "label", false);
		}
		
	}
}