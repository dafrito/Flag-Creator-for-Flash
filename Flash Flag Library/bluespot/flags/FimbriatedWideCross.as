package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class FimbriatedWideCross extends ColoredVector {
		
		public function FimbriatedWideCross() {
			super("Flag", "FimbriatedWideCross");
			this.colorList = [
				new ColorValue("flagBackground", "Background", "#000"),
				new ColorValue("flagBorder", "Border", "#fff"),
				new ColorValue("flagCross", "Cross", "#CF142B")
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