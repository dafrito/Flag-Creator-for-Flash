package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	
	
	public class SquareEmblem extends ColoredVector {
		
		public function SquareEmblem() {
			super("Flag", "SquareEmblem");
			this.colorList = [
				new ColorValue("flagBackground", "Background", "#FFCE00"),
				new ColorValue("flagBorder", "Border", "#d00")
			];
		this.chargeGroups = [
			new ChargeValue("chargeCenter", "Center")
		];
		};
	}

}
