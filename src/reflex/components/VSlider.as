package reflex.components
{
	
	import reflex.behaviors.SlideBehavior;
	import reflex.data.Position;

	public class VSlider extends SliderDefinition
	{
		
		public function VSlider()
		{
			super();
			measured.width = 20;
			measured.height = 170;
			position = new Position();
			skin = new VerticalSliderSkin();
			behaviors.addItem(new SlideBehavior(this, SlideBehavior.VERTICAL));
		}
		
	}
}