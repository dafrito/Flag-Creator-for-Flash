package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class BrunswickLion extends ColoredVector {
		
		public function BrunswickLion() {
			super("Charge", "BrunswickLion");
			this.colorList = [
				new ColorValue("flagLion", "Lion", "#F4C600"),
				new ColorValue("flagHighlights", "Highlights", "#D32927"),
				new ColorValue("flagEyes", "Eyes", "#F4C600")
			];
		};

	}

}
