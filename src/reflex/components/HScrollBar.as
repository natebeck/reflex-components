package reflex.components
{
	import legato.components.ScrollBarGraphic;
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SlideBehavior;
	import reflex.behaviors.StepBehavior;
	import reflex.data.ScrollPosition;

	public class HScrollBar extends SliderDefinition
	{
		
		public function HScrollBar()
		{
			super();
			position = new ScrollPosition();
			skin = new ScrollBarGraphic();
			behaviors.addItem(new MovieClipSkinBehavior(this));
			behaviors.addItem(new StepBehavior(this));
			behaviors.addItem(new SlideBehavior(this, SlideBehavior.HORIZONTAL, true));
		}
		
	}
}