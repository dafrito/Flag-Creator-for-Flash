package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Tricolor extends ColoredVector {
		
		public function Tricolor() {
			super("Flag", "Tricolor");
			this.colorList = [
				new ColorValue("flagHoist", "Hoist", "#00209F"),
				new ColorValue("flagCenter", "Center", "#FFF"),
				new ColorValue("flagFly", "Fly", "#F42A41")
			];
			this.chargeGroups = [
				new ChargeValueGroup("chargeCenter", "Three Panels", this, [
					new ChargeValue("chargeHoist", "Hoist"),
					new ChargeValue("chargeCenter", "Center"),
					new ChargeValue("chargeFly", "Fly")
				]),
				new ChargeValue("chargeWide", "Charge")
			];
		};

	}

}