package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Cross extends ColoredVector {
		
		public function Cross() {
			super("Flag", "Cross");
			this.colorList = [
				new ColorValue("flagBackground", "Background", "#000"),
				new ColorValue("flagCrossBorder", "Cross", "#fff")
			];
			this.chargeGroups = [
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeFlyCanton", "Fly Canton"),
				new ChargeValue("chargeCanton", "Canton"),
				new ChargeValue("chargeHoist", "Hoist")
			];
		};

	}

}