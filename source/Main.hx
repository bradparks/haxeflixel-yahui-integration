package;

import yahui.test.ControlDemoNew;
import org.flixel.FlxG;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.events.TimerEvent;
import nme.Lib;
import nme.utils.Timer;
import yahui.containers.HBox;
import yahui.containers.ListView;
import yahui.containers.ScrollView;
import yahui.containers.TabView;
import yahui.containers.VBox;
import yahui.controls.Button;
import yahui.controls.CheckBox;
import yahui.controls.HScroll;
import yahui.controls.Image;
import yahui.controls.Label;
import yahui.controls.ProgressBar;
import yahui.controls.TextInput;
import yahui.controls.ValueControl;
import yahui.controls.TabBar;
import yahui.controls.VScroll;
import yahui.core.Component;
import yahui.core.ComponentParser;
import yahui.core.Root;
import yahui.popup.ListPopup;
import yahui.popup.Popup;
import yahui.style.android.AndroidStyles;
import yahui.style.StyleManager;
import yahui.style.test.TestStyles;
import yahui.style.windows.WindowsStyles;

class Main extends Sprite {
	public static var WINDOWS_SKIN:String = "WINDOWS";
	public static var ANDROID_SKIN:String = "ANDROID";
	public static var TEST_SKIN:String = "TEST";
	
	public function new() {
		super();
		#if iphone
			Lib.current.stage.addEventListener(Event.RESIZE, initialize);
		#else
			addEventListener(Event.ADDED_TO_STAGE, initialize);
		#end
	}

	private function initialize(e) {
		#if iphone
			Lib.current.stage.removeEventListener(Event.RESIZE, initialize);
		#else
			removeEventListener(Event.ADDED_TO_STAGE, initialize);
		#end
		
		startApp(WINDOWS_SKIN);
	}

	public static function startApp(skinId:String):Void {
		if (skinId == WINDOWS_SKIN) {
			StyleManager.styles = new WindowsStyles();
		} else if (skinId == ANDROID_SKIN) {
			StyleManager.styles = new AndroidStyles();
		} else if (skinId == TEST_SKIN) {
			StyleManager.styles = new TestStyles();
		}

		// custom styles
		StyleManager.styles.addStyle("#c1", {
			backgroundColor: 0xFF0000,
			paddingTop: 5,
			paddingLeft: 5,
			paddingBottom: 5,
			paddingRight: 5,
		});

		StyleManager.styles.addStyle("#c2", {
			backgroundColor: 0xFF00FF,
		});
		
		StyleManager.styles.addStyle("#myStyledButton", {
			color: 0xFF0000,
		});
		StyleManager.styles.addStyle("#myStyledButton:over", {
			color: 0xFF00FF,
		});

		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;

		Root.destroyAll();
		
		// static floating panel
		//var background:Bitmap = new Bitmap(Assets.getBitmapData("img/slinky_large.jpg"));
    /*
		var background:BackgroundTest = new BackgroundTest(); // just a more interactive background
		stage.addChild(background);
    */
    stage.addChild(new TileMapDemo());
    FlxG.mouse.show();
		
		var root:Root = Root.createRoot( { x:400, y:0, width: 400, height: 600, additionalStyles: "Root.popupBorder", useShadow: false } );
		
		// full screen, 100% size, resizes
//		var root:Root = Root.createRoot();

		var demo:ControlDemoNew = new ControlDemoNew();
		demo.percentWidth = 100;
		demo.percentHeight = 100;
		root.addChild(demo);
	}
	
	static public function main() {
		new Main().initialize(new Event(""));		
	}
	
}
