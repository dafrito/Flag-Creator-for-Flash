package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class NorwegianCross extends ColoredVector {
		
		public function NorwegianCross() {
			super("Flag", "NorwegianCross");
			this.colorList = [
				new ColorValue("flagBackground", "Background", "#EF2B2D"),
				new ColorValue("flagBorder", "Border", "#fff"),
				new ColorValue("flagCross", "Cross", "#002868")
			];
			this.chargeGroups = [
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeFlyCanton", "Fly Canton"),
				new ChargeValue("chargeCanton", "Canton")
			];
		};

	}

}