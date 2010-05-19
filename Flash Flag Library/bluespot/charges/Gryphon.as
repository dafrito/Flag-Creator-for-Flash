package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class Gryphon extends ColoredVector {
		
		public function Gryphon() {
			super("Charge", "Gryphon");
			this.colorList = [
				new ColorValue("flagOutline", "Outline", "#000"),
				new ColorValueGroup("flagBody", "Body", "#E83629", [
					new ColorValue("flagHead", "Head"),
					new ColorValue("flagWing", "Wing"),
					new ColorValue("flagLegs", "Legs")
				]),
				new ColorValueGroup("flagPieces", "Beak and Claws", "#FFCC00", [
					new ColorValue("flagBeak", "Beak"),
					new ColorValue("flagArms", "Arms"),
					new ColorValueGroup("flagTalons", "Talons", null, [
						new ColorValue("flagLegTalons", "Leg Talons"),
						new ColorValue("flagArmTalons", "Arm Talons", "#fff")
					])
				]),
				new ColorValue("flagTongue", "Tongue", "#E83629"),
				new ColorValueGroup("flagEyeParts", "Eye", null, [
					new ColorValue("flagEye", "Eye", "#fff"),
					new ColorValue("flagPupil", "Pupil", "#000")
				])
			];
		};

	}

}
