package bluespot {
	import flash.events.Event;
	
	public class ChargeValueGroup extends ChargeValue {
		
		public function ChargeValueGroup(position:String, label:String, flag:ColoredVector = null, chargeList:Array = null) {
			super(position, label, flag);
			this.chargeList = chargeList;
		}

		private var charges:Object = {};
		private var _chargeList:Array = [];

		[Bindable (event="chargeListChanged")]
		public function get chargeList():Array {
			return this._chargeList;
		}

		public function set chargeList(chargeList:Array):void {
			this._chargeList = chargeList;
			this.updateCharge();
			this.dispatchEvent(new Event("chargeListChanged"));
		}
	
		override public function setCharge(charge:ColoredVector, position:String = null):void {
			var chargeValue:ChargeValue = this.charges[position];
			if(!chargeValue)
				throw new Error("ChargeValue wasn't found in this group '"+ position + "'");
			chargeValue.setCharge(charge);
		}
		
		override protected function updateCharge():void {
			if(!this.chargeList)
				return;
			this.charges = {};
			for each(var charge:ChargeValue in this.chargeList) {
				this.charges[charge.position] = charge;
				charge.flag = this.flag;
			}
		}
						
		override public function toXML():XML {
			var node:XML = super.toXML();
			node.setLocalName("ChargeValueGroup");
			if(this.chargeList.length) {
				for each(var chargeValue:* in this.chargeList) {
					node.appendChild(chargeValue.toXML());
				}
			}
			return node;
		}
		
		override public function fromXML(node:XML):ChargeValue {
			for each(var child:XML in node.*)
				this.charges[child.@position].fromXML(child);
			return this;
		}
	
	}
	
}
