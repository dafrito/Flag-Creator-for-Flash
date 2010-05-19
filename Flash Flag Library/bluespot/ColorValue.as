package bluespot {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import fl.motion.Color;
	
	public class ColorValue extends EventDispatcher {
		
		private var _label:String;
		public var name:String;
		
		protected var _displayObject:DisplayObject;
		private var _parent:ColorValueGroup;
		protected var _explicitColor:Color;
		
		public function ColorValue(name:String, label:String, explicitColor:* = null, _parent:ColorValueGroup = null) {
			super();
			this.name = name;
			this.label = label;
			this.explicitColor = explicitColor !== null ? ColoredVector.createColor(explicitColor) : null;
			this.parent = _parent;
		}
		
		public function toXML():XML {
			var node:XML = <ColorValue name={this.name}/>;
			if(this.explicitColor) {
				// We're using an explicit color.
				node.@color = ColoredVector.getColorString(this.explicitColor);
			}
			return node;
		}
		
		public function fromXML(node:XML):ColorValue {
			if(node.@color)
				this.explicitColor = ColoredVector.createColor(String(node.@color));
			return this;
		}
		
		public function get displayObject():DisplayObject {
			return this._displayObject;
		}
		
		public function set displayObject(displayObject:DisplayObject):void {
			if(displayObject === this._displayObject)
				return;
			if(!displayObject) {
				this._displayObject = null;
				return;
			}
			var child:DisplayObject = (displayObject as DisplayObjectContainer).getChildByName(this.name);
			if(!child)
				throw new Error("Cannot find a DisplayObject with name of: '" + this.name + "'");
			this._displayObject = child;
			this.drawColor();
		}
		
		[Bindable (event="labelChanged")]
		public function get label():String {
			return this._label;
		}
		
		public function set label(label:String):void {
			if(label === this._label)
				return;
			this._label = label;
			this.dispatchEvent(new Event("labelChanged"));
		}

		[Bindable (event="parentChanged")]
		public function get parent():ColorValueGroup {
			return this._parent;
		}

		public function set parent(parent:ColorValueGroup):void {
			if(this.parent === parent)
				return;
			this._parent = parent;
			if(this._parent) {
				this.displayObject = this._parent.displayObject;
			}
			this.updateValue();
			this.dispatchEvent(new Event("parentChanged"));
		}
		
		public function get computedColor():Color {
			var color:Color;
			var colorValue:ColorValue = this;
			while(colorValue) {
				if(colorValue.explicitColor)
					return colorValue.explicitColor;
				colorValue = colorValue.parent;
			}
			// No color!
			color = ColoredVector.createColor("#000");
			return color; 
		}

		[Bindable (event="explicitColorChanged")]
		public function get explicitColor():Color {
			return this._explicitColor;
		}

		public function set explicitColor(explicitColor:Color):void {
			if(this._explicitColor === explicitColor)
				return;
			this._explicitColor = explicitColor;
			this.updateValue();
			this.dispatchEvent(new Event("explicitColorChanged"));
		}
		
		/**
		 * explicitValue is just a convenience for functions to pass a number in to update the color.
		 */
		public function get explicitValue():uint {
			return this.explicitColor ? this.explicitColor.color : undefined;
		}
		
		public function set explicitValue(value:uint):void {
			if(this.explicitColor && this.explicitColor.color === value)
				return;
			this.explicitColor = ColoredVector.createColor(value);
		}

		[Bindable (event="computedValueChanged")]
		public function get computedValue():uint {
			return this.computedColor.color;
		}
		
		public function updateValue():void {
			this.dispatchEvent(new Event("computedValueChanged"));
			this.drawColor();
		}
		
		protected function drawColor():void {
			if(this.displayObject)
				this.displayObject.transform.colorTransform = this.computedColor;
		}
		
	}
}
