package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class ChevronTricolor extends ColoredVector {
		
		public function ChevronTricolor() {
			super("Flag", "ChevronTricolor");
			this.colorList = [
				new ColorValue("flagPall", "Chevron", "#000"),
				new ColorValue("flagCenter", "Stripe", "#FAE042"),
				new ColorValueGroup("flagBackground", "Background", "#00ABC9", [
					new ColorValue("flagBottom", "Bottom"),
					new ColorValue("flagTop", "Top")
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