package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class SaltireCross extends ColoredVector {
		
		public function SaltireCross() {
			super("Flag", "SaltireCross");
			this.colorList = [
				new ColorValue("flagCross", "Cross", "#F9DA00"),
				new ColorValueGroup("flagBackground", "Background", null, [
					new ColorValueGroup("flagHorizontals", "Horizontals", "#000", [
						new ColorValue("flagFly", "Fly"),
						new ColorValue("flagHoist", "Hoist")
					]),
					new ColorValueGroup("flagVerticals", "Verticals", "#308A2A", [
						new ColorValue("flagTop", "Top"),
						new ColorValue("flagBottom", "Bottom")
					])
				])
			];
			this.chargeGroups = [
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeHoist", "Hoist"),
				new ChargeValue("chargeTop", "Top")
			];
		};

	}

}