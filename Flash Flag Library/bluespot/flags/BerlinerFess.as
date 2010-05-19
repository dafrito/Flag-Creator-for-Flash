package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	
	
	public class BerlinerFess extends ColoredVector {
		
		public function BerlinerFess() {
			super("Flag", "BerlinerFess");
			this.colorList = [
				new ColorValue("flagBackground", "Background", "#f00"),
				new ColorValue("flagMidstrip", "Midstrip", "#fff")
			];
			this.chargeGroups = [
				new ChargeValue("chargeHoist", "Hoist"),
				new ChargeValue("chargeCenter", "Center")
			];
		};

	}

}
