package reflex.components
{
	import legato.components.ScrollBarGraphic;
	
	import mx.controls.scrollClasses.ScrollBar;
	
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
			behaviors.movieClipSkin = new MovieClipSkinBehavior();
			behaviors.step = new StepBehavior();
			behaviors.slide = new SlideBehavior();
		}
		
	}
}