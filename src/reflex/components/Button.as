package reflex.components
{
	import flash.display.MovieClip;
	
	import reflex.behaviors.ButtonBehavior;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SelectBehavior;
	import reflex.binding.Bind;

	public class Button extends ButtonDefinition
	{
		
		public function Button()
		{
			super();
			skin = new ButtonGraphic();
			behaviors.addItem(new MovieClipSkinBehavior(this));
			behaviors.addItem(new ButtonBehavior(this));
			behaviors.addItem(new SelectBehavior(this));
			Bind.addBinding(this, "skin.label.text", this, "label", false);
		}
		
	}
}