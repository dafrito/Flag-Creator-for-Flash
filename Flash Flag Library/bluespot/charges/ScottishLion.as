package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	public class ScottishLion extends ColoredVector {
		
		public function ScottishLion() {
			super("Charge", "ScottishLion");
			this.colorList = [
				new ColorValue("flagBody", "Body", "#CA2412"),
				new ColorValueGroup("flagFace", "Head & Features", "#CCC", [
					new ColorValue("flagHead", "Head"),
					new ColorValue("flagEye", "Eye", "#000"),
					new ColorValue("flagTongue", "Tongue", "#35879B")
				]),
				new ColorValue("flagTalons", "Talons", "#35879B"),
				new ColorValueGroup("flagBorders", "Borders", "#000", [
					new ColorValue("flagHeadBorder", "Head Border"),
					new ColorValue("flagBodyBorder", "Body Border"),
					new ColorValue("flagTalonBorder", "Talon Border")
				])
			];
		};

	}

}
