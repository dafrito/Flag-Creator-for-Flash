package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class BrunswickBicolor extends ColoredVector {
		
		public function BrunswickBicolor(defaults:Object = null) {
			super("Flag", "BrunswickBicolor");
			this.colorList = [
				new ColorValue("flagTop", "Top", "#D32927"),
				new ColorValue("flagBottom", "Bottom", "#F4C600")
			];
			this.chargeGroups = [
				new ChargeValueGroup("chargeGroup", "Charges", this, [
					new ChargeValue("chargeTop", "Top"),
					new ChargeValue("chargeBottom", "Bottom")
				])
			];
		};

	}

}
