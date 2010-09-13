package reflex.components
{
	import flash.display.MovieClip;
	
	import reflex.behaviors.ButtonBehavior;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SelectableBehavior;
	import reflex.binding.Bind;

	public class Button extends ButtonDefinition
	{
		
		public function Button()
		{
			super();
			skin = new ButtonGraphic();
			behaviors.movieClipSkin = new MovieClipSkinBehavior();
			behaviors.button = new ButtonBehavior();
			behaviors.selectable = new SelectableBehavior();
			Bind.addBinding(this, "skin.label.text", this, "label", false);
		}
		
	}
}