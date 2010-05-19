package bluespot {
	import bluespot.charges.*;
	import bluespot.flags.*;
	
	import flash.events.Event;
	
	import fl.motion.Color;
	
	public class ColoredVector extends BoundedObject {
		
		private static var registries:Object = {};
		private static var registryLists:Object = {};
		private static var initialized:Boolean = false;
		
		public static var SUPPRESS_INVALID_XML:Boolean = false;
		
		/**
		 * Registers all our charges and flags. You should not have to call this, since it's done on-demand.
		 */
		private static function initialize():void {
			if(initialized)
				return;
			
			ColoredVector.register("Flag", "BerlinerFess", "Berliner Fess", BerlinerFess);
			ColoredVector.register("Flag", "BotswanaTricolor", "Botswana Tricolor", BotswanaTricolor);
			ColoredVector.register("Flag", "BrunswickBicolor", "Brunswick Bicolor", BrunswickBicolor);
			ColoredVector.register("Flag", "ChevronBicolor", "Chevron Bicolor", ChevronBicolor);
			ColoredVector.register("Flag", "ChevronTricolor", "Chevron Tricolor", ChevronTricolor);
			ColoredVector.register("Flag", "Cross", "Cross", Cross);
			ColoredVector.register("Flag", "DiagonalTriband", "Diagonal Triband", DiagonalTriband);
			ColoredVector.register("Flag", "FimbriatedCross", "Fimbriated Cross", FimbriatedCross);
			ColoredVector.register("Flag", "FimbriatedDiagonalTricolor", "Fimbriated Diagonal Tricolor", FimbriatedDiagonalTricolor);
			ColoredVector.register("Flag", "FimbriatedHBicolor", "Fimbriated Horizontal Bicolor", FimbriatedHBicolor);
			ColoredVector.register("Flag", "FimbriatedHTricolor", "Fimbriated Horizontal Tricolor", FimbriatedHTricolor);
			ColoredVector.register("Flag", "FimbriatedWideCross", "Fimbriated Wide Cross", FimbriatedWideCross);
			ColoredVector.register("Flag", "HorizontalBicolor", "Horizontal Bicolor", HorizontalBicolor);
			ColoredVector.register("Flag", "HorizontalTricolor", "Horizontal Tricolor", HorizontalTricolor);
			ColoredVector.register("Flag", "Indented", "Indented", Indented);
			ColoredVector.register("Flag", "LatvianTricolor", "Latvian Tricolor", LatvianTricolor);
			ColoredVector.register("Flag", "Lozenge", "Lozenge", Lozenge);
			ColoredVector.register("Flag", "NorwegianCross", "Norwegian Cross", NorwegianCross);
			ColoredVector.register("Flag", "Pall", "Pall", Pall);
			ColoredVector.register("Flag", "Polybar", "Polybar", Polybar);
			ColoredVector.register("Flag", "PrussianTricolor", "Prussian Tricolor", PrussianTricolor);
			ColoredVector.register("Flag", "Quartered", "Quartered", Quartered);
			ColoredVector.register("Flag", "SaltireCross", "Saltire Cross", SaltireCross);
			ColoredVector.register("Flag", "ScandinavianCross", "ScandinavianCross", ScandinavianCross);
			ColoredVector.register("Flag", "Scottish", "Scottish", Scottish);
			ColoredVector.register("Flag", "Solid", "Solid", Solid);
			ColoredVector.register("Flag", "SpanishFess", "Spanish Fess", SpanishFess);
			ColoredVector.register("Flag", "SquareEmblem", "Square Emblem", SquareEmblem);
			ColoredVector.register("Flag", "ThailandTricolor", "Thailand Tricolor", ThailandTricolor);
			ColoredVector.register("Flag", "Tribar", "Tribar", Tribar);
			ColoredVector.register("Flag", "Tricolor", "Tricolor", Tricolor);
			ColoredVector.register("Flag", "VerticalBicolor", "Vertical Bicolor", VerticalBicolor);
			ColoredVector.register("Charge", "Anchor", "Anchor", Anchor);
			ColoredVector.register("Charge", "AquitaineLion", "Aquitaine Lion", AquitaineLion);
			ColoredVector.register("Charge", "Bear", "Bear", Bear);
			ColoredVector.register("Charge", "BrandenburgEagle", "Brandenburg Eagle", BrandenburgEagle);
			ColoredVector.register("Charge", "BrunswickLion", "Brunswick Lion", BrunswickLion);
			ColoredVector.register("Charge", "Circle", "Circle", Circle);
			ColoredVector.register("Charge", "ComposedCross", "Composed Cross", ComposedCross);
			ColoredVector.register("Charge", "ComposedFitchyCross", "Composed Fitchy Cross", ComposedFitchyCross);
			ColoredVector.register("Charge", "Crescent", "Crescent", Crescent);
			ColoredVector.register("Charge", "EasternDragon", "Eastern Dragon", EasternDragon);
			ColoredVector.register("Charge", "FleurDeLys", "Fleur de Lys", FleurDeLys);
			ColoredVector.register("Charge", "FloryCross", "Flory Cross", FloryCross);
			ColoredVector.register("Charge", "Fortress", "Fortress", Fortress);
			ColoredVector.register("Charge", "GermanEagle", "German Eagle", GermanEagle);
			ColoredVector.register("Charge", "Gryphon", "Gryphon", Gryphon);
			ColoredVector.register("Charge", "MolineCross", "Moline Cross", MolineCross);
			ColoredVector.register("Charge", "PortugueseCross", "Portuguese Cross", PortugueseCross);
			ColoredVector.register("Charge", "PotentCross", "Potent Cross", PotentCross);
			ColoredVector.register("Charge", "PrussianEagle", "Prussian Eagle", PrussianEagle);
			ColoredVector.register("Charge", "SantiagoCross", "Santiago Cross", SantiagoCross);
			ColoredVector.register("Charge", "ScottishLion", "ScottishLion", ScottishLion);
			ColoredVector.register("Charge", "Ship", "Ship", Ship);
			ColoredVector.register("Charge", "Star", "Star", Star);
			ColoredVector.register("Charge", "Sword", "Sword", Sword);
			ColoredVector.register("Charge", "ThornCrown", "Crown of Thorns", ThornCrown);
			ColoredVector.register("Charge", "Trident", "Trident", Trident);
			ColoredVector.register("Charge", "VoidedCross", "Voided Cross", VoidedCross);
			
			initialized = true;
		}
			
		/**
		 * Creates a fl.motion.Color from some value.
		 * 
		 * @param value The value to create a color from. Accepted values include:
		 *  - Strings of the form #000, 000, 0xfff, etc.
		 *  - uints corresponding to real color values.
		 *  - Colors, which are directly returned.
		 */
		public static function createColor(value:*):Color {
			if(value is Color)
				return value as Color;
			var color:Color = new Color();
			if((value is String) && (value as String).match(/^(\d{2}\.)?(#|0x)?([\dA-F]{3}|[\dA-F]{6}$)/i)) {
				var colorString:String = value as String;
				if(colorString.match(/^\d{2}\./)) {
					color.alphaMultiplier = parseInt(colorString.slice(0, 2), 10) / 100;
					colorString = colorString.slice(3);
				}
				if(colorString.match(/^#/))
					colorString = colorString.replace(/^#(.*)/, "$1");
				if(colorString.length === 3)
					colorString = colorString.replace(/(.)(.)(.)/, "$1$1$2$2$3$3");
				color.color = parseInt(colorString, 16);
				return color;
			}
			if(value is Number) {
				color.color = value;
				return color;
			}
			throw new Error("Unexpected value given: '" + value + "'");
		}
		
		/**
		 * Gets a valid color string of the form #ff0000, from a given color.
		 * 
		 * @param color The color value to get a string from. If it's a fl.motion.Color, it's color value is used. Otherwise, it's
		 * assumed to be a uint, or something castable as such.
		 */
		public static function getColorString(color:Object):String {
			if(color is Color)
				color = color.color
			var colorString:String = (color as uint).toString(16);
			while(colorString.length < 6)
				colorString = "0" + colorString;
			return "#" + colorString;
		}

		/**
		 * Creates a ColoredVector from an XML describing one.
		 * 
		 * @param node The XML describing the ColoredVector. If this syntax is invalid, then a solid pink flag is returned.
		 */
		public static function createFromXML(node:XML):ColoredVector {
			var coloredVector:ColoredVector;
			if(ColoredVector.SUPPRESS_INVALID_XML) {
				try {
					coloredVector = create(node.@type, node.localName());
					coloredVector = coloredVector.fromXML(node);
				} catch(e:Error) {
					trace(e);
					coloredVector = ColoredVector.create("Flag", "Solid");
					coloredVector.setColor("flagBody", "#f0f");
				}
			} else {
				coloredVector = create(node.@type, node.localName());
				coloredVector = coloredVector.fromXML(node);
			}
			return coloredVector;
		}
		
		public static function getRegistryList(sourceType:String):Array {
			sourceType = sourceType.toLowerCase();
			if(!initialized)
				initialize();
			var registryList:Array = registryLists[sourceType];
			if(!registryList) {
				registries[sourceType] = {};
				registryList = ColoredVector.registryLists[sourceType] = [];
			}
			return registryList;
		}
		
		public static function getDefinition(sourceType:String, sourceName:String):ColoredVectorDefinition {
			sourceType = sourceType.toLowerCase();
			sourceName = sourceName.toLowerCase();
			if(!initialized)
				initialize();
			var registry:Object = ColoredVector.registries[sourceType];
			if(!registry)
				throw new Error("No registry for type: '" + sourceType + "'");
			return registry[sourceName];
		}
		
		public static function create(sourceType:String, sourceName:String, defaults:Object = null):ColoredVector {
			sourceType = sourceType.toLowerCase();
			sourceName = sourceName.toLowerCase();
			var definition:ColoredVectorDefinition = ColoredVector.getDefinition(sourceType, sourceName);
			if(!definition)
				throw new Error("No definition with id: '" + sourceName + "', with type: '" + sourceType + "'");
			var coloredVector:ColoredVector = definition.create();
			if(defaults is Array)
				coloredVector.colorList = defaults as Array;
			else if(defaults)
				coloredVector.colors = defaults;
			return coloredVector;
		}
		
		public static function register(sourceType:String, sourceName:String, label:String, coloredVectorClass:Class):void {
			sourceType = sourceType.toLowerCase();
			sourceName = sourceName.toLowerCase();
			var registry:Object = registries[sourceType];
			var registryList:Array = registryLists[sourceType];
			if(!registry) {
				registry = registries[sourceType] = {};
				registryList = registryLists[sourceType] = [];
			}
			if(registry[sourceName])
				throw new Error("FlagFactory already has a class registered for id '" + sourceName + "'");
			registryList.push(registry[sourceName] = new ColoredVectorDefinition(sourceType, sourceName, label, coloredVectorClass));
		}
		
		public function ColoredVector(sourceType:String, sourceName:String) {
			super();
			this.sourceType = sourceType;
			this.sourceName = sourceName;
		}
		
		protected var _definition:ColoredVectorDefinition;
		public var sourceName:String;
		public var sourceType:String;
		
		private var _chargeGroups:Array = [];
		private var _selectedChargeGroup:ChargeValue;
		private var _colorList:Array = [];
		private var _colors:Object = {};

		public function set definition(definition:ColoredVectorDefinition):void {
			this._definition = definition;
			this.sourceType = this._definition.sourceType;
			this.sourceName = this._definition.sourceName;
		}
		
		public function get definition():ColoredVectorDefinition {
			if(!this._definition) {
				this._definition = ColoredVector.getDefinition(this.sourceType, this.sourceName);
			}
			return this._definition;
		}
								
		[Bindable (event="chargeGroupsChanged")]  
		public function get chargeGroups():Array {
			return this._chargeGroups;
		}
		
		public function set chargeGroups(groups:Array):void {
			if(groups === this._chargeGroups)
				return;
			if(this._chargeGroups) {
				for each(var group:Object in this._chargeGroups) {
					if(group.flag === this)
						group.flag = null;
				}
			}
			this._chargeGroups = groups;
			for(var i:int = 0; i < groups.length; i++) {
				this._chargeGroups[i].flag = this;
			}
			this.dispatchEvent(new Event("chargeGroupsChanged"));
		}

		[Bindable (event="selectedChargeGroupChanged")]
		public function get selectedChargeGroup():ChargeValue {
			return this._selectedChargeGroup;
		}
		
		public function set selectedChargeGroup(group:ChargeValue):void {
			if(group === this._selectedChargeGroup)
				return;
			var carriedCharge:ColoredVector;
			if(this._selectedChargeGroup) {
				this._selectedChargeGroup.flag = null;
				if(!(this._selectedChargeGroup is ChargeValueGroup) && this._selectedChargeGroup.charge && !(group is ChargeValueGroup)) {
					// Steal the charge if it's just a ChargeValue for more intuitive behavior.
					carriedCharge = this._selectedChargeGroup.charge;
					this._selectedChargeGroup.setCharge(null);
				}
			}
			this._selectedChargeGroup = group;
			if(this._selectedChargeGroup) {
				this._selectedChargeGroup.flag = this;
				if(carriedCharge && !(this._selectedChargeGroup is ChargeValueGroup)) {
					this._selectedChargeGroup.setCharge(carriedCharge);
				}
			}
			this.dispatchEvent(new Event("selectedChargeGroupChanged"));
		}
				
		[Bindable (event="colorsChanged")]
		public function get colorList():Array {
			return this._colorList;
		}
		
		public function set colorList(colorList:Array):void {
			if(colorList === this._colorList)
				return;
			this.updateColors(colorList);
		}
		
		[Bindable (event="colorsChanged")]
		public function get colors():Object {
			return this._colors;
		}
		
		public function set colors(colors:Object):void {
			if(colors === this._colors)
				return;
			this.updateColors(colors);
		}
		
		protected function updateColors(colors:Object):void {
			if(this.colorList) {
				// Clear any old colors we've had.
				for each(var colorValue:ColorValue in this.colorList)
					colorValue.displayObject = null;
			}
			this._colors = {};
			var newColorList:Array = [];
			for each(colorValue in colors) {
				colorValue.displayObject = this;
				this.colors[colorValue.name] = colorValue;
				newColorList.push(colorValue);
			}
			this._colorList = newColorList;
			this.dispatchEvent(new Event("colorsChanged"));
		}
	
		public function setColor(name:String, color:*):void {
			this.colors[name].color = ColoredVector.createColor(color);
		}
		
		public function setCharge(charge:ColoredVector, position:String = null, groupName:String = null):void {
			if(groupName) {
				this.selectGroup(groupName);
			} else if(position && !(this.selectedChargeGroup is ChargeValueGroup)) {
				this.selectGroup(position);
			}
			if(!this.selectedChargeGroup)
				throw new Error("No selectedChargeGroup and no position to coerce one from.");
			this.selectedChargeGroup.setCharge(charge, position);
		}
		
		public function setCharges(chargeList:Array):void {
			if(!(this.selectedChargeGroup is ChargeValueGroup))
				throw new Error("Cannot use setCharges with a ChargeValue being selected. (A ChargeValueGroup is required.)");
			for each(var chargeValue:ChargeValue in chargeList) {
				this.selectedChargeGroup.setCharge(chargeValue.charge, chargeValue.position);
			}
		}
		
		public function selectGroup(position:String):void {
			if(this.selectedChargeGroup && position === this.selectedChargeGroup.position)
				return;
			for each(var group:ChargeValue in this.chargeGroups) {
				if(group.position === position) {
					this.selectedChargeGroup = group;
					return;
				}
			}
			throw new Error("ChargeGroup not found: '" + position + "'");
		}
	
		public function toXML():XML {
			var node:XML = <{this.sourceName} type={this.sourceType}/>;
			var colorsNode:XML = <Colors/>;
			if(this.colorList) {
				for each(var colorValue:ColorValue in this.colorList)
					colorsNode.appendChild(colorValue.toXML());
			}
			node.appendChild(colorsNode);
			var chargesNode:XML = <Charge/>;
			if(this.selectedChargeGroup)
				chargesNode.appendChild(this.selectedChargeGroup.toXML());
			node.appendChild(chargesNode);
			return node;
		}
		
		public function fromXML(node:XML):ColoredVector {
			var child:XML;
			for each(child in node.Colors.*)
				this.colors[child.@name].fromXML(child);
			var chargeNode:XML = node.Charge.*[0];
			if(chargeNode) {
				this.selectGroup(chargeNode.@position);
				this.selectedChargeGroup.fromXML(chargeNode);
			}
			return this;
		}
		
	}
}
