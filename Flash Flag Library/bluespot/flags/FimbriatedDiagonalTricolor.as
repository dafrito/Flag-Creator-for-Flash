package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class FimbriatedDiagonalTricolor extends ColoredVector {
		
		public function FimbriatedDiagonalTricolor() {
			super("Flag", "FimbriatedDiagonalTricolor");
			this.colorList = [
				new ColorValue("flagStripe", "Stripe", "#000"),
				new ColorValueGroup("flagBorders", "Borders", "#fff", [
					new ColorValue("flagHoistBorder", "Hoist Border"),
					new ColorValue("flagFlyBorder", "Fly Border")
				]),
				new ColorValueGroup("flagBackground", "Background", "#CE1126", [
					new ColorValue("flagHoist", "Hoist"),
					new ColorValue("flagFly", "Fly")
				]),
			];
			this.chargeGroups = [
				new ChargeValueGroup("chargeSides", "Sides", this, [
					new ChargeValue("chargeHoist", "Hoist"),
					new ChargeValue("chargeFly", "Fly")
				]),
				new ChargeValue("chargeCenter", "Center")
			];
		};

	}

}