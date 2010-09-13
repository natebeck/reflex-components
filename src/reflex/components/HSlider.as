package reflex.components
{
	import legato.components.ScrollBarGraphic;
	
	import reflex.behaviors.SlideBehavior;
	import reflex.data.Position;

	public class HSlider extends SliderDefinition
	{
		
		public function HSlider()
		{
			super();
			position = new Position();
			skin = new ScrollBarGraphic()
			behaviors.slider = new SlideBehavior();
		}
		
	}
}