package bluespot {
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	public class ColorValueGroup extends ColorValue {

		public function ColorValueGroup(id:String, label:String, explicitColor:* = null, values:Array = null) {
			super(id, label, explicitColor);
			this.values = values;
		}
		
		private var _values:Array;
		
		override public function toXML():XML {
			var node:XML = super.toXML();
			node.setLocalName("ColorValueGroup");
			if(this.values) {
				for each(var colorValue:ColorValue in this.values)
					node.appendChild(colorValue.toXML());
			}
			return node;
		}
		
		[Bindable (event=valuesChanged)]
		public function get values():Array {
			return this._values;
		}
		
		public function set values(values:Array):void {
			if(values === this._values)
				return;
			if(this._values) {
				for each(var colorValue:ColorValue in this.values)
					colorValue.parent = null;					
			}
			this._values = values;
			if(this._values) {
				for each(colorValue in this.values)
					colorValue.parent = this;
			}
			this.dispatchEvent(new Event("valuesChanged"));
		}

		override public function set displayObject(displayObject:DisplayObject):void {
			if(displayObject === this._displayObject)
				return;
			this._displayObject = displayObject;
			if(this.values) {
				for each(var colorValue:ColorValue in this.values)
					colorValue.displayObject = this._displayObject;;
			}
		}

		override public function updateValue():void {
			this.dispatchEvent(new Event("computedValueChanged"));
			if(!this.values)
				return;
			for each(var colorValue:ColorValue in this.values)
				colorValue.updateValue();
		}

	}
}
