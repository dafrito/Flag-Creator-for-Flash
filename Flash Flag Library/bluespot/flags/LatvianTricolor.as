package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValueGroup;
	
	
	public class LatvianTricolor extends ColoredVector {
		
		public function LatvianTricolor() {
			super("Flag", "LatvianTricolor");
			this.colorList = [
				new ColorValueGroup("flagBorders", "Borders", "#861623", [
					new ColorValue("flagTop", "Top"),
					new ColorValue("flagBottom", "Bottom")
				]),
				new ColorValue("flagCenter", "Center", "#fff")
			];
			this.chargeGroups = [
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValue("chargeTop", "Top"),
				new ChargeValue("chargeCenter", "Center")
			];
		};

	}
}