package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Quartered extends ColoredVector {
		
		public function Quartered() {
			super("Flag", "Quartered");
			this.colorList = [
				new ColorValue("flagTopHoist", "Top Hoist", "#00209F"),
				new ColorValue("flagBottomHoist", "Bottom Hoist", "#FFF"),
				new ColorValue("flagTopFly", "Top Fly", "#F42A41"),
				new ColorValue("flagBottomFly", "Bottom Fly", "#ff0")
			];
			this.chargeGroups = [
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValueGroup("chargeForwardSlash", "Forward Diagonal", this, [
					new ChargeValue("chargeBottomHoist", "Bottom Hoist"),
					new ChargeValue("chargeTopFly", "Top Fly")
				]),
				new ChargeValueGroup("chargeBackward", "Backward Diagonal", this, [
					new ChargeValue("chargeTopHoist", "Top Hoist"),
					new ChargeValue("chargeBottomFly", "Bottom Fly")
				])
			];
		};

	}

}