package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	public class Trident extends ColoredVector {
		
		public function Trident() {
			super("Charge", "Trident");
			this.colorList = [new ColorValueGroup("flagTrident", "Trident", "#292929", [
				new ColorValue("flagLeft", "Left"),
				new ColorValue("flagRight", "Right")
			])];
		};

	}

}
