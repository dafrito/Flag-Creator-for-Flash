package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Lozenge extends ColoredVector {
		
		public function Lozenge() {
			super("Flag", "Lozenge");
			this.colorList = [
				new ColorValue("flagLozenges", "Lozenges", "#CE1126"),
				new ColorValue("flagBackground", "Background", "#FFF")
			];
			this.chargeGroups = [
				new ChargeValue("chargeHoist", "Hoist"),
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValue("chargeWide", "Charge")
			];
		};

	}

}