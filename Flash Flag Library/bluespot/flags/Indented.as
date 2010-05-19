package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	
	
	public class Indented extends ColoredVector {
		
		public function Indented(defaults:Object = null) {
			super("Flag", "Indented");
			this.colorList = [
				new ColorValue("flagLeft", "Left", "#fff"),
				new ColorValue("flagRight", "Right", "#CE1126")
			];
			this.chargeGroups = [
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeIndented", "Indented"),
				new ChargeValue("chargeHoist", "Hoist")
			];
		};

	}

}
