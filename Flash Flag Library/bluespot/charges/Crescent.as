package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class Crescent extends ColoredVector {
		
		public function Crescent() {
			super("Charge", "Crescent");
			this.colorList = [
				new ColorValueGroup("flagCrescent", "Crescent", "#fff", [
					new ColorValue("flagMoon", "Moon"),
					new ColorValue("flagStar", "Star"),
					new ColorValueGroup("flagBorders", "Borders", "#000", [
						new ColorValue("flagMoonBorder", "Moon Border"),
						new ColorValue("flagStarBorder", "Star Border")
					])
				]),
			];
		};

	}

}
