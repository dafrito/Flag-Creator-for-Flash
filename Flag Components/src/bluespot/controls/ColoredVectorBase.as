package bluespot.controls {
	import bluespot.ColoredVector;
	import bluespot.ColoredVectorDefinition;
	
	import flash.display.DisplayObject;
	
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.EdgeMetrics;
	import mx.core.IBorder;
	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.skins.halo.HaloBorder;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.ISimpleStyleClient;
	import mx.styles.StyleManager;
	
	[Style(name="paddingLeft", type="int")]
	
	[Style(name="paddingRight", type="int")]
	
	[Style(name="paddingTop", type="int")]
	
	[Style(name="paddingBottom", type="int")]
	
	[Style(name="verticalAlign", type="String", enumeration="bottom,middle,top")]
	
	[Style(name="horizontalAlign", type="String", enumeration="left,center,right")]
	
	[Style(name="contentBorderSkin", type="Class")]
	
	[Style(name="imageBorderSkin", type="Class")]
	
	[Style(name="borderThickness", type="Number")]
	
	[Style(name="borderStyle", type="String", inherit="no")]
	
	public class ColoredVectorBase extends UIComponent implements IListItemRenderer {
		
		private static var classConstructed:Boolean = classConstruct();
		private static function classConstruct():Boolean {
			if (!StyleManager.getStyleDeclaration("ColoredVectorBase")) {
				var styles:CSSStyleDeclaration = new CSSStyleDeclaration();
				styles.defaultFactory = function():void {
					this.paddingLeft = this.paddingRight = 4;
					this.paddingTop = this.paddingBottom = 4;
					this.imageBorderSkin = mx.skins.halo.HaloBorder;
					this.borderStyle = "solid";
					this.borderThickness = 2;
					this.verticalAlign = "middle";
					this.horizontalAlign = "center";
				}
				StyleManager.setStyleDeclaration("ColoredVectorBase", styles, true);
			}
			return true;
		}
		
		public function ColoredVectorBase() {
			super();
		}
		
		private var currentColoredVector:ColoredVector;
		private var _coloredVector:ColoredVector;
		private var coloredVectorChanged:Boolean;
		
		private var _sourceType:String;
		private var _sourceName:String;
		
		private var _definition:ColoredVectorDefinition;
		
		private var _data:Object;
		
		private var currentBorder:IFlexDisplayObject;
		private var currentImageBorder:IFlexDisplayObject;
		
		[Bindable]
		override public function set styleName(value:Object):void {
			/* Egregious hack to force the styles not to be inherited in TileLists. This is not
				necessary if we're using a regular List, since the simple workaround of setting
				styleName to null is available. */
			if(!value)
				super.styleName = value;
		} 
		
		[Bindable]
		public function get data():Object {
			return this._data;
		}
		
		public function set data(data:Object):void {
			this._data = data;
			if(data is String && this.sourceType) {
				// It's a sourceName, we assume.
				this.sourceName = data as String;
			} else if(data is ColoredVectorDefinition) {
				// It's a definition.
				this.definition = data as ColoredVectorDefinition;
			} else if(data is ColoredVector) {
				// It's a ColoredVector directly.
				var coloredVector:ColoredVector = data as ColoredVector;
				this.coloredVector = coloredVector;
			}
			// No clue, so just hold it.
		}
		
		[Bindable]
		public function get coloredVector():ColoredVector {
			return this._coloredVector;
		}
		
		public function set coloredVector(coloredVector:ColoredVector):void {
			if(coloredVector === this._coloredVector)
				return;
			this._coloredVector = coloredVector;
			if(this._coloredVector) {
				this.sourceName = coloredVector.sourceName;
				this.sourceType = coloredVector.sourceType;
				this.definition = coloredVector.definition;
			} else {
				this.sourceName = null;
				this.sourceType = null;
				this.definition = null;
			}
			this.coloredVectorChanged = true;
			this.invalidateProperties();
			this.invalidateSize();
			this.invalidateDisplayList();
		}
		
		[Bindable]
		public function get definition():ColoredVectorDefinition {
			return this._definition;
		}
		
		public function set definition(definition:ColoredVectorDefinition):void {
			if(definition === this._definition)
				return;
			this._definition = definition;
			if(this._definition) {
				this.sourceType = this._definition.sourceType;
				this.sourceName = this._definition.sourceName;
			} else {
				this.sourceName = this.sourceType = null;
			}
		}
		
		
		[Bindable]
		public function get sourceType():String {
			return this._sourceType;
		}
		
		public function set sourceType(sourceType:String):void {
			sourceType = sourceType.toLowerCase();
			if(sourceType === this._sourceType)
				return;
			if(this.sourceType && this.sourceName) {
				// Clear the name if we change types. Observe we don't clear
				// if there was no sourceType before.
				this.sourceName = null;
			}
			this._sourceType = sourceType;
			this.updateColoredVector();
		}
		
		[Bindable]
		public function get sourceName():String {
			return this._sourceName;
		}
		
		public function set sourceName(sourceName:String):void {
			sourceName = sourceName.toLowerCase();
			if(sourceName === this._sourceName)
				return;
			this._sourceName = sourceName;
			this.updateColoredVector();
		}
				
		private function updateColoredVector():void {
			if(this.sourceType && this.sourceName) {
				this.coloredVector = ColoredVector.create(this.sourceType, this.sourceName);
			} else {
				this.coloredVector = null;
			}
		}
		
		private function getBorders():void {
			if(!this.currentBorder) {
				var borderSkin:Class = this.getStyle("contentBorderSkin");
				if(borderSkin) {
					// Create a new border.
					this.currentBorder = new borderSkin();
					if(this.currentBorder is ISimpleStyleClient) {
						(this.currentBorder as ISimpleStyleClient).styleName = this;
					}
					this.currentBorder.visible = false;
					this.addChild(DisplayObject(this.currentBorder));
				}
			}
			if(!this.currentImageBorder) {
				var imageBorderSkin:Class = this.getStyle("imageBorderSkin");
				if(imageBorderSkin) {
					this.currentImageBorder = new imageBorderSkin();
					if(this.currentImageBorder is ISimpleStyleClient) {
						(this.currentImageBorder as ISimpleStyleClient).styleName = this;
					}
					this.currentImageBorder.visible = false;
					this.addChild(DisplayObject(this.currentImageBorder));
				}
			}
		}

		override public function styleChanged(styleProp:String):void {
			super.styleChanged(styleProp);
			switch(styleProp) {
				case "verticalAlign":
					invalidateDisplayList();
					break;
				case "borderSkin":
					if(this.currentBorder) {
						// Remove the old borderSkin.
						this.removeChild(DisplayObject(this.currentBorder));
					}
					break;
				case "imageBorderSkin":
					if(this.currentImageBorder) {
						// Remove the old borderSkin.
						this.removeChild(DisplayObject(this.currentImageBorder));
					}
					break;
			}
		}

		override protected function commitProperties():void {
			super.commitProperties();
			if(this.coloredVectorChanged) {
				this.coloredVectorChanged = false;
				if(this.currentColoredVector) {
					this.removeChild(this.currentColoredVector);
				}
				this.currentColoredVector = this._coloredVector;
				if(this.currentColoredVector) {
					this.currentColoredVector.visible = false;					 
					this.addChild(this.currentColoredVector);
				}
			}
		}
		
		override protected function measure():void {
			super.measure();
			
			var w:Number = 0;
			var h:Number = 0;
			
			// Add any padding we have.
			w += this.getStyle("paddingLeft") + this.getStyle("paddingRight");
			h += this.getStyle("paddingTop") + this.getStyle("paddingBottom");
			
			this.getBorders();
			var borderMetrics:EdgeMetrics;
				
			// Add the borderMetrics if available.
			if(this.currentBorder) {
				if(this.currentBorder is IBorder) {
					borderMetrics = (this.currentBorder as IBorder).borderMetrics;
				} else {
					borderMetrics = new EdgeMetrics(3, 3, 3, 3);
				}
				w += borderMetrics.left + borderMetrics.right;
				h += borderMetrics.top + borderMetrics.bottom;
			}
			
			// We have an image, so get its nominal size.
			if(this.currentColoredVector) {
				
				// Add the borderMetrics for our image if available.
				if(this.currentImageBorder) {
					if(this.currentImageBorder is IBorder) {
						borderMetrics = (this.currentImageBorder as IBorder).borderMetrics;
					} else {
						borderMetrics = new EdgeMetrics(3, 3, 3, 3);
					}
					w += borderMetrics.left + borderMetrics.right;
					h += borderMetrics.top + borderMetrics.bottom;
				}
				
				var oldScaleX:Number = this.currentColoredVector.scaleX;
				var oldScaleY:Number = this.currentColoredVector.scaleY;
				
				this.currentColoredVector.scaleX = 1.0;
				this.currentColoredVector.scaleY = 1.0;
				
				w += this.currentColoredVector.width;
				h += this.currentColoredVector.height;
				
				this.currentColoredVector.scaleX = oldScaleX;
				this.currentColoredVector.scaleY = oldScaleY
			}
			
			this.measuredWidth = w;
			this.measuredHeight = h;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			var paddingLeft:Number = this.getStyle("paddingLeft");
			var paddingRight:Number = this.getStyle("paddingRight");
			var paddingTop:Number = this.getStyle("paddingTop");
			var paddingBottom:Number = this.getStyle("paddingBottom");
			var verticalAlign:String = this.getStyle("verticalAlign");
			var horizontalAlign:String = this.getStyle("horizontalAlign");
			var imageBorderSkin:String = this.getStyle("imageBorderSkin");
			var borderSkin:String = this.getStyle("borderSkin");
			
			var left:Number = 0;
			var top:Number = 0;
			
			var contentWidth:Number = unscaledWidth;
			var contentHeight:Number = unscaledHeight;
			
			this.getBorders();
			var borderMetrics:EdgeMetrics;
				
			// Push out by any padding.
			left += paddingLeft;
			top += paddingTop;
			contentWidth -= paddingLeft + paddingRight;
			contentHeight -= paddingTop + paddingBottom;
			
			// Draw our border.
			if(this.currentBorder) {
				this.currentBorder.move(left, top);
				this.currentBorder.setActualSize(contentWidth, contentHeight)
				this.currentBorder.visible = true;
				if(this.currentBorder is IBorder) {
					borderMetrics = (this.currentBorder as IBorder).borderMetrics;
				} else {
					// Use some default values.
					borderMetrics = new EdgeMetrics(3, 3, 3, 3);
				}
				left += borderMetrics.left;
				top += borderMetrics.top;
				contentWidth -= borderMetrics.left + borderMetrics.right;
				contentHeight -= borderMetrics.top + borderMetrics.bottom;
			}
			
			var coloredVector:ColoredVector = this.currentColoredVector;
			
			// Return if there's no image.
			if(!coloredVector)
				return;
				
			// Get the metrics for our border, and adjust our position/contentArea accordingly.
			// We don't actually draw the border here because we need to know both the alignment
			// and scaled size of our ColoredVector first.
			if(this.currentImageBorder) {
				if(this.currentImageBorder is IBorder) {
					borderMetrics = (this.currentImageBorder as IBorder).borderMetrics;
				} else {
					// Use some default values.
					borderMetrics = new EdgeMetrics(3, 3, 3, 3);
				}
				left += borderMetrics.left;
				top += borderMetrics.top;
				contentWidth -= borderMetrics.left + borderMetrics.right;
				contentHeight -= borderMetrics.top + borderMetrics.bottom;
			}			
			
			// Calculate the scaled size of our ColoredVector.
			var imageHeight:Number = coloredVector.height;
			var imageWidth:Number = coloredVector.width;
			var heightRatio:Number = imageHeight / contentHeight;
			if(imageWidth / heightRatio > contentWidth) {
				// size it by the widthRatio instead.
				var widthRatio:Number = imageWidth / contentWidth;
				imageWidth = contentWidth;
				imageHeight = imageHeight / widthRatio;
			} else {
				imageHeight = contentHeight;
				imageWidth = imageWidth / heightRatio;
			}
			
			coloredVector.width = imageWidth;
			coloredVector.height = imageHeight;
			
			switch(horizontalAlign) {
				case "left":
					// Do nothing, since it's at our left.
					break;
				case "right":
					left += (contentWidth - imageWidth);
					break;
				default: // case "center":
					left += (contentWidth / 2- imageWidth / 2);
			}
			
			switch(verticalAlign) {
				case "top":
					// Do nothing, since it's at our top.
					break;
				case "bottom":
					top += contentHeight - imageHeight;
					break;
				default: // case "middle":
					top += contentHeight / 2 - imageHeight / 2;
			}
			
			coloredVector.x = left;
			coloredVector.y = top;
			
			if(coloredVector.sourceType === "Charge") {
				// Charges have a center registration point, so offset them.
				coloredVector.x += imageWidth / 2;
				coloredVector.y += imageHeight / 2;
			}
			
			if(this.currentImageBorder) {
				this.currentImageBorder.move(left - borderMetrics.left, top - borderMetrics.top);
				this.currentImageBorder.setActualSize(
					imageWidth + borderMetrics.left + borderMetrics.right,
					imageHeight + borderMetrics.top + borderMetrics.bottom
				);
				this.currentImageBorder.visible = true;
			}
			
			coloredVector.visible = true;
		}
	}
}