package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class EasternDragon extends ColoredVector {
		
		public function EasternDragon() {
			super("Charge", "EasternDragon");
			this.colorList = [
				new ColorValue("flagBody", "Body", "#00386A"),
				new ColorValue("flagBodyBorder", "Body Border", "#000"),
				new ColorValue("flagMane", "Mane", "#fff"),
				new ColorValue("flagLegHair", "Tufts of Leg Hair", "#007137"),
				new ColorValueGroup("flagFace", "Face", "#fff", [
					new ColorValue("flagEyes", "Eyes"),
					new ColorValue("flagPupils", "Pupils", "#E6170F"),
					new ColorValue("flagTeeth", "Teeth"),
					new ColorValue("flagEars", "Ears"),
					new ColorValue("flagTongue", "Tongue", "#E5170F")
				]),
				new ColorValueGroup("flagScales", "Talons & Scales", "#fff", [  
					new ColorValue("flagTalons", "Talons"),
					new ColorValue("flagPiecesBorder", "Talon and Mane Border"),
					new ColorValue("flagScales", "Scales"),
					new ColorValue("flagHighlights", "Scale Highlights")
				]),
			];
		};

	}

}
