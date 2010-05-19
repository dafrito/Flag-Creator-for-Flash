package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class VerticalBicolor extends ColoredVector {
		
		public function VerticalBicolor() {
			super("Flag", "VerticalBicolor");
			this.colorList = [
				new ColorValue("flagHoist", "Hoist", "#7F0000"),
				new ColorValue("flagFly", "Fly", "#FF7300")
			];
			this.chargeGroups = [
				new ChargeValue("chargeWide", "Charge"),
				new ChargeValue("chargeCenter", "Charge"),
				new ChargeValue("chargeCanton", "Charge"),
				new ChargeValueGroup("chargePanels", "Two Panels", this, [
					new ChargeValue("chargeHoist", "Hoist"),
					new ChargeValue("chargeFly", "Fly")
				])
			];
		};

	}

}
