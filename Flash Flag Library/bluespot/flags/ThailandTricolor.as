package bluespot.flags {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class ThailandTricolor extends ColoredVector {
		
		public function ThailandTricolor() {
			super("Flag", "ThailandTricolor");
			this.colorList = [
				new ColorValue("flagCenter", "Center", "#00247D"),
				new ColorValueGroup("flagEdges", "Edges", "#DE1018", [
					new ColorValue("flagTop", "Top"),
					new ColorValue("flagBottom", "Bottom")
				]),
				new ColorValueGroup("flagBorders", "Borders", "#fff", [
					new ColorValue("flagTopBorder", "Top"),
					new ColorValue("flagBottomBorder", "Bottom")
				])
			];
			this.chargeGroups = [
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValue("chargeCenter", "Center")
			];
		};

	}
}