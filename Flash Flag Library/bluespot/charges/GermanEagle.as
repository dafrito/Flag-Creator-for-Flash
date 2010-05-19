package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	
	
	public class GermanEagle extends ColoredVector {
		
		public function GermanEagle() {
			super("Charge", "GermanEagle");
			this.colorList = [
				new ColorValue("flagBody", "Body", "#131516"),
				new ColorValue("flagPieces", "Legs and Beak", "#DD0000"),
				new ColorValue("flagPupil", "Pupil", "#333333"),
				new ColorValue("flagTalons", "Talons", "#2B2828"),
				new ColorValue("flagEye", "Eye", "#FEFEFE")
			];
		};

	}

}
