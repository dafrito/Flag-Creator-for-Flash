package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class Scottish extends ColoredVector {
		
		public function Scottish() {
			super("Flag", "Scottish");
			this.colorList = [
				new ColorValueGroup("flagBorders", "Borders and Outlines", "#C61414", [
					new ColorValue("flagInnerBorder", "Inner Border"),
					new ColorValue("flagOuterBorder", "Outer Border"),
					new ColorValueGroup("flagBorderOutlines", "Outlines", "#000", [
						new ColorValue("flagInnerBorderOutline", "Inner Border Outline"),
						new ColorValue("flagOuterBorderOutline", "Outer Border Outline")
					])
				]),
				new ColorValue("flagBackground", "Background", "#FF0")
			];
			this.chargeGroups = [
				new ChargeValue("chargeWide", "Charge"),
				new ChargeValue("chargeCenter", "Charge")
			];
		};

	}

}