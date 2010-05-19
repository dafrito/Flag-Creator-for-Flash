package bluespot.flags {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValue;
	import bluespot.ColorValueGroup;	
	import bluespot.ChargeValue;
	import bluespot.ChargeValueGroup;
	
	
	public class PrussianTricolor extends ColoredVector {
		
		public function PrussianTricolor() {
			super("Flag", "PrussianTricolor");
			this.colorList = [
				new ColorValue("flagCenter", "Center", "#fff"),
				new ColorValueGroup("flagEdges", "Edges", "#000", [
					new ColorValue("flagTop", "Top"),
					new ColorValue("flagBottom", "Bottom")
				])
			];
			this.chargeGroups = [
				new ChargeValue("chargeWide", "Wide"),
				new ChargeValue("chargeCenter", "Center"),
				new ChargeValue("chargeHoist", "Hoist")
			];
		};

	}

}