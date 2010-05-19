package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	
	
	public class FimbriatedHBicolor extends ColoredVector {
		
		public function FimbriatedHBicolor(defaults:Object = null) {
			super("Flag", "FimbriatedHBicolor");
			this.colorList = [
				new ColorValue("flagTop", "Top", "#008000"),
				new ColorValue("flagMiddle", "Middle", "#F8F8F8"),
				new ColorValue("flagBottom", "Bottom", "#FF0000")
			];
			this.chargeGroups = [
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeCanton", "Canton")
			];
		};

	}
}
