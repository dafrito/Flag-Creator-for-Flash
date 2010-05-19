package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	import bluespot.ColorValueGroup;
	
	
	public class SpanishFess extends ColoredVector {
		
		public function SpanishFess() {
			super("Flag", "SpanishFess");
			this.colorList = [
				new ColorValue("flagCenter", "Center", "#FBEA0E"),
				new ColorValueGroup("flagBorders", "Borders", "#DB000D", [
					new ColorValue("flagBottom", "Bottom"),
					new ColorValue("flagTop", "Top", "#DB000D")
				])
			];
			this.chargeGroups = [
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeHoist", "Hoist")
			];
		};

	}

}