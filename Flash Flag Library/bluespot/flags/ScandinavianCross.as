package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class ScandinavianCross extends ColoredVector {
		
		public function ScandinavianCross() {
			super("Flag", "ScandinavianCross");
			this.colorList = [
				new ColorValue("flagBackground", "Background", "#D00C33"),
				new ColorValue("flagCross", "Cross", "#fff")
			];
			this.chargeGroups = [
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeCanton", "Canton"),
				new ChargeValue("chargeFly", "Fly"),
				new ChargeValue("chargeFlyCanton", "Fly Canton"),
			];
		};

	}

}