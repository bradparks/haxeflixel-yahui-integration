package yahui.containers;
import nme.events.Event;
import yahui.controls.Button;
import yahui.controls.TabBar;
import yahui.core.Component;

class TabView extends Component {
	private var tabs:TabBar;
	
	private var content:Component;
	
	private var pages:Array<Component>;
	
	private var currentPage:Component;
	
	public function new() {
		super();
	
		pages = new Array<Component>();
		
		tabs = new TabBar();
		tabs.percentWidth = 100;
		
		content = new Component();
		content.percentWidth = 100;
		//content.setStyle( { backgroundColor: 0xFF0000 } );
		
		padding.left = 0;
		padding.right = 0;
		padding.top = 0;
		padding.bottom = 0;
	}
	
	//************************************************************
	//                  OVERRIDES
	//************************************************************
	public override function initialize():Void {
		tabs.addEventListener(Event.CHANGE, onTabChange);
		
		content.addStyleName("TabView.content");
		
		//content.padding.top = 5;
		//content.padding.left = 5;
		//content.padding.bottom = 5;
		//content.padding.right = 5;

		
		addChild(tabs);
		addChild(content);
	}
	
	public override function resize():Void {
		super.resize();
		
		content.height = innerHeight - tabs.height - spacingY;
		content.y = tabs.height + padding.top + spacingY;
	}
	
	//************************************************************
	//                  TABVIEW FUNCTIONS
	//************************************************************
	public function addPage(title:String, page:Component = null, additionalStyleNames:String = null):Component {
		if (page == null) {
			page = new Component();
		}

		var button:Button = tabs.addTab(title, additionalStyleNames);
		
		page.percentWidth = 100;
		page.percentHeight = 100;
		pages.push(page);
		page.visible = button.selected;
		if (button.selected == true) {
			currentPage = page;
		}
		
		content.addChild(page);
		
		return page;
	}
	
	//************************************************************
	//                  EVENT HANDLERS
	//************************************************************
	private function onTabChange(event:Event):Void {
		currentPage.visible = false;
		var page:Component = pages[tabs.selectedIndex];
		page.visible = true;
		currentPage = page;
	}
}