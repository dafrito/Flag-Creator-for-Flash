package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class Sword extends ColoredVector {
		
		public function Sword() {
			super("Charge", "Sword");
			this.colorList = [
				new ColorValue("flagBlade", "Blade", "#fff"),
				new ColorValue("flagHighlight", "Highlight", "#96877D"),
				new ColorValue("flagHilt", "Hilt", "#F7E017"),
				new ColorValueGroup("flagBorders", "Borders", "#000", [
					new ColorValue("flagBladeBorder", "Blade Border"),
					new ColorValue("flagHiltBorder", "Hilt Border")
				])
			];
		};

	}

}
