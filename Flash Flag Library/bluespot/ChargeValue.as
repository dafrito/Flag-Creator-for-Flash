package bluespot {
	import flash.events.EventDispatcher;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import flash.events.Event;
	
	public class ChargeValue extends EventDispatcher {
		
		public function ChargeValue(position:String, label:String, flag:ColoredVector = null, charge:ColoredVector = null) {
			super();
			this.position = position;
			this.label = label;
			this.flag = flag;
			this._charge = charge;
		}
		
		public var position:String;
		private var _flag:ColoredVector;
		private var _label:String;
		protected var _charge:ColoredVector;
		
		[Bindable (event="labelChanged")]
		public function get label():String {
			return this._label;
		}
		
		public function set label(label:String):void {
			this._label = label;
			this.dispatchEvent(new Event("labelChanged"));
		}
		
		[Bindable (event="chargeChanged")]
		public function get flag():ColoredVector {
			return this._flag;
		}
		
		public function set flag(flag:ColoredVector):void {
			if(flag === this._flag)
				return;
			if(this.charge && this._flag) {
				// Remove our old charge if it exists and is attached.
				this.flag.removeChild(this.charge);
			}
			this._flag = flag;
			this.updateCharge();
		}
		
		[Bindable (event="chargeChanged")]
		public function get charge():ColoredVector {
			return this._charge;
		}
		
		public function setCharge(charge:ColoredVector, position:String = null):void {
			if(charge === this._charge)
				return;
			if(this._charge && this.flag) {
				// Remove our old charge if it exists and is attached.
				this.flag.removeChild(this._charge);
			}
			this._charge = charge;
			this.updateCharge();
		}
		
		protected function updateCharge():void {
			if(!this.charge || !this.flag)
				return;
			// Attach our new charge if we have a parent.
			// The maximum sizes are saved in a DisplayObject. The name should match our
			// position.
			var chargeLocation:BoundedObject = this.flag.getChildByName(this.position) as BoundedObject;
			if(!chargeLocation) {
				throw new Error("No Charge Location found for position: '" + this.position + "'");
				// No place for this value, so return.
				return;
			}
			if(this.charge.parent !== this.flag)
				this.flag.addChild(this.charge);
			this.charge.sizeToBounds(chargeLocation.boundsRect);
			this.dispatchEvent(new Event("chargeChanged"));
		}		
		
		public function toXML():XML {
			var node:XML = <ChargeValue position={this.position}/>;
			if(this.charge)
				node.appendChild(charge.toXML());
			return node;
		}
		
		public function fromXML(node:XML):ChargeValue {
			var coloredVectorNode:XML = node.*[0];
			if(coloredVectorNode) {
				var charge:ColoredVector = ColoredVector.create(coloredVectorNode.@type, coloredVectorNode.localName());
				charge.fromXML(coloredVectorNode);
				this.setCharge(charge);
			}
			return this;
		}

	}
}
