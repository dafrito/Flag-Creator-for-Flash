package bluespot.charges {
	import flash.display.MovieClip;
	import bluespot.ColoredVector;
	import bluespot.ColorValueGroup;
	import bluespot.ColorValue;
	
	
	public class Ship extends ColoredVector {
		
		public function Ship() {
			super("Charge", "Ship");
			this.colorList = [
				new ColorValue("flagSail", "Sail", "#fff"),
				new ColorValue("flagOutline", "Outline", "#000"),
				new ColorValue("flagFlags", "Flags", "#D32927")
			];
		};

	}

}
