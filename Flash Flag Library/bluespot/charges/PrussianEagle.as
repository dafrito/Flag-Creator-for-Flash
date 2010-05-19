package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class PrussianEagle extends ColoredVector {
		
		public function PrussianEagle() {
			super("Charge", "PrussianEagle");
			this.colorList = [
				new ColorValueGroup("flagJewelry", "Jewels and Ornaments", "#F3D841", [
					new ColorValue("flagDarkJewels", "Dark Jewels", "#d00"),
					new ColorValue("flagLightJewels", "Light Jewels", "#fff"),
					new ColorValue("flagOrbs", "Orbs", "#718AD3"),
					new ColorValue("flagOrnaments", "Ornament Base Color"),
					new ColorValue("flagFlair", "Flair"),
					new ColorValue("flagCrown", "Crown")
				]),
				new ColorValueGroup("flagPieces", "Body Parts", "#F3D841", [
					new ColorValue("flagPupil", "Pupil", "#000"),
					new ColorValue("flagEye", "Eye", "#fff"),
					new ColorValue("flagBeak", "Beak"),
					new ColorValue("flagTongue", "Tongue", "#DD0000"),
					new ColorValue("flagNostril", "Nostril", "#000"),
					new ColorValue("flagLegs", "Legs")
				]),
				new ColorValueGroup("flagEagle", "Eagle", "#000", [
					new ColorValue("flagBody", "Body"),
					new ColorValue("flagHead", "Head")
				]),
				new ColorValueGroup("flagFigureOutlines", "Figure Outlines", "#000", [
					new ColorValue("flagHeadOutline", "Head Outline"),
					new ColorValue("flagBodyOutline", "Body Outline"),
					new ColorValue("flagCrownOutline", "Crown Outline"),
				]),
				new ColorValueGroup("flagDetailOutlines", "Detail Outlines", "#000", [
					new ColorValue("flagCrownJewelOutline", "Crown Jewel Outline"),
					new ColorValue("flagFlairOutline", "Flair Outline")
				])
			];
		};

	}
}
