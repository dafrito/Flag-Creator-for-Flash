package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class BotswanaTricolor extends ColoredVector {
		
		public function BotswanaTricolor() {
			super("Flag", "BotswanaTricolor");
			this.colorList = [
				new ColorValue("flagCenter", "Center", "#000"),
				new ColorValueGroup("flagEdges", "Edges", "#75AADB", [
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
				new ChargeValue("chargeFlyCanton", "Fly Canton"),
				new ChargeValue("chargeCanton", "Canton"),
				new ChargeValue("chargeCenter", "Center")
			];
		};

	}
}