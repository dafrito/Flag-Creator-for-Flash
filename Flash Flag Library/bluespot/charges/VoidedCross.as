package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	public class VoidedCross extends ColoredVector {
		
		public function VoidedCross() {
			super("Charge", "VoidedCross");
			this.colorList = [
				new ColorValueGroup("flagCross", "Cross", "#000", [
					new ColorValueGroup("flagLeft", "Left", null, [
						new ColorValue("flagLeftTop", "Top"),
						new ColorValue("flagLeftBottom", "Bottom")
					]),
					new ColorValueGroup("flagRight", "Right", "#000", [
						new ColorValue("flagRightTop", "Top"),
						new ColorValue("flagRightBottom", "Bottom")
					])
				])
			];
		}
	}

}