package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class Circle extends ColoredVector {
		
		public function Circle() {
			super("Charge", "Circle");
			this.colorList = [
				new ColorValueGroup("flagCircle", "Circle", "#BE0026", [
					new ColorValueGroup("flagBody", "Body", null, [
						new ColorValue("flagLeft", "Left"),
						new ColorValue("flagRight", "Right")
					]),
					new ColorValueGroup("flagBorder", "Border", null, [
						new ColorValue("flagLeftBorder", "Left"),
						new ColorValue("flagRightBorder", "Right")
					])
				])
			];
		}
	}

}