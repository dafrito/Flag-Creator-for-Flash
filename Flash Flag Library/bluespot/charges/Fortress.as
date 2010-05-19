package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class Fortress extends ColoredVector {
		
		public function Fortress() {
			super("Charge", "Fortress");
			this.colorList = [
				new ColorValue("flagBackground", "Castle Color", "fff"),
				new ColorValueGroup("flagBlacks", "Shadow Color", "000", [
					new ColorValue("flagDarks", "Darks"),
					new ColorValue("flagOutline", "Outline"),
					new ColorValue("flagMortar", "Mortar"),
					new ColorValue("flagPorticullus", "Porticullus"),
					new ColorValue("flagGate", "Gate"),
					new ColorValue("flagDarkShadow", "Dark Shadow"),
					new ColorValue("flagLightShadow", "Light Shadow")
				])
			];
		};

	}

}
