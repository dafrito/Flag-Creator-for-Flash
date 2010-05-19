package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;	
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class HorizontalTricolor extends ColoredVector {
		
		public function HorizontalTricolor() {
			super("Flag", "HorizontalTricolor");
			this.colorList = [
				new ColorValue("flagMiddle", "Middle", "#FFF"),
				new ColorValueGroup("flagEdges", "Edges", null, [
					new ColorValue("flagTop", "Top", "#AE1C28"),
					new ColorValue("flagBottom", "Bottom", "#21468B")
				])
			];
			this.chargeGroups = [
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeCanton", "Canton"),
				new ChargeValue("chargeHoist", "Hoist")
			];
		};

	}

}