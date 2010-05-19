package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class Star extends ColoredVector {
		
		public function Star() {
			super("Charge", "Star");
			this.colorList = [
				new ColorValueGroup("flagCross", "Cross", "#FCEF3C", [
					new ColorValueGroup("flagBody", "Body", null, [
						new ColorValue("flagLeft", "Left"),
						new ColorValue("flagRight", "Right")
					]),
					new ColorValueGroup("flagBorder", "Border", "#000", [
						new ColorValue("flagLeftBorder", "Left"),
						new ColorValue("flagRightBorder", "Right")
					])
				])
			];
		}
	}

}