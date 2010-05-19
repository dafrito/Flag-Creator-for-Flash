package bluespot.controls
{
	import mx.controls.Button;
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	import flash.display.DisplayObject;
	import mx.styles.ISimpleStyleClient;

	[Style(name="fontSize", type="Number", format="Length", inherit="yes")]

	[Style(name="horizontalGap", type="int", inheriting="false")]

	[Style(name="verticalAlign", type="String", enumeration="bottom,middle,top")]
	
	[Style(name="iconScale", type="Number", inheriting="false")]
	
	[Style(name="paddingLeft", type="int", inherit="false")]
	
	[Style(name="paddingRight", type="int", inheriting="false")]
	
	[Style(name="paddingTop", type="int", inheriting="false")]
	
	[Style(name="paddingBottom", type="int", inheriting="false")]
	
	[Style(name="color", type="uint", inherit="yes")]
	
	public class IconLabel extends UIComponent {
		
		private static var classConstructed:Boolean = classConstruct();
		private static function classConstruct():Boolean {
			if (!StyleManager.getStyleDeclaration("IconLabel")) {
				var styles:CSSStyleDeclaration = new CSSStyleDeclaration();
				styles.defaultFactory = function():void {
					this.horizontalGap = 6;
					this.verticalAlign = "middle";
					this.fontSize = 60;
					this.iconScale = 1
					this.paddingLeft = this.paddingRight = 4;
					this.paddingTop = this.paddingBottom = 2;
					this.labelSkin = Label;
				}
				StyleManager.setStyleDeclaration("IconLabel", styles, true);
			}
			return true;
		}
		
		public function IconLabel() {
			super();
		}
		
		protected var currentIcon:Image;
		protected var label:UIComponent;
		
		private var sourceChanged:Boolean;
		protected var _source:Object;
		[Bindable]
		public function get source():Object {
			return this._source;
		}
		
		public function set source(source:Object):void {
			if(this._source === source)
				return;
			this._source = source;
			this.sourceChanged = true;
			this.invalidateProperties();
			this.invalidateDisplayList();
		}
		
		private var _text:String;
		private var textChanged:Boolean;
		public function set text(text:String):void {
			if(text === this._text)
				return;
			this._text = text;
			this.textChanged = true;
			this.invalidateProperties();
			this.invalidateSize();
		}
		
		override public function styleChanged(styleProp:String):void {
			super.styleChanged(styleProp);
			switch(styleProp) {
				case "horizontalGap":
				case "verticalAlign":
				case "iconScale":
				case "paddingLeft":
				case "paddingTop":
				case "paddingBottom":
				case "paddingRight":
					invalidateSize();
					invalidateDisplayList();
					break;	
			}
					
		}
		
		override protected function createChildren():void {
			super.createChildren();
			if(this.label === null) {
				this.label = new (this.getStyle("labelSkin"))();
			}
			addChild(this.label);
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			if(this.sourceChanged) {
				this.sourceChanged = false;
				if(this._source) {
					if(!this.currentIcon) {
						this.currentIcon = new Image();
						this.currentIcon.setStyle("verticalAlign", "middle");
					}
					this.currentIcon.source = this._source;
					this.addChild(this.currentIcon);
					
				} else if(this.currentIcon) {
					this.removeChild(this.currentIcon);
					this.currentIcon = null;
				}
			}
			if(this.textChanged) {
				this.textChanged = false;
				if(this.label is Label) {
					(this.label as Label).text = this._text;
				} else if(this.label is Button) {
					(this.label as Button).label = this._text;
				}
			}
		}
		
		override protected function measure():void {
			super.measure();
			var w:int = 0;
			var h:int = 0;
			
			// Add our padding
			w += this.getStyle("paddingLeft") + this.getStyle("paddingRight");
			h += this.getStyle("paddingTop") + this.getStyle("paddingBottom");
			
			// Add the height of the text, multiplied by our iconScale to get the iconSize.
			var iconSize:int = this.label.getExplicitOrMeasuredHeight() * this.getStyle("iconScale");
			
			// Our icon lives inside a square, with the dimensions defined by iconSize, so add that to our width as well.
			w += iconSize;
			h += iconSize;

			// Add the horizontal gap.
			w += iconSize / this.getStyle("horizontalGap");
			
			// Finally, add the Label's width.
			w += this.label.getExplicitOrMeasuredWidth();
			 
			this.measuredWidth = this.measuredMinWidth = w;
			this.measuredHeight = this.measuredMinHeight = h;
		}
		
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			var borderSkin:IFlexDisplayObject = IFlexDisplayObject(this.getChildByName("borderSkin"));
			if(!borderSkin) {
				borderSkin = new (this.getStyle("borderSkin"));
				borderSkin.name = "borderSkin";
				if(borderSkin is ISimpleStyleClient)
					(borderSkin as ISimpleStyleClient).styleName = this;
				this.addChild(DisplayObject(borderSkin));
			}
			
			borderSkin.setActualSize(unscaledWidth, unscaledHeight);
			
			var paddingLeft:int = this.getStyle("paddingLeft");
			var paddingRight:int = this.getStyle("paddingRight");
			var paddingTop:int = this.getStyle("paddingTop");
			var paddingBottom:int = this.getStyle("paddingBottom");
			var horizontalGap:int = this.getStyle("horizontalGap");
			var verticalAlign:String = this.getStyle("verticalAlign").toLowerCase();
			var textHeight:int = this.label.getExplicitOrMeasuredHeight();
			
			var left:int = paddingLeft;
			var top:int = paddingTop;
			
			var iconSize:int = unscaledHeight - paddingTop - paddingBottom; 
			
			horizontalGap = iconSize / this.getStyle("horizontalGap");
			
			if(this.currentIcon) {
				this.currentIcon.move(left, top);
				this.currentIcon.setActualSize(iconSize, iconSize);
				left += iconSize;
			}
			
			left += horizontalGap;
			
			switch(verticalAlign) {
				case "top":
					this.label.move(left, top);		
					break;
				case "bottom":
					this.label.move(left, unscaledHeight - paddingBottom - textHeight);	
				default: // case "middle":
					this.label.move(left, (unscaledHeight / 2) - (textHeight / 2));
			}
			this.label.setActualSize(unscaledWidth - paddingRight, textHeight);
		}
		
		
	}
}