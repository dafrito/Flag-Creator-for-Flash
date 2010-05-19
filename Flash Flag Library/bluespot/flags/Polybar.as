package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Polybar extends ColoredVector {
		
		public function Polybar() {
			super("Flag", "Polybar");
			this.colorList = [
				new ColorValue("flagHoist", "Hoist", "#CC3333"),
				new ColorValue("flagTopFly", "Top Fly", "#408040"),
				new ColorValue("flagCenterFly", "Center Fly", "#fff"),
				new ColorValue("flagBottomFly", "Bottom Fly", "#333333")
			];
			this.chargeGroups = [
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeHoist", "Hoist"),
				new ChargeValue("chargeCanton", "Canton")
			];
		};

	}
}