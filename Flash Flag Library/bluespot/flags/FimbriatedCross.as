package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class FimbriatedCross extends ColoredVector {
		
		public function FimbriatedCross() {
			super("Flag", "FimbriatedCross");
			this.colorList = [
				new ColorValue("flagBackground", "Background", "#FADC0A"),
				new ColorValue("flagBorder", "Border", "#FE0000"),
				new ColorValue("flagCross", "Cross", "#fff")
			];
			this.chargeGroups = [
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeCanton", "Canton")
			];
		};

	}

}