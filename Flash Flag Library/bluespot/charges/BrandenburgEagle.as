package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class BrandenburgEagle extends ColoredVector {
		
		public function BrandenburgEagle() {
			super("Charge", "BrandenburgEagle");
			this.colorList = [
				new ColorValueGroup("flagBodyParts", "Body", "#E60000", [
					new ColorValue("flagBody", "Body"),
					new ColorValue("flagTongue", "Tongue"),
					new ColorValue("flagEye", "Eye", "#fff")
				]),
				new ColorValue("flagOutline", "Outline", "#000"),
				new ColorValueGroup("flagFlair", "Beak, Flair, and Legs", "#FDE44A", [
					new ColorValue("flagLegs", "Legs"),
					new ColorValue("flagFlair", "Flair"),
					new ColorValue("flagBeak", "Beak")
				]),
				new ColorValue("flagShield", "Shield", "#fff"),
				new ColorValue("flagShieldBorder", "Shield Border", "#000"),
			];
		};

	}

}
