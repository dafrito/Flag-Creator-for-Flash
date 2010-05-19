package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	
	
	public class AquitaineLion extends ColoredVector {
		
		public function AquitaineLion() {
			super("Charge", "AquitaineLion");
			this.colorList = [
				new ColorValue("flagBody", "Body", "#F1BC03"),
				new ColorValue("flagOutline", "Outline", "#6A2D2D"),
				new ColorValue("flagClaws", "Claws", "#006"),
				new ColorValue("flagEyes", "Eyes", "#fff"),
				new ColorValue("flagMouth", "Mouth", "#3E0000")
			];
		};

	}

}
