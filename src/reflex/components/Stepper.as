package reflex.components
{
	import reflex.behaviors.MovieClipSkinBehavior;
	import reflex.behaviors.SlideBehavior;
	import reflex.behaviors.StepBehavior;
	import reflex.data.Position;

	public class Stepper extends SliderDefinition
	{
		
		public function Stepper()
		{
			super();
			position = new Position();
			skin = new StepperGraphic();
			behaviors.addItem(new MovieClipSkinBehavior(this));
			behaviors.addItem(new StepBehavior(this));
		}
		
	}
}