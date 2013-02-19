#if nme

import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new NMEPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		#if !fdb
		haxe.Log.trace = flashTrace;
		#end
		
		if (call_real)
			begin ();
	}

	#if !fdb
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;
		
        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	#end
	
	private static function begin () {
		
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
			if (Std.is (instance, nme.display.DisplayObject)) {
				nme.Lib.current.addChild(cast instance);
			}	
		}
		
	}

	static function onEnter (_) {
		
		var loaded = nme.Lib.current.loaderInfo.bytesLoaded;
		var total = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="Beep")
			 
            return Assets.getSound ("Beep");
         
		
		if (inName=="assets/alt_tiles.png")
			 
            return Assets.getBitmapData ("assets/alt_tiles.png");
         
		
		if (inName=="assets/auto_tiles.png")
			 
            return Assets.getBitmapData ("assets/auto_tiles.png");
         
		
		if (inName=="assets/data/autotiles.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles.png");
         
		
		if (inName=="assets/data/autotiles_alt.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles_alt.png");
         
		
		if (inName=="assets/data/base.png")
			 
            return Assets.getBitmapData ("assets/data/base.png");
         
		
		if (inName=="assets/data/beep.mp3")
			 
            return Assets.getSound ("assets/data/beep.mp3");
		 
		
		if (inName=="assets/data/button.png")
			 
            return Assets.getBitmapData ("assets/data/button.png");
         
		
		if (inName=="assets/data/button_a.png")
			 
            return Assets.getBitmapData ("assets/data/button_a.png");
         
		
		if (inName=="assets/data/button_b.png")
			 
            return Assets.getBitmapData ("assets/data/button_b.png");
         
		
		if (inName=="assets/data/button_c.png")
			 
            return Assets.getBitmapData ("assets/data/button_c.png");
         
		
		if (inName=="assets/data/button_down.png")
			 
            return Assets.getBitmapData ("assets/data/button_down.png");
         
		
		if (inName=="assets/data/button_left.png")
			 
            return Assets.getBitmapData ("assets/data/button_left.png");
         
		
		if (inName=="assets/data/button_right.png")
			 
            return Assets.getBitmapData ("assets/data/button_right.png");
         
		
		if (inName=="assets/data/button_up.png")
			 
            return Assets.getBitmapData ("assets/data/button_up.png");
         
		
		if (inName=="assets/data/button_x.png")
			 
            return Assets.getBitmapData ("assets/data/button_x.png");
         
		
		if (inName=="assets/data/button_y.png")
			 
            return Assets.getBitmapData ("assets/data/button_y.png");
         
		
		if (inName=="assets/data/courier.ttf")
			 
			 return Assets.getFont ("assets/data/courier.ttf");
		 
		
		if (inName=="assets/data/cursor.png")
			 
            return Assets.getBitmapData ("assets/data/cursor.png");
         
		
		if (inName=="assets/data/default.png")
			 
            return Assets.getBitmapData ("assets/data/default.png");
         
		
		if (inName=="assets/data/fontData10pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData10pt.png");
         
		
		if (inName=="assets/data/fontData11pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData11pt.png");
         
		
		if (inName=="assets/data/handle.png")
			 
            return Assets.getBitmapData ("assets/data/handle.png");
         
		
		if (inName=="assets/data/logo.png")
			 
            return Assets.getBitmapData ("assets/data/logo.png");
         
		
		if (inName=="assets/data/logo_corners.png")
			 
            return Assets.getBitmapData ("assets/data/logo_corners.png");
         
		
		if (inName=="assets/data/logo_light.png")
			 
            return Assets.getBitmapData ("assets/data/logo_light.png");
         
		
		if (inName=="assets/data/nokiafc22.ttf")
			 
			 return Assets.getFont ("assets/data/nokiafc22.ttf");
		 
		
		if (inName=="assets/data/stick.png")
			 
            return Assets.getBitmapData ("assets/data/stick.png");
         
		
		if (inName=="assets/data/vcr/flixel.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/flixel.png");
         
		
		if (inName=="assets/data/vcr/open.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/open.png");
         
		
		if (inName=="assets/data/vcr/pause.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/pause.png");
         
		
		if (inName=="assets/data/vcr/play.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/play.png");
         
		
		if (inName=="assets/data/vcr/record_off.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_off.png");
         
		
		if (inName=="assets/data/vcr/record_on.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_on.png");
         
		
		if (inName=="assets/data/vcr/restart.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/restart.png");
         
		
		if (inName=="assets/data/vcr/step.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/step.png");
         
		
		if (inName=="assets/data/vcr/stop.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/stop.png");
         
		
		if (inName=="assets/data/vis/bounds.png")
			 
            return Assets.getBitmapData ("assets/data/vis/bounds.png");
         
		
		if (inName=="assets/default_alt.txt")
			 
			 return Assets.getText ("assets/default_alt.txt");
         
		
		if (inName=="assets/default_auto.txt")
			 
			 return Assets.getText ("assets/default_auto.txt");
         
		
		if (inName=="assets/default_empty.txt")
			 
			 return Assets.getText ("assets/default_empty.txt");
         
		
		if (inName=="assets/empty_tiles.png")
			 
            return Assets.getBitmapData ("assets/empty_tiles.png");
         
		
		if (inName=="assets/HaxeFlixel.svg")
			 
			 return Assets.getText ("assets/HaxeFlixel.svg");
         
		
		if (inName=="assets/icons/address_book_16.png")
			 
            return Assets.getBitmapData ("assets/icons/address_book_16.png");
         
		
		if (inName=="assets/icons/address_book_32.png")
			 
            return Assets.getBitmapData ("assets/icons/address_book_32.png");
         
		
		if (inName=="assets/icons/application_16.png")
			 
            return Assets.getBitmapData ("assets/icons/application_16.png");
         
		
		if (inName=="assets/icons/application_24.png")
			 
            return Assets.getBitmapData ("assets/icons/application_24.png");
         
		
		if (inName=="assets/icons/application_32.png")
			 
            return Assets.getBitmapData ("assets/icons/application_32.png");
         
		
		if (inName=="assets/icons/application_48.png")
			 
            return Assets.getBitmapData ("assets/icons/application_48.png");
         
		
		if (inName=="assets/icons/default_16.png")
			 
            return Assets.getBitmapData ("assets/icons/default_16.png");
         
		
		if (inName=="assets/icons/default_32.png")
			 
            return Assets.getBitmapData ("assets/icons/default_32.png");
         
		
		if (inName=="assets/icons/fav_16.png")
			 
            return Assets.getBitmapData ("assets/icons/fav_16.png");
         
		
		if (inName=="assets/icons/fav_32.png")
			 
            return Assets.getBitmapData ("assets/icons/fav_32.png");
         
		
		if (inName=="assets/icons/file_blank_16.png")
			 
            return Assets.getBitmapData ("assets/icons/file_blank_16.png");
         
		
		if (inName=="assets/icons/file_blank_32.png")
			 
            return Assets.getBitmapData ("assets/icons/file_blank_32.png");
         
		
		if (inName=="assets/icons/file_gif_16.png")
			 
            return Assets.getBitmapData ("assets/icons/file_gif_16.png");
         
		
		if (inName=="assets/icons/file_gif_32.png")
			 
            return Assets.getBitmapData ("assets/icons/file_gif_32.png");
         
		
		if (inName=="assets/icons/file_text_16.png")
			 
            return Assets.getBitmapData ("assets/icons/file_text_16.png");
         
		
		if (inName=="assets/icons/file_text_32.png")
			 
            return Assets.getBitmapData ("assets/icons/file_text_32.png");
         
		
		if (inName=="assets/icons/folder_open_16.png")
			 
            return Assets.getBitmapData ("assets/icons/folder_open_16.png");
         
		
		if (inName=="assets/icons/folder_open_32.png")
			 
            return Assets.getBitmapData ("assets/icons/folder_open_32.png");
         
		
		if (inName=="assets/icons/home_16.png")
			 
            return Assets.getBitmapData ("assets/icons/home_16.png");
         
		
		if (inName=="assets/icons/home_32.png")
			 
            return Assets.getBitmapData ("assets/icons/home_32.png");
         
		
		if (inName=="assets/icons/search_16.png")
			 
            return Assets.getBitmapData ("assets/icons/search_16.png");
         
		
		if (inName=="assets/icons/search_32.png")
			 
            return Assets.getBitmapData ("assets/icons/search_32.png");
         
		
		if (inName=="assets/icons/settings_16.png")
			 
            return Assets.getBitmapData ("assets/icons/settings_16.png");
         
		
		if (inName=="assets/icons/settings_32.png")
			 
            return Assets.getBitmapData ("assets/icons/settings_32.png");
         
		
		if (inName=="assets/icons/user_16.png")
			 
            return Assets.getBitmapData ("assets/icons/user_16.png");
         
		
		if (inName=="assets/icons/user_32.png")
			 
            return Assets.getBitmapData ("assets/icons/user_32.png");
         
		
		if (inName=="assets/img/AgentOrange.ttf")
			 
			 return Assets.getFont ("assets/img/AgentOrange.ttf");
		 
		
		if (inName=="assets/img/blank_pixel.png")
			 
            return Assets.getBitmapData ("assets/img/blank_pixel.png");
         
		
		if (inName=="assets/img/slinky.jpg")
			 
            return Assets.getBitmapData ("assets/img/slinky.jpg");
         
		
		if (inName=="assets/img/slinky_large.jpg")
			 
            return Assets.getBitmapData ("assets/img/slinky_large.jpg");
         
		
		if (inName=="assets/img/slinky_small.jpg")
			 
            return Assets.getBitmapData ("assets/img/slinky_small.jpg");
         
		
		if (inName=="assets/img/test_skin.png")
			 
            return Assets.getBitmapData ("assets/img/test_skin.png");
         
		
		if (inName=="assets/nme.svg")
			 
			 return Assets.getText ("assets/nme.svg");
         
		
		if (inName=="assets/skins/android/audio/TW_Touch.mp3")
			 
            return Assets.getSound ("assets/skins/android/audio/TW_Touch.mp3");
		 
		
		if (inName=="assets/skins/android/audio/TW_Touch.ogg")
			 
            return Assets.getSound ("assets/skins/android/audio/TW_Touch.ogg");
         
		
		if (inName=="assets/skins/android/button/button_down.png")
			 
            return Assets.getBitmapData ("assets/skins/android/button/button_down.png");
         
		
		if (inName=="assets/skins/android/button/button_up.png")
			 
            return Assets.getBitmapData ("assets/skins/android/button/button_up.png");
         
		
		if (inName=="assets/skins/android/checkbox/checkbox_checked_up.png")
			 
            return Assets.getBitmapData ("assets/skins/android/checkbox/checkbox_checked_up.png");
         
		
		if (inName=="assets/skins/android/checkbox/checkbox_unchecked_up.png")
			 
            return Assets.getBitmapData ("assets/skins/android/checkbox/checkbox_unchecked_up.png");
         
		
		if (inName=="assets/skins/android/container/container_bg.png")
			 
            return Assets.getBitmapData ("assets/skins/android/container/container_bg.png");
         
		
		if (inName=="assets/skins/android/dropdown/dropdown_arrow.png")
			 
            return Assets.getBitmapData ("assets/skins/android/dropdown/dropdown_arrow.png");
         
		
		if (inName=="assets/skins/android/fonts/Roboto-Regular.ttf")
			 
			 return Assets.getFont ("assets/skins/android/fonts/Roboto-Regular.ttf");
		 
		
		if (inName=="assets/skins/android/hscroll/hscroll_thumb_up.png")
			 
            return Assets.getBitmapData ("assets/skins/android/hscroll/hscroll_thumb_up.png");
         
		
		if (inName=="assets/skins/android/icons/fav_32.png")
			 
            return Assets.getBitmapData ("assets/skins/android/icons/fav_32.png");
         
		
		if (inName=="assets/skins/android/icons/folder_open_32.png")
			 
            return Assets.getBitmapData ("assets/skins/android/icons/folder_open_32.png");
         
		
		if (inName=="assets/skins/android/icons/home_32.png")
			 
            return Assets.getBitmapData ("assets/skins/android/icons/home_32.png");
         
		
		if (inName=="assets/skins/android/icons/search_32.png")
			 
            return Assets.getBitmapData ("assets/skins/android/icons/search_32.png");
         
		
		if (inName=="assets/skins/android/icons/settings_32.png")
			 
            return Assets.getBitmapData ("assets/skins/android/icons/settings_32.png");
         
		
		if (inName=="assets/skins/android/icons/user_32.png")
			 
            return Assets.getBitmapData ("assets/skins/android/icons/user_32.png");
         
		
		if (inName=="assets/skins/android/list/list_item_popup_unselected.png")
			 
            return Assets.getBitmapData ("assets/skins/android/list/list_item_popup_unselected.png");
         
		
		if (inName=="assets/skins/android/list/list_item_selected.png")
			 
            return Assets.getBitmapData ("assets/skins/android/list/list_item_selected.png");
         
		
		if (inName=="assets/skins/android/list/list_item_unselected.png")
			 
            return Assets.getBitmapData ("assets/skins/android/list/list_item_unselected.png");
         
		
		if (inName=="assets/skins/android/optionbox/optionbox_selected_up.png")
			 
            return Assets.getBitmapData ("assets/skins/android/optionbox/optionbox_selected_up.png");
         
		
		if (inName=="assets/skins/android/optionbox/optionbox_unselected_up.png")
			 
            return Assets.getBitmapData ("assets/skins/android/optionbox/optionbox_unselected_up.png");
         
		
		if (inName=="assets/skins/android/popup/popup_border.png")
			 
            return Assets.getBitmapData ("assets/skins/android/popup/popup_border.png");
         
		
		if (inName=="assets/skins/android/popup/popup_border_no_title.png")
			 
            return Assets.getBitmapData ("assets/skins/android/popup/popup_border_no_title.png");
         
		
		if (inName=="assets/skins/android/progress/progress_background.png")
			 
            return Assets.getBitmapData ("assets/skins/android/progress/progress_background.png");
         
		
		if (inName=="assets/skins/android/progress/progress_value.png")
			 
            return Assets.getBitmapData ("assets/skins/android/progress/progress_value.png");
         
		
		if (inName=="assets/skins/android/ratings/nostar.png")
			 
            return Assets.getBitmapData ("assets/skins/android/ratings/nostar.png");
         
		
		if (inName=="assets/skins/android/ratings/star.png")
			 
            return Assets.getBitmapData ("assets/skins/android/ratings/star.png");
         
		
		if (inName=="assets/skins/android/tabbar/tabbar_bg.png")
			 
            return Assets.getBitmapData ("assets/skins/android/tabbar/tabbar_bg.png");
         
		
		if (inName=="assets/skins/android/tabs/tab_selected_bg.png")
			 
            return Assets.getBitmapData ("assets/skins/android/tabs/tab_selected_bg.png");
         
		
		if (inName=="assets/skins/android/tabs/tab_unselected_bg.png")
			 
            return Assets.getBitmapData ("assets/skins/android/tabs/tab_unselected_bg.png");
         
		
		if (inName=="assets/skins/android/textinput/textinput_normal.png")
			 
            return Assets.getBitmapData ("assets/skins/android/textinput/textinput_normal.png");
         
		
		if (inName=="assets/skins/android/vscroll/vscroll_thumb_up.png")
			 
            return Assets.getBitmapData ("assets/skins/android/vscroll/vscroll_thumb_up.png");
         
		
		if (inName=="assets/skins/windows/button/button_down.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/button/button_down.png");
         
		
		if (inName=="assets/skins/windows/button/button_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/button/button_over.png");
         
		
		if (inName=="assets/skins/windows/button/button_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/button/button_up.png");
         
		
		if (inName=="assets/skins/windows/checkbox/checkbox_checked_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/checkbox/checkbox_checked_over.png");
         
		
		if (inName=="assets/skins/windows/checkbox/checkbox_checked_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/checkbox/checkbox_checked_up.png");
         
		
		if (inName=="assets/skins/windows/checkbox/checkbox_unchecked_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/checkbox/checkbox_unchecked_over.png");
         
		
		if (inName=="assets/skins/windows/checkbox/checkbox_unchecked_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/checkbox/checkbox_unchecked_up.png");
         
		
		if (inName=="assets/skins/windows/container/container_bg.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/container/container_bg.png");
         
		
		if (inName=="assets/skins/windows/fonts/segoeui.ttf")
			 
			 return Assets.getFont ("assets/skins/windows/fonts/segoeui.ttf");
		 
		
		if (inName=="assets/skins/windows/hscroll/hscroll_bg.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_bg.png");
         
		
		if (inName=="assets/skins/windows/hscroll/hscroll_button_down.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_button_down.png");
         
		
		if (inName=="assets/skins/windows/hscroll/hscroll_button_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_button_over.png");
         
		
		if (inName=="assets/skins/windows/hscroll/hscroll_button_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_button_up.png");
         
		
		if (inName=="assets/skins/windows/hscroll/hscroll_left_arrow.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_left_arrow.png");
         
		
		if (inName=="assets/skins/windows/hscroll/hscroll_right_arrow.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_right_arrow.png");
         
		
		if (inName=="assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png");
         
		
		if (inName=="assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png");
         
		
		if (inName=="assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png");
         
		
		if (inName=="assets/skins/windows/listview/listview_item_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/listview/listview_item_over.png");
         
		
		if (inName=="assets/skins/windows/listview/listview_item_selected.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/listview/listview_item_selected.png");
         
		
		if (inName=="assets/skins/windows/listview/listview_item_unselected.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/listview/listview_item_unselected.png");
         
		
		if (inName=="assets/skins/windows/optionbox/optionbox_selected_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/optionbox/optionbox_selected_over.png");
         
		
		if (inName=="assets/skins/windows/optionbox/optionbox_selected_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/optionbox/optionbox_selected_up.png");
         
		
		if (inName=="assets/skins/windows/optionbox/optionbox_unselected_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/optionbox/optionbox_unselected_over.png");
         
		
		if (inName=="assets/skins/windows/optionbox/optionbox_unselected_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/optionbox/optionbox_unselected_up.png");
         
		
		if (inName=="assets/skins/windows/popup/popup_border.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/popup/popup_border.png");
         
		
		if (inName=="assets/skins/windows/progress/progress_background.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/progress/progress_background.png");
         
		
		if (inName=="assets/skins/windows/progress/progress_value.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/progress/progress_value.png");
         
		
		if (inName=="assets/skins/windows/ratings/star-empty.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/ratings/star-empty.png");
         
		
		if (inName=="assets/skins/windows/ratings/star.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/ratings/star.png");
         
		
		if (inName=="assets/skins/windows/tabbar/tabbar_bg.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/tabbar/tabbar_bg.png");
         
		
		if (inName=="assets/skins/windows/tabs/tab_selected_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/tabs/tab_selected_up.png");
         
		
		if (inName=="assets/skins/windows/tabs/tab_unselected_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/tabs/tab_unselected_over.png");
         
		
		if (inName=="assets/skins/windows/tabs/tab_unselected_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/tabs/tab_unselected_up.png");
         
		
		if (inName=="assets/skins/windows/textinput/textinput_normal.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/textinput/textinput_normal.png");
         
		
		if (inName=="assets/skins/windows/textinput/textinput_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/textinput/textinput_over.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_bg.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_bg.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_button_down.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_button_down.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_button_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_button_over.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_button_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_button_up.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_down_arrow.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_down_arrow.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png");
         
		
		if (inName=="assets/skins/windows/vscroll/vscroll_up_arrow.png")
			 
            return Assets.getBitmapData ("assets/skins/windows/vscroll/vscroll_up_arrow.png");
         
		
		if (inName=="assets/spaceman.png")
			 
            return Assets.getBitmapData ("assets/spaceman.png");
         
		
		if (inName=="assets/ui/test01.xml")
			 
			 return Assets.getText ("assets/ui/test01.xml");
         
		
		if (inName=="img/AgentOrange.ttf")
			 
			 return Assets.getFont ("img/AgentOrange.ttf");
		 
		
		if (inName=="img/blank_pixel.png")
			 
            return Assets.getBitmapData ("img/blank_pixel.png");
         
		
		if (inName=="img/slinky.jpg")
			 
            return Assets.getBitmapData ("img/slinky.jpg");
         
		
		if (inName=="img/slinky_large.jpg")
			 
            return Assets.getBitmapData ("img/slinky_large.jpg");
         
		
		if (inName=="img/slinky_small.jpg")
			 
            return Assets.getBitmapData ("img/slinky_small.jpg");
         
		
		if (inName=="img/test_skin.png")
			 
            return Assets.getBitmapData ("img/test_skin.png");
         
		
		if (inName=="skins/android/audio/TW_Touch.mp3")
			 
            return Assets.getSound ("skins/android/audio/TW_Touch.mp3");
		 
		
		if (inName=="skins/android/audio/TW_Touch.ogg")
			 
            return Assets.getSound ("skins/android/audio/TW_Touch.ogg");
         
		
		if (inName=="skins/android/audio/TW_Touch.wav")
			 
            return Assets.getSound ("skins/android/audio/TW_Touch.wav");
         
		
		if (inName=="skins/android/button/button_down.png")
			 
            return Assets.getBitmapData ("skins/android/button/button_down.png");
         
		
		if (inName=="skins/android/button/button_up.png")
			 
            return Assets.getBitmapData ("skins/android/button/button_up.png");
         
		
		if (inName=="skins/android/checkbox/checkbox_checked_up.png")
			 
            return Assets.getBitmapData ("skins/android/checkbox/checkbox_checked_up.png");
         
		
		if (inName=="skins/android/checkbox/checkbox_unchecked_up.png")
			 
            return Assets.getBitmapData ("skins/android/checkbox/checkbox_unchecked_up.png");
         
		
		if (inName=="skins/android/container/container_bg.png")
			 
            return Assets.getBitmapData ("skins/android/container/container_bg.png");
         
		
		if (inName=="skins/android/dropdown/dropdown_arrow.png")
			 
            return Assets.getBitmapData ("skins/android/dropdown/dropdown_arrow.png");
         
		
		if (inName=="skins/android/fonts/Roboto-Regular.ttf")
			 
			 return Assets.getFont ("skins/android/fonts/Roboto-Regular.ttf");
		 
		
		if (inName=="skins/android/hscroll/hscroll_thumb_up.png")
			 
            return Assets.getBitmapData ("skins/android/hscroll/hscroll_thumb_up.png");
         
		
		if (inName=="skins/android/icons/fav_32.png")
			 
            return Assets.getBitmapData ("skins/android/icons/fav_32.png");
         
		
		if (inName=="skins/android/icons/folder_open_32.png")
			 
            return Assets.getBitmapData ("skins/android/icons/folder_open_32.png");
         
		
		if (inName=="skins/android/icons/home_32.png")
			 
            return Assets.getBitmapData ("skins/android/icons/home_32.png");
         
		
		if (inName=="skins/android/icons/search_32.png")
			 
            return Assets.getBitmapData ("skins/android/icons/search_32.png");
         
		
		if (inName=="skins/android/icons/settings_32.png")
			 
            return Assets.getBitmapData ("skins/android/icons/settings_32.png");
         
		
		if (inName=="skins/android/icons/user_32.png")
			 
            return Assets.getBitmapData ("skins/android/icons/user_32.png");
         
		
		if (inName=="skins/android/list/list_item_popup_unselected.png")
			 
            return Assets.getBitmapData ("skins/android/list/list_item_popup_unselected.png");
         
		
		if (inName=="skins/android/list/list_item_selected.png")
			 
            return Assets.getBitmapData ("skins/android/list/list_item_selected.png");
         
		
		if (inName=="skins/android/list/list_item_unselected.png")
			 
            return Assets.getBitmapData ("skins/android/list/list_item_unselected.png");
         
		
		if (inName=="skins/android/optionbox/optionbox_selected_up.png")
			 
            return Assets.getBitmapData ("skins/android/optionbox/optionbox_selected_up.png");
         
		
		if (inName=="skins/android/optionbox/optionbox_unselected_up.png")
			 
            return Assets.getBitmapData ("skins/android/optionbox/optionbox_unselected_up.png");
         
		
		if (inName=="skins/android/popup/popup_border.png")
			 
            return Assets.getBitmapData ("skins/android/popup/popup_border.png");
         
		
		if (inName=="skins/android/popup/popup_border_no_title.png")
			 
            return Assets.getBitmapData ("skins/android/popup/popup_border_no_title.png");
         
		
		if (inName=="skins/android/progress/progress_background.png")
			 
            return Assets.getBitmapData ("skins/android/progress/progress_background.png");
         
		
		if (inName=="skins/android/progress/progress_value.png")
			 
            return Assets.getBitmapData ("skins/android/progress/progress_value.png");
         
		
		if (inName=="skins/android/ratings/nostar.png")
			 
            return Assets.getBitmapData ("skins/android/ratings/nostar.png");
         
		
		if (inName=="skins/android/ratings/star.png")
			 
            return Assets.getBitmapData ("skins/android/ratings/star.png");
         
		
		if (inName=="skins/android/tabbar/tabbar_bg.png")
			 
            return Assets.getBitmapData ("skins/android/tabbar/tabbar_bg.png");
         
		
		if (inName=="skins/android/tabs/tab_selected_bg.png")
			 
            return Assets.getBitmapData ("skins/android/tabs/tab_selected_bg.png");
         
		
		if (inName=="skins/android/tabs/tab_unselected_bg.png")
			 
            return Assets.getBitmapData ("skins/android/tabs/tab_unselected_bg.png");
         
		
		if (inName=="skins/android/textinput/textinput_normal.png")
			 
            return Assets.getBitmapData ("skins/android/textinput/textinput_normal.png");
         
		
		if (inName=="skins/android/vscroll/vscroll_thumb_up.png")
			 
            return Assets.getBitmapData ("skins/android/vscroll/vscroll_thumb_up.png");
         
		
		if (inName=="skins/windows/button/button_down.png")
			 
            return Assets.getBitmapData ("skins/windows/button/button_down.png");
         
		
		if (inName=="skins/windows/button/button_over.png")
			 
            return Assets.getBitmapData ("skins/windows/button/button_over.png");
         
		
		if (inName=="skins/windows/button/button_up.png")
			 
            return Assets.getBitmapData ("skins/windows/button/button_up.png");
         
		
		if (inName=="skins/windows/checkbox/checkbox_checked_over.png")
			 
            return Assets.getBitmapData ("skins/windows/checkbox/checkbox_checked_over.png");
         
		
		if (inName=="skins/windows/checkbox/checkbox_checked_up.png")
			 
            return Assets.getBitmapData ("skins/windows/checkbox/checkbox_checked_up.png");
         
		
		if (inName=="skins/windows/checkbox/checkbox_unchecked_over.png")
			 
            return Assets.getBitmapData ("skins/windows/checkbox/checkbox_unchecked_over.png");
         
		
		if (inName=="skins/windows/checkbox/checkbox_unchecked_up.png")
			 
            return Assets.getBitmapData ("skins/windows/checkbox/checkbox_unchecked_up.png");
         
		
		if (inName=="skins/windows/container/container_bg.png")
			 
            return Assets.getBitmapData ("skins/windows/container/container_bg.png");
         
		
		if (inName=="skins/windows/fonts/segoeui.ttf")
			 
			 return Assets.getFont ("skins/windows/fonts/segoeui.ttf");
		 
		
		if (inName=="skins/windows/hscroll/hscroll_bg.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_bg.png");
         
		
		if (inName=="skins/windows/hscroll/hscroll_button_down.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_button_down.png");
         
		
		if (inName=="skins/windows/hscroll/hscroll_button_over.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_button_over.png");
         
		
		if (inName=="skins/windows/hscroll/hscroll_button_up.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_button_up.png");
         
		
		if (inName=="skins/windows/hscroll/hscroll_left_arrow.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_left_arrow.png");
         
		
		if (inName=="skins/windows/hscroll/hscroll_right_arrow.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_right_arrow.png");
         
		
		if (inName=="skins/windows/hscroll/hscroll_thumb_gripper_down.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_thumb_gripper_down.png");
         
		
		if (inName=="skins/windows/hscroll/hscroll_thumb_gripper_over.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_thumb_gripper_over.png");
         
		
		if (inName=="skins/windows/hscroll/hscroll_thumb_gripper_up.png")
			 
            return Assets.getBitmapData ("skins/windows/hscroll/hscroll_thumb_gripper_up.png");
         
		
		if (inName=="skins/windows/listview/listview_item_over.png")
			 
            return Assets.getBitmapData ("skins/windows/listview/listview_item_over.png");
         
		
		if (inName=="skins/windows/listview/listview_item_selected.png")
			 
            return Assets.getBitmapData ("skins/windows/listview/listview_item_selected.png");
         
		
		if (inName=="skins/windows/listview/listview_item_unselected.png")
			 
            return Assets.getBitmapData ("skins/windows/listview/listview_item_unselected.png");
         
		
		if (inName=="skins/windows/optionbox/optionbox_selected_over.png")
			 
            return Assets.getBitmapData ("skins/windows/optionbox/optionbox_selected_over.png");
         
		
		if (inName=="skins/windows/optionbox/optionbox_selected_up.png")
			 
            return Assets.getBitmapData ("skins/windows/optionbox/optionbox_selected_up.png");
         
		
		if (inName=="skins/windows/optionbox/optionbox_unselected_over.png")
			 
            return Assets.getBitmapData ("skins/windows/optionbox/optionbox_unselected_over.png");
         
		
		if (inName=="skins/windows/optionbox/optionbox_unselected_up.png")
			 
            return Assets.getBitmapData ("skins/windows/optionbox/optionbox_unselected_up.png");
         
		
		if (inName=="skins/windows/popup/popup_border.png")
			 
            return Assets.getBitmapData ("skins/windows/popup/popup_border.png");
         
		
		if (inName=="skins/windows/progress/progress_background.png")
			 
            return Assets.getBitmapData ("skins/windows/progress/progress_background.png");
         
		
		if (inName=="skins/windows/progress/progress_value.png")
			 
            return Assets.getBitmapData ("skins/windows/progress/progress_value.png");
         
		
		if (inName=="skins/windows/ratings/star-empty.png")
			 
            return Assets.getBitmapData ("skins/windows/ratings/star-empty.png");
         
		
		if (inName=="skins/windows/ratings/star.png")
			 
            return Assets.getBitmapData ("skins/windows/ratings/star.png");
         
		
		if (inName=="skins/windows/tabbar/tabbar_bg.png")
			 
            return Assets.getBitmapData ("skins/windows/tabbar/tabbar_bg.png");
         
		
		if (inName=="skins/windows/tabs/tab_selected_up.png")
			 
            return Assets.getBitmapData ("skins/windows/tabs/tab_selected_up.png");
         
		
		if (inName=="skins/windows/tabs/tab_unselected_over.png")
			 
            return Assets.getBitmapData ("skins/windows/tabs/tab_unselected_over.png");
         
		
		if (inName=="skins/windows/tabs/tab_unselected_up.png")
			 
            return Assets.getBitmapData ("skins/windows/tabs/tab_unselected_up.png");
         
		
		if (inName=="skins/windows/textinput/textinput_normal.png")
			 
            return Assets.getBitmapData ("skins/windows/textinput/textinput_normal.png");
         
		
		if (inName=="skins/windows/textinput/textinput_over.png")
			 
            return Assets.getBitmapData ("skins/windows/textinput/textinput_over.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_bg.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_bg.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_button_down.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_button_down.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_button_over.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_button_over.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_button_up.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_button_up.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_down_arrow.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_down_arrow.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_thumb_gripper_down.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_thumb_gripper_down.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_thumb_gripper_over.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_thumb_gripper_over.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_thumb_gripper_up.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_thumb_gripper_up.png");
         
		
		if (inName=="skins/windows/vscroll/vscroll_up_arrow.png")
			 
            return Assets.getBitmapData ("skins/windows/vscroll/vscroll_up_arrow.png");
         
		
		if (inName=="icons/address_book_16.png")
			 
            return Assets.getBitmapData ("icons/address_book_16.png");
         
		
		if (inName=="icons/address_book_32.png")
			 
            return Assets.getBitmapData ("icons/address_book_32.png");
         
		
		if (inName=="icons/application_16.png")
			 
            return Assets.getBitmapData ("icons/application_16.png");
         
		
		if (inName=="icons/application_24.png")
			 
            return Assets.getBitmapData ("icons/application_24.png");
         
		
		if (inName=="icons/application_32.png")
			 
            return Assets.getBitmapData ("icons/application_32.png");
         
		
		if (inName=="icons/application_48.png")
			 
            return Assets.getBitmapData ("icons/application_48.png");
         
		
		if (inName=="icons/default_16.png")
			 
            return Assets.getBitmapData ("icons/default_16.png");
         
		
		if (inName=="icons/default_32.png")
			 
            return Assets.getBitmapData ("icons/default_32.png");
         
		
		if (inName=="icons/fav_16.png")
			 
            return Assets.getBitmapData ("icons/fav_16.png");
         
		
		if (inName=="icons/fav_32.png")
			 
            return Assets.getBitmapData ("icons/fav_32.png");
         
		
		if (inName=="icons/file_blank_16.png")
			 
            return Assets.getBitmapData ("icons/file_blank_16.png");
         
		
		if (inName=="icons/file_blank_32.png")
			 
            return Assets.getBitmapData ("icons/file_blank_32.png");
         
		
		if (inName=="icons/file_gif_16.png")
			 
            return Assets.getBitmapData ("icons/file_gif_16.png");
         
		
		if (inName=="icons/file_gif_32.png")
			 
            return Assets.getBitmapData ("icons/file_gif_32.png");
         
		
		if (inName=="icons/file_text_16.png")
			 
            return Assets.getBitmapData ("icons/file_text_16.png");
         
		
		if (inName=="icons/file_text_32.png")
			 
            return Assets.getBitmapData ("icons/file_text_32.png");
         
		
		if (inName=="icons/folder_open_16.png")
			 
            return Assets.getBitmapData ("icons/folder_open_16.png");
         
		
		if (inName=="icons/folder_open_32.png")
			 
            return Assets.getBitmapData ("icons/folder_open_32.png");
         
		
		if (inName=="icons/home_16.png")
			 
            return Assets.getBitmapData ("icons/home_16.png");
         
		
		if (inName=="icons/home_32.png")
			 
            return Assets.getBitmapData ("icons/home_32.png");
         
		
		if (inName=="icons/search_16.png")
			 
            return Assets.getBitmapData ("icons/search_16.png");
         
		
		if (inName=="icons/search_32.png")
			 
            return Assets.getBitmapData ("icons/search_32.png");
         
		
		if (inName=="icons/settings_16.png")
			 
            return Assets.getBitmapData ("icons/settings_16.png");
         
		
		if (inName=="icons/settings_32.png")
			 
            return Assets.getBitmapData ("icons/settings_32.png");
         
		
		if (inName=="icons/user_16.png")
			 
            return Assets.getBitmapData ("icons/user_16.png");
         
		
		if (inName=="icons/user_32.png")
			 
            return Assets.getBitmapData ("icons/user_32.png");
         
		
		if (inName=="ui/test01.xml")
			 
			 return Assets.getText ("ui/test01.xml");
         
		
		if (inName=="assets/skins/android/audio/TW_Touch.mp3")
			 
            return Assets.getSound ("assets/skins/android/audio/TW_Touch.mp3");
         
		
		if (inName=="assets/skins/android/audio/TW_Touch.ogg")
			 
            return Assets.getSound ("assets/skins/android/audio/TW_Touch.ogg");
         
		
		if (inName=="assets/skins/android/audio/TW_Touch.wav")
			 
            return Assets.getSound ("assets/skins/android/audio/TW_Touch.wav");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}

class NME_assets_data_beep_mp3 extends nme.media.Sound { }
class NME_assets_alt_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_auto_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_alt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_base_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_beep_mp4 extends nme.media.Sound { }
class NME_assets_data_button_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_a_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_b_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_c_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_left_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_right_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_x_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_y_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_courier_ttf extends nme.text.Font { }
class NME_assets_data_cursor_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_default_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata10pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata11pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_handle_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_corners_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_light_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_nokiafc22_ttf extends nme.text.Font { }
class NME_assets_data_stick_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_flixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_open_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_pause_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_play_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_off_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_on_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_restart_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_step_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_stop_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vis_bounds_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_default_alt_txt extends nme.utils.ByteArray { }
class NME_assets_default_auto_txt extends nme.utils.ByteArray { }
class NME_assets_default_empty_txt extends nme.utils.ByteArray { }
class NME_assets_empty_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_haxeflixel_svg extends nme.utils.ByteArray { }
class NME_assets_icons_address_book_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_address_book_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_application_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_application_24_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_application_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_application_48_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_default_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_default_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_fav_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_fav_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_file_blank_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_file_blank_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_file_gif_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_file_gif_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_file_text_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_file_text_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_folder_open_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_folder_open_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_home_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_home_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_search_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_search_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_settings_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_settings_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_user_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_icons_user_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_agentorange_ttf extends nme.text.Font { }
class NME_assets_img_blank_pixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_slinky_jpg extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_slinky_large_jpg extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_slinky_small_jpg extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_test_skin_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_nme_svg extends nme.utils.ByteArray { }
class NME_assets_skins_android_audio_tw_touch_mp3 extends nme.media.Sound { }
class NME_assets_skins_android_audio_tw_touch_ogg extends nme.media.Sound { }
class NME_assets_skins_android_button_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_button_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_checkbox_checkbox_checked_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_checkbox_checkbox_unchecked_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_container_container_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_dropdown_dropdown_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_fonts_roboto_regular_ttf extends nme.text.Font { }
class NME_assets_skins_android_hscroll_hscroll_thumb_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_icons_fav_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_icons_folder_open_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_icons_home_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_icons_search_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_icons_settings_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_icons_user_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_list_list_item_popup_unselected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_list_list_item_selected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_list_list_item_unselected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_optionbox_optionbox_selected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_optionbox_optionbox_unselected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_popup_popup_border_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_popup_popup_border_no_title_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_progress_progress_background_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_progress_progress_value_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_ratings_nostar_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_ratings_star_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_tabbar_tabbar_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_tabs_tab_selected_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_tabs_tab_unselected_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_textinput_textinput_normal_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_android_vscroll_vscroll_thumb_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_button_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_button_button_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_button_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_checkbox_checkbox_checked_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_checkbox_checkbox_checked_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_checkbox_checkbox_unchecked_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_checkbox_checkbox_unchecked_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_container_container_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_fonts_segoeui_ttf extends nme.text.Font { }
class NME_assets_skins_windows_hscroll_hscroll_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_hscroll_hscroll_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_hscroll_hscroll_button_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_hscroll_hscroll_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_hscroll_hscroll_left_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_hscroll_hscroll_right_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_hscroll_hscroll_thumb_gripper_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_hscroll_hscroll_thumb_gripper_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_hscroll_hscroll_thumb_gripper_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_listview_listview_item_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_listview_listview_item_selected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_listview_listview_item_unselected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_optionbox_optionbox_selected_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_optionbox_optionbox_selected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_optionbox_optionbox_unselected_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_optionbox_optionbox_unselected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_popup_popup_border_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_progress_progress_background_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_progress_progress_value_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_ratings_star_empty_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_ratings_star_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_tabbar_tabbar_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_tabs_tab_selected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_tabs_tab_unselected_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_tabs_tab_unselected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_textinput_textinput_normal_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_textinput_textinput_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_button_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_down_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_thumb_gripper_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_thumb_gripper_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_thumb_gripper_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_skins_windows_vscroll_vscroll_up_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spaceman_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_ui_test01_xml extends nme.utils.ByteArray { }
class NME_img_agentorange_ttf extends nme.text.Font { }
class NME_img_blank_pixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_img_slinky_jpg extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_img_slinky_large_jpg extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_img_slinky_small_jpg extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_img_test_skin_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_audio_tw_touch_mp3 extends nme.media.Sound { }
class NME_skins_android_audio_tw_touch_ogg extends nme.media.Sound { }
class NME_skins_android_audio_tw_touch_wav extends nme.media.Sound { }
class NME_skins_android_button_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_button_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_checkbox_checkbox_checked_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_checkbox_checkbox_unchecked_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_container_container_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_dropdown_dropdown_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_fonts_roboto_regular_ttf extends nme.text.Font { }
class NME_skins_android_hscroll_hscroll_thumb_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_icons_fav_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_icons_folder_open_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_icons_home_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_icons_search_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_icons_settings_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_icons_user_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_list_list_item_popup_unselected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_list_list_item_selected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_list_list_item_unselected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_optionbox_optionbox_selected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_optionbox_optionbox_unselected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_popup_popup_border_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_popup_popup_border_no_title_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_progress_progress_background_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_progress_progress_value_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_ratings_nostar_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_ratings_star_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_tabbar_tabbar_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_tabs_tab_selected_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_tabs_tab_unselected_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_textinput_textinput_normal_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_android_vscroll_vscroll_thumb_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_button_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_button_button_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_button_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_checkbox_checkbox_checked_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_checkbox_checkbox_checked_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_checkbox_checkbox_unchecked_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_checkbox_checkbox_unchecked_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_container_container_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_fonts_segoeui_ttf extends nme.text.Font { }
class NME_skins_windows_hscroll_hscroll_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_hscroll_hscroll_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_hscroll_hscroll_button_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_hscroll_hscroll_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_hscroll_hscroll_left_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_hscroll_hscroll_right_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_hscroll_hscroll_thumb_gripper_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_hscroll_hscroll_thumb_gripper_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_hscroll_hscroll_thumb_gripper_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_listview_listview_item_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_listview_listview_item_selected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_listview_listview_item_unselected_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_optionbox_optionbox_selected_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_optionbox_optionbox_selected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_optionbox_optionbox_unselected_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_optionbox_optionbox_unselected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_popup_popup_border_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_progress_progress_background_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_progress_progress_value_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_ratings_star_empty_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_ratings_star_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_tabbar_tabbar_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_tabs_tab_selected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_tabs_tab_unselected_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_tabs_tab_unselected_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_textinput_textinput_normal_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_textinput_textinput_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_bg_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_button_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_down_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_thumb_gripper_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_thumb_gripper_over_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_thumb_gripper_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_skins_windows_vscroll_vscroll_up_arrow_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_address_book_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_address_book_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_application_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_application_24_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_application_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_application_48_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_default_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_default_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_fav_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_fav_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_file_blank_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_file_blank_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_file_gif_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_file_gif_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_file_text_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_file_text_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_folder_open_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_folder_open_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_home_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_home_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_search_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_search_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_settings_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_settings_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_user_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_icons_user_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_test01_xml extends nme.utils.ByteArray { }
class NME_assets_skins_android_audio_tw_touch_mp4 extends nme.media.Sound { }
class NME_assets_skins_android_audio_tw_touch_ogg1 extends nme.media.Sound { }
class NME_assets_skins_android_audio_tw_touch_wav extends nme.media.Sound { }


#else

import Main;

class ApplicationMain {
	
	public static function main () {
		
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
			if (Std.is (instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
		
	}

}

#end
