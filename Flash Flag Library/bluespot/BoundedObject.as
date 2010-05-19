package bluespot {
	import flash.geom.Rectangle;
	import flash.display.MovieClip;
	
	public class BoundedObject extends flash.display.MovieClip {
		
		public function get boundsRect():Rectangle {
			return new Rectangle(
				this.x,
				this.y,
				this.width,
				this.height
			);
		}
		
		public function BoundedObject() {
			super();
		}

		public function sizeToBounds(bounds:Rectangle):void {
			this.x = bounds.x;
			this.y = bounds.y;
			var heightRatio:Number = this.height / bounds.height;
			if(this.width / heightRatio > bounds.width) {
				// size it by the widthRatio instead.
				var widthRatio:Number = this.width / bounds.width;
				this.width = bounds.width;
				this.height = this.height / widthRatio;
			} else {
				this.height = bounds.height;
				this.width = this.width / heightRatio;
			}
		}

	}

}
