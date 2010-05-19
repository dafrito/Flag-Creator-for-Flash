package bluespot {
	public class ColoredVectorDefinition {
	
		private var _sourceType:String;
		private var _sourceName:String;
		private var coloredVectorClass:Class;
		
		public var label:String;

		public function ColoredVectorDefinition(sourceType:String, sourceName:String, label:String, coloredVectorClass:Class) {
			super();
			this._sourceType = sourceType;
			this._sourceName = sourceName;
			this.label = label;
			this.coloredVectorClass = coloredVectorClass;
		}
		
		public function get sourceType():String {
			return this._sourceType;
		}
		
		public function get sourceName():String {
			return this._sourceName;
		}

		public function create():ColoredVector {
			return new (this.coloredVectorClass)();
		}
	}
}
