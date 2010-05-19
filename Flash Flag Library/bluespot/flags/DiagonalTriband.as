package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class DiagonalTriband extends ColoredVector {
		
		public function DiagonalTriband() {
			super("Flag", "DiagonalTriband");
			this.colorList = [
				new ColorValue("flagStripe", "Stripe", "#0099CC"),
				new ColorValueGroup("flagBackground", "Background", "#fff", [
					new ColorValue("flagHoistDiagonal", "Hoist Diagonal"),
					new ColorValue("flagFlyDiagonal", "Fly Diagonal")
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