package yahui.controls;

import nme.events.Event;
import nme.events.MouseEvent;
import nme.geom.Rectangle;
import yahui.containers.HBox;
import yahui.containers.ScrollView;
import yahui.core.Component;
import yahui.style.StyleManager;

class TabBar extends ScrollView {
	private var buttons:Array<Button>;
	
	public var selectedIndex(default, setSelectedIndex):Int = 0;
	
	public function new() {
		super();
		addStyleName("TabBar");
		
		buttons = new Array<Button>();
		
		width = 300;
		content = new HBox();
		content.addStyleName("TabBar.content");

		scrollSensitivity = 5;
		showHorizontalScroll = false;
		showVerticalScroll = false;
	}
	
	//************************************************************
	//                  OVERRIDES
	//************************************************************
	public override function initialize():Void {
		super.initialize();
	}
	
	//************************************************************
	//                  TAB FUNCTIONS
	//************************************************************
	public function addTab(title:String, additionalStyleNames:String = null):Button {
		var button:Button = new Button();
		button.inheritStylesFrom = "TabBar.tab";
		button.addStyleName("TabBar.tab");
		button.addStyleName(additionalStyleNames);
		button.toggle = true;
		button.text = title;
		button.allowSelection = false;
		if (buttons.length == 0 && selectedIndex == 0)  {
			button.selected = true;
		}
		
		button.addEventListener(MouseEvent.CLICK, buildMouseClickFunction(buttons.length));
		buttons.push(button);
		content.addChild(button);
		
		return button;
	}
	
	public function buildMouseClickFunction(index:Int) {
		return function(event:MouseEvent) { mouseClickButton(index); };
	}
	
	private function mouseClickButton(index:Int):Void {
		if (index != selectedIndex) {
			for (n in 0...buttons.length) {
				var button:Button = buttons[n];
				if (n == index) {
					button.selected = true;
				} else {
					button.selected = false;
				}
			}
			selectedIndex = index;
			
			var event:Event = new Event(Event.CHANGE);
			dispatchEvent(event);
		}
	}
	//************************************************************
	//                  GETTERS AND SETTERS
	//************************************************************
	public function setSelectedIndex(value:Int):Int {
		selectedIndex = value;
		return value;
	}
}