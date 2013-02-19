package yahui.popup;

import nme.events.MouseEvent;
import yahui.controls.Button;
import yahui.controls.Label;

class SimplePopup extends Popup {
	
	public var text:String = "";
	private var textControl:Label;
	public function new() {
		super();
		inheritStylesFrom = "Popup";
		addStyleName("SimplePopup");
	}
	
	//************************************************************
	//                  OVERRIDES
	//************************************************************
	public override function initialize():Void {
		super.initialize();

		textControl = new Label();
		textControl.text = text;
		textControl.horizontalAlign = "left";
		content.addChild(textControl);
		
		var button:Button = new Button();
		button.text = "OK";
		button.verticalAlign = "bottom";
		button.horizontalAlign = "center";
		button.addEventListener(MouseEvent.CLICK, function(e) {
			Popup.hidePopup(this);
		});
		content.addChild(button);
		
		height = content.padding.top + content.padding.bottom + textControl.height + button.height + 10;
		Popup.centerPopup(this);
	}
}