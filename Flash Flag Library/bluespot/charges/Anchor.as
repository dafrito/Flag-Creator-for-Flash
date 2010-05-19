package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	public class Anchor extends ColoredVector {
		
		public function Anchor() {
			super("Charge", "Anchor");
			this.colorList = [
				new ColorValueGroup("flagAnchor", "Anchor", "#FFCC00", [
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