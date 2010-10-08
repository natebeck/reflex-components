package reflex.components
{
	
	import reflex.behaviors.SlideBehavior;
	import reflex.data.Position;

	public class HSlider extends SliderDefinition
	{
		
		public function HSlider()
		{
			super();
			measured.width = 170;
			measured.height = 20;
			position = new Position();
			skin = new HorizontalSliderSkin();
			behaviors.addItem(new SlideBehavior(this, SlideBehavior.HORIZONTAL));
		}
		
	}
}