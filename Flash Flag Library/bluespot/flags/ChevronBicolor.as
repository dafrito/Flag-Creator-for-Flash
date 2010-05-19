package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class ChevronBicolor extends ColoredVector {
		
		public function ChevronBicolor() {
			super("Flag", "ChevronBicolor");
			this.colorList = [
				new ColorValue("flagPall", "Chevron", "#11457E"),
				new ColorValue("flagBottom", "Bottom", "#D7141A"),
				new ColorValue("flagTop", "Top", "#fff")
			];
			this.chargeGroups = [
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeFlyCanton", "Fly Canton"),
				new ChargeValue("chargeHoist", "Hoist")
			];
		};

	}

}