package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Pall extends ColoredVector {
		
		public function Pall() {
			super("Flag", "Pall");
			this.colorList = [
				new ColorValue("flagChevron", "Chevron", "#000"),
				new ColorValue("flagStripe", "Stripe", "#007C59"),
				new ColorValueGroup("flagBackground", "Background", null, [
					new ColorValue("flagBottom", "Bottom", "#0C1C8C"),
					new ColorValue("flagTop", "Top", "#E23D28")
				]),
				new ColorValueGroup("flagBorders", "Borders", "#fff", [
					new ColorValue("flagBottomBorder", "Bottom"),
					new ColorValue("flagTopBorder", "Top")
				])
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