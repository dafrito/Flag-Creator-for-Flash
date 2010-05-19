package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	
	
	public class PortugueseCross extends ColoredVector {
		
		public function PortugueseCross() {
			super("Charge", "PortugueseCross");
			this.colorList = [
				new ColorValueGroup("flagCross", "Cross", "#fff", [
					new ColorValue("flagCrossLeft", "Left"),
					new ColorValue("flagCrossRight", "Right")
				]),
				new ColorValueGroup("flagBackground", "Background", "#C13539", [
					new ColorValue("flagBackgroundLeft", "Left"),
					new ColorValue("flagBackgroundRight", "Right")
				])
			];
		};

	}

}
