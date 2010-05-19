package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	
	
	public class Bear extends ColoredVector {
		public function Bear() {
			super("Charge", "Bear");
			this.colorList = [
				new ColorValue("flagBody", "Body", "#000"),
				new ColorValue("flagPieces", "Claws and Tongue", "#F00")
			];
		}
	}
}
