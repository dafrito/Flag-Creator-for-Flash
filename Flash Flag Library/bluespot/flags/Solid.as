package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Solid extends ColoredVector {
		
		public function Solid() {
			super("Flag", "Solid");
			this.colorList = [
				new ColorValue("flagBody", "Body", "#009530")
			];
			this.chargeGroups = [
				new ChargeValue("chargeHoist", "Hoist"),
				new ChargeValue("chargeHoistCanton", "Hoist Canton"),
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeCenterCanton", "Center Canton"),
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeFlyCanton", "Fly Canton"),
				new ChargeValue("chargeWide", "Wide")
			];
		};

	}

}