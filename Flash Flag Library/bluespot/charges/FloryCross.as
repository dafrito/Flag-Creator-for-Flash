package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class FloryCross extends ColoredVector {
		
		public function FloryCross() {
			super("Charge", "FloryCross");
			this.colorList = [
				new ColorValueGroup("flagCross", "Cross", "#fff", [
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