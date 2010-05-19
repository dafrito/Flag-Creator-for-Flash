package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Tribar extends ColoredVector {
		
		public function Tribar() {
			super("Flag", "Tribar");
			this.colorList = [
				new ColorValue("flagHoist", "Hoist", "#008751"),
				new ColorValue("flagTopFly", "Top Fly", "#FCD116"),
				new ColorValue("flagBottomFly", "Bottom Fly", "#E8112D")
			];
			this.chargeGroups = [
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeHoist", "Hoist"),
				new ChargeValue("chargeCanton", "Canton")
			];
		};

	}
}