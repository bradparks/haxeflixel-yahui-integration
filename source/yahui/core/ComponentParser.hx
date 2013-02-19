package yahui.core;

import nme.Assets;
class ComponentParser {
	public function new() {
		
	}

	public static function fromXMLAsset(xmlStringId:String):Component {
		#if embeddedXML
			//trace("Using xml skin as resource");
			var xmlString:String = haxe.Resource.getString(xmlStringId);
		#else
			//trace("Using xml skin as asset");
			var xmlString:String = Assets.getText(xmlStringId);
		#end
		return fromXMLString(xmlString);
	}
	
	public static function fromXMLString(xmlString:String):Component {
		var xml:Xml = Xml.parse(xmlString);
		for (child in xml) {
			if (Std.string(child.nodeType) == "element") {
				return fromXML(child);
			}
		}
		return null;
	}
	
	public static function fromXML(xml:Xml):Component {
		trace(xml.nodeName);
		var widthString:String = xml.get("width");
		var width:Float = Std.parseInt(widthString);
		var percentWidth:Int = -1;
		if (widthString.indexOf("%") != -1) {
			width = 0;
			percentWidth = Std.parseInt(widthString.substr(0, widthString.length - 1));
		}

		var heightString:String = xml.get("height");
		var height:Float = Std.parseInt(heightString);
		var percentHeight:Int = -1;
		if (heightString.indexOf("%") != -1) {
			height = 0;
			percentHeight = Std.parseInt(heightString.substr(0, heightString.length - 1));
		}
		
		var c:Component = new Component();
		if (xml.get("id") != null && xml.get("id").length != 0) {
			c.id = xml.get("id");
		}
		c.width = width;
		c.height = height;
		c.percentWidth = percentWidth;
		c.percentHeight = percentHeight;
		
		for (child in xml) {
			if (Std.string(child.nodeType) == "element") {
				c.addChild(fromXML(child));
			}
		}
		
		
		return c;
	}
}
