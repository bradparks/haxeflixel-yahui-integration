class ApplicationMain
{

	#if waxe
	static public var frame : wx.Frame;
	static public var autoShowFrame : Bool = true;
	#if nme
	static public var nmeStage : wx.NMEStage;
	#end
	#end
	
	public static function main()
	{
		#if nme
		nme.Lib.setPackage("Zaphod", "TileMapDemo", "com.example.myapp", "0.0.1");
		
		#end
		
		#if waxe
		wx.App.boot(function()
		{
			
			frame = wx.Frame.create(null, null, "TileMap Demo", null, { width: 800, height: 600 });
			
			#if nme
			var stage = wx.NMEStage.create(frame, null, null, { width: 800, height: 600 });
			#end
			
			Main.main();
			
			if (autoShowFrame)
			{
				wx.App.setTopWindow(frame);
				frame.shown = true;
			}
		});
		#else
		
		nme.Lib.create(function()
			{ 
				//if ((800 == 0 && 600 == 0) || false)
				//{
					nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
					nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
				//}
				
				var hasMain = false;
				
				for (methodName in Type.getClassFields(Main))
				{
					if (methodName == "main")
					{
						hasMain = true;
						break;
					}
				}
				
				if (hasMain)
				{
					Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
				}
				else
				{
					var instance = Type.createInstance(Main, []);
					#if nme
					if (Std.is (instance, nme.display.DisplayObject)) {
						nme.Lib.current.addChild(cast instance);
					}
					#end
				}
			},
			800, 600, 
			30, 
			0,
			(true ? nme.Lib.HARDWARE : 0) |
			(false ? nme.Lib.ALLOW_SHADERS : 0) |
			(false ? nme.Lib.REQUIRE_SHADERS : 0) |
			(false ? nme.Lib.DEPTH_BUFFER : 0) |
			(false ? nme.Lib.STENCIL_BUFFER : 0) |
			(true ? nme.Lib.RESIZABLE : 0) |
			(false ? nme.Lib.BORDERLESS : 0) |
			(false ? nme.Lib.VSYNC : 0) |
			(false ? nme.Lib.FULLSCREEN : 0) |
			(0 == 4 ? nme.Lib.HW_AA_HIRES : 0) |
			(0 == 2 ? nme.Lib.HW_AA : 0),
			"TileMap Demo"
			
		);
		#end
		
	}
	
	
	#if neko
	public static function __init__ () {
		
		untyped $loader.path = $array ("@executable_path/", $loader.path);
		
	}
	#end
	
	
	public static function getAsset(inName:String):Dynamic
	{
		#if nme
		
		if (inName == "Beep")
		{
			
			return nme.Assets.getSound ("Beep");
			
		}
		
		if (inName == "assets/alt_tiles.png")
		{
			
			return nme.Assets.getBitmapData ("assets/alt_tiles.png");
			
		}
		
		if (inName == "assets/auto_tiles.png")
		{
			
			return nme.Assets.getBitmapData ("assets/auto_tiles.png");
			
		}
		
		if (inName == "assets/data/autotiles.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/autotiles.png");
			
		}
		
		if (inName == "assets/data/autotiles_alt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/autotiles_alt.png");
			
		}
		
		if (inName == "assets/data/base.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/base.png");
			
		}
		
		if (inName == "assets/data/beep.mp3")
		{
			
			return nme.Assets.getSound ("assets/data/beep.mp3");
			
		}
		
		if (inName == "assets/data/beep.wav")
		{
			
			return nme.Assets.getSound ("assets/data/beep.wav");
			
		}
		
		if (inName == "assets/data/button.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button.png");
			
		}
		
		if (inName == "assets/data/button_a.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_a.png");
			
		}
		
		if (inName == "assets/data/button_b.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_b.png");
			
		}
		
		if (inName == "assets/data/button_c.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_c.png");
			
		}
		
		if (inName == "assets/data/button_down.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_down.png");
			
		}
		
		if (inName == "assets/data/button_left.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_left.png");
			
		}
		
		if (inName == "assets/data/button_right.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_right.png");
			
		}
		
		if (inName == "assets/data/button_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_up.png");
			
		}
		
		if (inName == "assets/data/button_x.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_x.png");
			
		}
		
		if (inName == "assets/data/button_y.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/button_y.png");
			
		}
		
		if (inName == "assets/data/courier.ttf")
		{
			
			return nme.Assets.getFont ("assets/data/courier.ttf");
			
		}
		
		if (inName == "assets/data/cursor.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/cursor.png");
			
		}
		
		if (inName == "assets/data/default.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/default.png");
			
		}
		
		if (inName == "assets/data/fontData10pt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/fontData10pt.png");
			
		}
		
		if (inName == "assets/data/fontData11pt.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/fontData11pt.png");
			
		}
		
		if (inName == "assets/data/handle.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/handle.png");
			
		}
		
		if (inName == "assets/data/logo.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/logo.png");
			
		}
		
		if (inName == "assets/data/logo_corners.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/logo_corners.png");
			
		}
		
		if (inName == "assets/data/logo_light.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/logo_light.png");
			
		}
		
		if (inName == "assets/data/nokiafc22.ttf")
		{
			
			return nme.Assets.getFont ("assets/data/nokiafc22.ttf");
			
		}
		
		if (inName == "assets/data/stick.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/stick.png");
			
		}
		
		if (inName == "assets/data/vcr/flixel.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/flixel.png");
			
		}
		
		if (inName == "assets/data/vcr/open.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/open.png");
			
		}
		
		if (inName == "assets/data/vcr/pause.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/pause.png");
			
		}
		
		if (inName == "assets/data/vcr/play.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/play.png");
			
		}
		
		if (inName == "assets/data/vcr/record_off.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/record_off.png");
			
		}
		
		if (inName == "assets/data/vcr/record_on.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/record_on.png");
			
		}
		
		if (inName == "assets/data/vcr/restart.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/restart.png");
			
		}
		
		if (inName == "assets/data/vcr/step.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/step.png");
			
		}
		
		if (inName == "assets/data/vcr/stop.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vcr/stop.png");
			
		}
		
		if (inName == "assets/data/vis/bounds.png")
		{
			
			return nme.Assets.getBitmapData ("assets/data/vis/bounds.png");
			
		}
		
		if (inName == "assets/default_alt.txt")
		{
			
			return nme.Assets.getText ("assets/default_alt.txt");
			
		}
		
		if (inName == "assets/default_auto.txt")
		{
			
			return nme.Assets.getText ("assets/default_auto.txt");
			
		}
		
		if (inName == "assets/default_empty.txt")
		{
			
			return nme.Assets.getText ("assets/default_empty.txt");
			
		}
		
		if (inName == "assets/empty_tiles.png")
		{
			
			return nme.Assets.getBitmapData ("assets/empty_tiles.png");
			
		}
		
		if (inName == "assets/HaxeFlixel.svg")
		{
			
			return nme.Assets.getText ("assets/HaxeFlixel.svg");
			
		}
		
		if (inName == "assets/icons/address_book_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/address_book_16.png");
			
		}
		
		if (inName == "assets/icons/address_book_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/address_book_32.png");
			
		}
		
		if (inName == "assets/icons/application_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/application_16.png");
			
		}
		
		if (inName == "assets/icons/application_24.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/application_24.png");
			
		}
		
		if (inName == "assets/icons/application_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/application_32.png");
			
		}
		
		if (inName == "assets/icons/application_48.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/application_48.png");
			
		}
		
		if (inName == "assets/icons/default_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/default_16.png");
			
		}
		
		if (inName == "assets/icons/default_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/default_32.png");
			
		}
		
		if (inName == "assets/icons/fav_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/fav_16.png");
			
		}
		
		if (inName == "assets/icons/fav_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/fav_32.png");
			
		}
		
		if (inName == "assets/icons/file_blank_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/file_blank_16.png");
			
		}
		
		if (inName == "assets/icons/file_blank_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/file_blank_32.png");
			
		}
		
		if (inName == "assets/icons/file_gif_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/file_gif_16.png");
			
		}
		
		if (inName == "assets/icons/file_gif_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/file_gif_32.png");
			
		}
		
		if (inName == "assets/icons/file_text_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/file_text_16.png");
			
		}
		
		if (inName == "assets/icons/file_text_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/file_text_32.png");
			
		}
		
		if (inName == "assets/icons/folder_open_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/folder_open_16.png");
			
		}
		
		if (inName == "assets/icons/folder_open_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/folder_open_32.png");
			
		}
		
		if (inName == "assets/icons/home_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/home_16.png");
			
		}
		
		if (inName == "assets/icons/home_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/home_32.png");
			
		}
		
		if (inName == "assets/icons/search_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/search_16.png");
			
		}
		
		if (inName == "assets/icons/search_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/search_32.png");
			
		}
		
		if (inName == "assets/icons/settings_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/settings_16.png");
			
		}
		
		if (inName == "assets/icons/settings_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/settings_32.png");
			
		}
		
		if (inName == "assets/icons/user_16.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/user_16.png");
			
		}
		
		if (inName == "assets/icons/user_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/icons/user_32.png");
			
		}
		
		if (inName == "assets/img/AgentOrange.ttf")
		{
			
			return nme.Assets.getFont ("assets/img/AgentOrange.ttf");
			
		}
		
		if (inName == "assets/img/blank_pixel.png")
		{
			
			return nme.Assets.getBitmapData ("assets/img/blank_pixel.png");
			
		}
		
		if (inName == "assets/img/slinky.jpg")
		{
			
			return nme.Assets.getBitmapData ("assets/img/slinky.jpg");
			
		}
		
		if (inName == "assets/img/slinky_large.jpg")
		{
			
			return nme.Assets.getBitmapData ("assets/img/slinky_large.jpg");
			
		}
		
		if (inName == "assets/img/slinky_small.jpg")
		{
			
			return nme.Assets.getBitmapData ("assets/img/slinky_small.jpg");
			
		}
		
		if (inName == "assets/img/test_skin.png")
		{
			
			return nme.Assets.getBitmapData ("assets/img/test_skin.png");
			
		}
		
		if (inName == "assets/nme.svg")
		{
			
			return nme.Assets.getText ("assets/nme.svg");
			
		}
		
		if (inName == "assets/skins/android/audio/TW_Touch.mp3")
		{
			
			return nme.Assets.getSound ("assets/skins/android/audio/TW_Touch.mp3");
			
		}
		
		if (inName == "assets/skins/android/audio/TW_Touch.ogg")
		{
			
			return nme.Assets.getSound ("assets/skins/android/audio/TW_Touch.ogg");
			
		}
		
		if (inName == "assets/skins/android/audio/TW_Touch.wav")
		{
			
			return nme.Assets.getSound ("assets/skins/android/audio/TW_Touch.wav");
			
		}
		
		if (inName == "assets/skins/android/button/button_down.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/button/button_down.png");
			
		}
		
		if (inName == "assets/skins/android/button/button_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/button/button_up.png");
			
		}
		
		if (inName == "assets/skins/android/checkbox/checkbox_checked_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/checkbox/checkbox_checked_up.png");
			
		}
		
		if (inName == "assets/skins/android/checkbox/checkbox_unchecked_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/checkbox/checkbox_unchecked_up.png");
			
		}
		
		if (inName == "assets/skins/android/container/container_bg.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/container/container_bg.png");
			
		}
		
		if (inName == "assets/skins/android/dropdown/dropdown_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/dropdown/dropdown_arrow.png");
			
		}
		
		if (inName == "assets/skins/android/fonts/Roboto-Regular.ttf")
		{
			
			return nme.Assets.getFont ("assets/skins/android/fonts/Roboto-Regular.ttf");
			
		}
		
		if (inName == "assets/skins/android/hscroll/hscroll_thumb_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/hscroll/hscroll_thumb_up.png");
			
		}
		
		if (inName == "assets/skins/android/icons/fav_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/icons/fav_32.png");
			
		}
		
		if (inName == "assets/skins/android/icons/folder_open_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/icons/folder_open_32.png");
			
		}
		
		if (inName == "assets/skins/android/icons/home_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/icons/home_32.png");
			
		}
		
		if (inName == "assets/skins/android/icons/search_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/icons/search_32.png");
			
		}
		
		if (inName == "assets/skins/android/icons/settings_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/icons/settings_32.png");
			
		}
		
		if (inName == "assets/skins/android/icons/user_32.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/icons/user_32.png");
			
		}
		
		if (inName == "assets/skins/android/list/list_item_popup_unselected.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/list/list_item_popup_unselected.png");
			
		}
		
		if (inName == "assets/skins/android/list/list_item_selected.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/list/list_item_selected.png");
			
		}
		
		if (inName == "assets/skins/android/list/list_item_unselected.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/list/list_item_unselected.png");
			
		}
		
		if (inName == "assets/skins/android/optionbox/optionbox_selected_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/optionbox/optionbox_selected_up.png");
			
		}
		
		if (inName == "assets/skins/android/optionbox/optionbox_unselected_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/optionbox/optionbox_unselected_up.png");
			
		}
		
		if (inName == "assets/skins/android/popup/popup_border.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/popup/popup_border.png");
			
		}
		
		if (inName == "assets/skins/android/popup/popup_border_no_title.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/popup/popup_border_no_title.png");
			
		}
		
		if (inName == "assets/skins/android/progress/progress_background.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/progress/progress_background.png");
			
		}
		
		if (inName == "assets/skins/android/progress/progress_value.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/progress/progress_value.png");
			
		}
		
		if (inName == "assets/skins/android/ratings/nostar.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/ratings/nostar.png");
			
		}
		
		if (inName == "assets/skins/android/ratings/star.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/ratings/star.png");
			
		}
		
		if (inName == "assets/skins/android/tabbar/tabbar_bg.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/tabbar/tabbar_bg.png");
			
		}
		
		if (inName == "assets/skins/android/tabs/tab_selected_bg.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/tabs/tab_selected_bg.png");
			
		}
		
		if (inName == "assets/skins/android/tabs/tab_unselected_bg.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/tabs/tab_unselected_bg.png");
			
		}
		
		if (inName == "assets/skins/android/textinput/textinput_normal.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/textinput/textinput_normal.png");
			
		}
		
		if (inName == "assets/skins/android/vscroll/vscroll_thumb_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/android/vscroll/vscroll_thumb_up.png");
			
		}
		
		if (inName == "assets/skins/windows/button/button_down.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/button/button_down.png");
			
		}
		
		if (inName == "assets/skins/windows/button/button_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/button/button_over.png");
			
		}
		
		if (inName == "assets/skins/windows/button/button_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/button/button_up.png");
			
		}
		
		if (inName == "assets/skins/windows/checkbox/checkbox_checked_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/checkbox/checkbox_checked_over.png");
			
		}
		
		if (inName == "assets/skins/windows/checkbox/checkbox_checked_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/checkbox/checkbox_checked_up.png");
			
		}
		
		if (inName == "assets/skins/windows/checkbox/checkbox_unchecked_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/checkbox/checkbox_unchecked_over.png");
			
		}
		
		if (inName == "assets/skins/windows/checkbox/checkbox_unchecked_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/checkbox/checkbox_unchecked_up.png");
			
		}
		
		if (inName == "assets/skins/windows/container/container_bg.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/container/container_bg.png");
			
		}
		
		if (inName == "assets/skins/windows/fonts/segoeui.ttf")
		{
			
			return nme.Assets.getFont ("assets/skins/windows/fonts/segoeui.ttf");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_bg.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_bg.png");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_button_down.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_button_down.png");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_button_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_button_over.png");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_button_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_button_up.png");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_left_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_left_arrow.png");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_right_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_right_arrow.png");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png");
			
		}
		
		if (inName == "assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png");
			
		}
		
		if (inName == "assets/skins/windows/listview/listview_item_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/listview/listview_item_over.png");
			
		}
		
		if (inName == "assets/skins/windows/listview/listview_item_selected.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/listview/listview_item_selected.png");
			
		}
		
		if (inName == "assets/skins/windows/listview/listview_item_unselected.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/listview/listview_item_unselected.png");
			
		}
		
		if (inName == "assets/skins/windows/optionbox/optionbox_selected_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/optionbox/optionbox_selected_over.png");
			
		}
		
		if (inName == "assets/skins/windows/optionbox/optionbox_selected_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/optionbox/optionbox_selected_up.png");
			
		}
		
		if (inName == "assets/skins/windows/optionbox/optionbox_unselected_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/optionbox/optionbox_unselected_over.png");
			
		}
		
		if (inName == "assets/skins/windows/optionbox/optionbox_unselected_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/optionbox/optionbox_unselected_up.png");
			
		}
		
		if (inName == "assets/skins/windows/popup/popup_border.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/popup/popup_border.png");
			
		}
		
		if (inName == "assets/skins/windows/progress/progress_background.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/progress/progress_background.png");
			
		}
		
		if (inName == "assets/skins/windows/progress/progress_value.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/progress/progress_value.png");
			
		}
		
		if (inName == "assets/skins/windows/ratings/star-empty.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/ratings/star-empty.png");
			
		}
		
		if (inName == "assets/skins/windows/ratings/star.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/ratings/star.png");
			
		}
		
		if (inName == "assets/skins/windows/tabbar/tabbar_bg.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/tabbar/tabbar_bg.png");
			
		}
		
		if (inName == "assets/skins/windows/tabs/tab_selected_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/tabs/tab_selected_up.png");
			
		}
		
		if (inName == "assets/skins/windows/tabs/tab_unselected_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/tabs/tab_unselected_over.png");
			
		}
		
		if (inName == "assets/skins/windows/tabs/tab_unselected_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/tabs/tab_unselected_up.png");
			
		}
		
		if (inName == "assets/skins/windows/textinput/textinput_normal.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/textinput/textinput_normal.png");
			
		}
		
		if (inName == "assets/skins/windows/textinput/textinput_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/textinput/textinput_over.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_bg.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_bg.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_button_down.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_button_down.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_button_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_button_over.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_button_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_button_up.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_down_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_down_arrow.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png");
			
		}
		
		if (inName == "assets/skins/windows/vscroll/vscroll_up_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_up_arrow.png");
			
		}
		
		if (inName == "assets/spaceman.png")
		{
			
			return nme.Assets.getBitmapData ("assets/spaceman.png");
			
		}
		
		if (inName == "assets/ui/test01.xml")
		{
			
			return nme.Assets.getText ("assets/ui/test01.xml");
			
		}
		
		if (inName == "img/AgentOrange.ttf")
		{
			
			return nme.Assets.getFont ("img/AgentOrange.ttf");
			
		}
		
		if (inName == "img/blank_pixel.png")
		{
			
			return nme.Assets.getBitmapData ("img/blank_pixel.png");
			
		}
		
		if (inName == "img/slinky.jpg")
		{
			
			return nme.Assets.getBitmapData ("img/slinky.jpg");
			
		}
		
		if (inName == "img/slinky_large.jpg")
		{
			
			return nme.Assets.getBitmapData ("img/slinky_large.jpg");
			
		}
		
		if (inName == "img/slinky_small.jpg")
		{
			
			return nme.Assets.getBitmapData ("img/slinky_small.jpg");
			
		}
		
		if (inName == "img/test_skin.png")
		{
			
			return nme.Assets.getBitmapData ("img/test_skin.png");
			
		}
		
		if (inName == "skins/android/audio/TW_Touch.mp3")
		{
			
			return nme.Assets.getSound ("skins/android/audio/TW_Touch.mp3");
			
		}
		
		if (inName == "skins/android/audio/TW_Touch.ogg")
		{
			
			return nme.Assets.getSound ("skins/android/audio/TW_Touch.ogg");
			
		}
		
		if (inName == "skins/android/audio/TW_Touch.wav")
		{
			
			return nme.Assets.getSound ("skins/android/audio/TW_Touch.wav");
			
		}
		
		if (inName == "skins/android/button/button_down.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/button/button_down.png");
			
		}
		
		if (inName == "skins/android/button/button_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/button/button_up.png");
			
		}
		
		if (inName == "skins/android/checkbox/checkbox_checked_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/checkbox/checkbox_checked_up.png");
			
		}
		
		if (inName == "skins/android/checkbox/checkbox_unchecked_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/checkbox/checkbox_unchecked_up.png");
			
		}
		
		if (inName == "skins/android/container/container_bg.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/container/container_bg.png");
			
		}
		
		if (inName == "skins/android/dropdown/dropdown_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/dropdown/dropdown_arrow.png");
			
		}
		
		if (inName == "skins/android/fonts/Roboto-Regular.ttf")
		{
			
			return nme.Assets.getFont ("skins/android/fonts/Roboto-Regular.ttf");
			
		}
		
		if (inName == "skins/android/hscroll/hscroll_thumb_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/hscroll/hscroll_thumb_up.png");
			
		}
		
		if (inName == "skins/android/icons/fav_32.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/icons/fav_32.png");
			
		}
		
		if (inName == "skins/android/icons/folder_open_32.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/icons/folder_open_32.png");
			
		}
		
		if (inName == "skins/android/icons/home_32.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/icons/home_32.png");
			
		}
		
		if (inName == "skins/android/icons/search_32.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/icons/search_32.png");
			
		}
		
		if (inName == "skins/android/icons/settings_32.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/icons/settings_32.png");
			
		}
		
		if (inName == "skins/android/icons/user_32.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/icons/user_32.png");
			
		}
		
		if (inName == "skins/android/list/list_item_popup_unselected.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/list/list_item_popup_unselected.png");
			
		}
		
		if (inName == "skins/android/list/list_item_selected.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/list/list_item_selected.png");
			
		}
		
		if (inName == "skins/android/list/list_item_unselected.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/list/list_item_unselected.png");
			
		}
		
		if (inName == "skins/android/optionbox/optionbox_selected_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/optionbox/optionbox_selected_up.png");
			
		}
		
		if (inName == "skins/android/optionbox/optionbox_unselected_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/optionbox/optionbox_unselected_up.png");
			
		}
		
		if (inName == "skins/android/popup/popup_border.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/popup/popup_border.png");
			
		}
		
		if (inName == "skins/android/popup/popup_border_no_title.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/popup/popup_border_no_title.png");
			
		}
		
		if (inName == "skins/android/progress/progress_background.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/progress/progress_background.png");
			
		}
		
		if (inName == "skins/android/progress/progress_value.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/progress/progress_value.png");
			
		}
		
		if (inName == "skins/android/ratings/nostar.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/ratings/nostar.png");
			
		}
		
		if (inName == "skins/android/ratings/star.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/ratings/star.png");
			
		}
		
		if (inName == "skins/android/tabbar/tabbar_bg.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/tabbar/tabbar_bg.png");
			
		}
		
		if (inName == "skins/android/tabs/tab_selected_bg.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/tabs/tab_selected_bg.png");
			
		}
		
		if (inName == "skins/android/tabs/tab_unselected_bg.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/tabs/tab_unselected_bg.png");
			
		}
		
		if (inName == "skins/android/textinput/textinput_normal.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/textinput/textinput_normal.png");
			
		}
		
		if (inName == "skins/android/vscroll/vscroll_thumb_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/android/vscroll/vscroll_thumb_up.png");
			
		}
		
		if (inName == "skins/windows/button/button_down.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/button/button_down.png");
			
		}
		
		if (inName == "skins/windows/button/button_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/button/button_over.png");
			
		}
		
		if (inName == "skins/windows/button/button_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/button/button_up.png");
			
		}
		
		if (inName == "skins/windows/checkbox/checkbox_checked_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/checkbox/checkbox_checked_over.png");
			
		}
		
		if (inName == "skins/windows/checkbox/checkbox_checked_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/checkbox/checkbox_checked_up.png");
			
		}
		
		if (inName == "skins/windows/checkbox/checkbox_unchecked_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/checkbox/checkbox_unchecked_over.png");
			
		}
		
		if (inName == "skins/windows/checkbox/checkbox_unchecked_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/checkbox/checkbox_unchecked_up.png");
			
		}
		
		if (inName == "skins/windows/container/container_bg.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/container/container_bg.png");
			
		}
		
		if (inName == "skins/windows/fonts/segoeui.ttf")
		{
			
			return nme.Assets.getFont ("skins/windows/fonts/segoeui.ttf");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_bg.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_bg.png");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_button_down.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_button_down.png");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_button_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_button_over.png");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_button_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_button_up.png");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_left_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_left_arrow.png");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_right_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_right_arrow.png");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_thumb_gripper_down.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_thumb_gripper_down.png");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_thumb_gripper_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_thumb_gripper_over.png");
			
		}
		
		if (inName == "skins/windows/hscroll/hscroll_thumb_gripper_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/hscroll/hscroll_thumb_gripper_up.png");
			
		}
		
		if (inName == "skins/windows/listview/listview_item_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/listview/listview_item_over.png");
			
		}
		
		if (inName == "skins/windows/listview/listview_item_selected.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/listview/listview_item_selected.png");
			
		}
		
		if (inName == "skins/windows/listview/listview_item_unselected.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/listview/listview_item_unselected.png");
			
		}
		
		if (inName == "skins/windows/optionbox/optionbox_selected_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/optionbox/optionbox_selected_over.png");
			
		}
		
		if (inName == "skins/windows/optionbox/optionbox_selected_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/optionbox/optionbox_selected_up.png");
			
		}
		
		if (inName == "skins/windows/optionbox/optionbox_unselected_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/optionbox/optionbox_unselected_over.png");
			
		}
		
		if (inName == "skins/windows/optionbox/optionbox_unselected_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/optionbox/optionbox_unselected_up.png");
			
		}
		
		if (inName == "skins/windows/popup/popup_border.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/popup/popup_border.png");
			
		}
		
		if (inName == "skins/windows/progress/progress_background.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/progress/progress_background.png");
			
		}
		
		if (inName == "skins/windows/progress/progress_value.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/progress/progress_value.png");
			
		}
		
		if (inName == "skins/windows/ratings/star-empty.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/ratings/star-empty.png");
			
		}
		
		if (inName == "skins/windows/ratings/star.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/ratings/star.png");
			
		}
		
		if (inName == "skins/windows/tabbar/tabbar_bg.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/tabbar/tabbar_bg.png");
			
		}
		
		if (inName == "skins/windows/tabs/tab_selected_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/tabs/tab_selected_up.png");
			
		}
		
		if (inName == "skins/windows/tabs/tab_unselected_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/tabs/tab_unselected_over.png");
			
		}
		
		if (inName == "skins/windows/tabs/tab_unselected_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/tabs/tab_unselected_up.png");
			
		}
		
		if (inName == "skins/windows/textinput/textinput_normal.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/textinput/textinput_normal.png");
			
		}
		
		if (inName == "skins/windows/textinput/textinput_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/textinput/textinput_over.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_bg.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_bg.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_button_down.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_button_down.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_button_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_button_over.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_button_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_button_up.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_down_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_down_arrow.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_thumb_gripper_down.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_thumb_gripper_down.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_thumb_gripper_over.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_thumb_gripper_over.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_thumb_gripper_up.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_thumb_gripper_up.png");
			
		}
		
		if (inName == "skins/windows/vscroll/vscroll_up_arrow.png")
		{
			
			return nme.Assets.getBitmapData ("skins/windows/vscroll/vscroll_up_arrow.png");
			
		}
		
		if (inName == "icons/address_book_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/address_book_16.png");
			
		}
		
		if (inName == "icons/address_book_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/address_book_32.png");
			
		}
		
		if (inName == "icons/application_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/application_16.png");
			
		}
		
		if (inName == "icons/application_24.png")
		{
			
			return nme.Assets.getBitmapData ("icons/application_24.png");
			
		}
		
		if (inName == "icons/application_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/application_32.png");
			
		}
		
		if (inName == "icons/application_48.png")
		{
			
			return nme.Assets.getBitmapData ("icons/application_48.png");
			
		}
		
		if (inName == "icons/default_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/default_16.png");
			
		}
		
		if (inName == "icons/default_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/default_32.png");
			
		}
		
		if (inName == "icons/fav_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/fav_16.png");
			
		}
		
		if (inName == "icons/fav_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/fav_32.png");
			
		}
		
		if (inName == "icons/file_blank_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/file_blank_16.png");
			
		}
		
		if (inName == "icons/file_blank_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/file_blank_32.png");
			
		}
		
		if (inName == "icons/file_gif_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/file_gif_16.png");
			
		}
		
		if (inName == "icons/file_gif_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/file_gif_32.png");
			
		}
		
		if (inName == "icons/file_text_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/file_text_16.png");
			
		}
		
		if (inName == "icons/file_text_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/file_text_32.png");
			
		}
		
		if (inName == "icons/folder_open_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/folder_open_16.png");
			
		}
		
		if (inName == "icons/folder_open_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/folder_open_32.png");
			
		}
		
		if (inName == "icons/home_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/home_16.png");
			
		}
		
		if (inName == "icons/home_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/home_32.png");
			
		}
		
		if (inName == "icons/search_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/search_16.png");
			
		}
		
		if (inName == "icons/search_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/search_32.png");
			
		}
		
		if (inName == "icons/settings_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/settings_16.png");
			
		}
		
		if (inName == "icons/settings_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/settings_32.png");
			
		}
		
		if (inName == "icons/user_16.png")
		{
			
			return nme.Assets.getBitmapData ("icons/user_16.png");
			
		}
		
		if (inName == "icons/user_32.png")
		{
			
			return nme.Assets.getBitmapData ("icons/user_32.png");
			
		}
		
		if (inName == "ui/test01.xml")
		{
			
			return nme.Assets.getText ("ui/test01.xml");
			
		}
		
		if (inName == "assets/skins/android/audio/TW_Touch.mp3")
		{
			
			return nme.Assets.getSound ("assets/skins/android/audio/TW_Touch.mp3");
			
		}
		
		if (inName == "assets/skins/android/audio/TW_Touch.ogg")
		{
			
			return nme.Assets.getSound ("assets/skins/android/audio/TW_Touch.ogg");
			
		}
		
		if (inName == "assets/skins/android/audio/TW_Touch.wav")
		{
			
			return nme.Assets.getSound ("assets/skins/android/audio/TW_Touch.wav");
			
		}
		
		#end
		return null;
	}
	
	
}
