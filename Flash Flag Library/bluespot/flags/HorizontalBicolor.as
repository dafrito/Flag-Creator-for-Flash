package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	
	
	public class HorizontalBicolor extends ColoredVector {
		
		public function HorizontalBicolor(defaults:Object = null) {
			super("Flag", "HorizontalBicolor");
			this.colorList = [
				new ColorValue("flagTop", "Top", "#E60000"),
				new ColorValue("flagBottom", "Bottom", "#fff")
			];
			this.chargeGroups = [
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValue("chargeTop", "Top"),
				new ChargeValue("chargeHoist", "Hoist"),
				new ChargeValue("chargeCanton", "Canton")
			];
		};

	}

}
