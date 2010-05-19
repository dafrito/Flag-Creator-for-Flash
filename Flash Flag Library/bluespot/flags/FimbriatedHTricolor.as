package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	public class FimbriatedHTricolor extends ColoredVector {
		
		public function FimbriatedHTricolor() {
			super("Flag", "FimbriatedHTricolor");
			this.colorList = [
				new ColorValue("flagCenter", "Center", "#0033CC"),
				new ColorValueGroup("flagEdges", "Edges", "#000", [
					new ColorValue("flagTop", "Top", "#CE1126"),
					new ColorValue("flagBottom", "Bottom", "#3A7728")
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