package reflex.components
{
	
	import reflex.behaviors.SlideBehavior;
	import reflex.data.Position;

	public class HSlider extends SliderDefinition
	{
		
		public function HSlider()
		{
			super();
			position = new Position();
			skin = new ReflexSliderSkin();
			behaviors.addItem(new SlideBehavior(this));
		}
		
	}
}