package reflex.components
{
	import legato.components.ScrollBarGraphic;
	
	import reflex.behaviors.SlideBehavior;
	import reflex.data.Position;

	public class VSlider extends SliderDefinition
	{
		
		public function VSlider()
		{
			super();
			position = new Position();
			skin = new ScrollBarGraphic()
			behaviors.slider = new SlideBehavior();
		}
		
	}
}