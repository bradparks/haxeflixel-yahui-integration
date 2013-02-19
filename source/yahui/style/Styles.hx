package yahui.style;

class Styles {
	var styles:Hash<Dynamic>;
	
	public function new() {
		styles = new Hash<Dynamic>();
	}
	
	public function addStyle(styleName:String, style:Dynamic):Dynamic {
		styles.set(styleName, style);
		return style;
	}
	
	public function getStyle(styleName:String):Dynamic {
		return styles.get(styleName);
	}
}