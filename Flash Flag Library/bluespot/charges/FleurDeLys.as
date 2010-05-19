package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class FleurDeLys extends ColoredVector {
		
		public function FleurDeLys() {
			super("Charge", "FleurDeLys");
			this.colorList = [
				new ColorValueGroup("flagBody", "Fleur de Lys", "#FCEF3C", [
					new ColorValue("flagLeft", "Left"),
					new ColorValue("flagCenter", "Center"),
					new ColorValue("flagRight", "Right"),
					new ColorValue("flagBase", "Base")
				]),
				new ColorValue("flagBand", "Band", "#FCEF3C"),
				new ColorValue("flagBorder", "Border", "#000")
			];
		}
	}

}