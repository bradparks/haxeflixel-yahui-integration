package nme.installer;


import format.display.MovieClip;
import haxe.Unserializer;
import nme.display.BitmapData;
import nme.media.Sound;
import nme.net.URLRequest;
import nme.text.Font;
import nme.utils.ByteArray;

#if swf
import format.SWF;
#end

#if xfl
import format.XFL;
#end


/**
 * ...
 * @author Joshua Granick
 */

class Assets {

	
	public static var cachedBitmapData:Hash<BitmapData> = new Hash<BitmapData>();
	#if swf private static var cachedSWFLibraries:Hash <SWF> = new Hash <SWF> (); #end
	#if xfl private static var cachedXFLLibraries:Hash <XFL> = new Hash <XFL> (); #end
	
	private static var initialized:Bool = false;
	private static var libraryTypes:Hash <String> = new Hash <String> ();
	private static var resourceNames:Hash <String> = new Hash <String> ();
	private static var resourceTypes:Hash <String> = new Hash <String> ();
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			resourceNames.set ("Beep", "assets/data/beep.wav");
			resourceTypes.set ("Beep", "sound");
			resourceNames.set ("assets/alt_tiles.png", "assets/alt_tiles.png");
			resourceTypes.set ("assets/alt_tiles.png", "image");
			resourceNames.set ("assets/auto_tiles.png", "assets/auto_tiles.png");
			resourceTypes.set ("assets/auto_tiles.png", "image");
			resourceNames.set ("assets/data/autotiles.png", "assets/data/autotiles.png");
			resourceTypes.set ("assets/data/autotiles.png", "image");
			resourceNames.set ("assets/data/autotiles_alt.png", "assets/data/autotiles_alt.png");
			resourceTypes.set ("assets/data/autotiles_alt.png", "image");
			resourceNames.set ("assets/data/base.png", "assets/data/base.png");
			resourceTypes.set ("assets/data/base.png", "image");
			resourceNames.set ("assets/data/beep.mp3", "assets/data/beep.mp3");
			resourceTypes.set ("assets/data/beep.mp3", "music");
			resourceNames.set ("assets/data/beep.wav", "assets/data/beep.wav");
			resourceTypes.set ("assets/data/beep.wav", "sound");
			resourceNames.set ("assets/data/button.png", "assets/data/button.png");
			resourceTypes.set ("assets/data/button.png", "image");
			resourceNames.set ("assets/data/button_a.png", "assets/data/button_a.png");
			resourceTypes.set ("assets/data/button_a.png", "image");
			resourceNames.set ("assets/data/button_b.png", "assets/data/button_b.png");
			resourceTypes.set ("assets/data/button_b.png", "image");
			resourceNames.set ("assets/data/button_c.png", "assets/data/button_c.png");
			resourceTypes.set ("assets/data/button_c.png", "image");
			resourceNames.set ("assets/data/button_down.png", "assets/data/button_down.png");
			resourceTypes.set ("assets/data/button_down.png", "image");
			resourceNames.set ("assets/data/button_left.png", "assets/data/button_left.png");
			resourceTypes.set ("assets/data/button_left.png", "image");
			resourceNames.set ("assets/data/button_right.png", "assets/data/button_right.png");
			resourceTypes.set ("assets/data/button_right.png", "image");
			resourceNames.set ("assets/data/button_up.png", "assets/data/button_up.png");
			resourceTypes.set ("assets/data/button_up.png", "image");
			resourceNames.set ("assets/data/button_x.png", "assets/data/button_x.png");
			resourceTypes.set ("assets/data/button_x.png", "image");
			resourceNames.set ("assets/data/button_y.png", "assets/data/button_y.png");
			resourceTypes.set ("assets/data/button_y.png", "image");
			resourceNames.set ("assets/data/courier.ttf", "assets/data/courier.ttf");
			resourceTypes.set ("assets/data/courier.ttf", "font");
			resourceNames.set ("assets/data/cursor.png", "assets/data/cursor.png");
			resourceTypes.set ("assets/data/cursor.png", "image");
			resourceNames.set ("assets/data/default.png", "assets/data/default.png");
			resourceTypes.set ("assets/data/default.png", "image");
			resourceNames.set ("assets/data/fontData10pt.png", "assets/data/fontData10pt.png");
			resourceTypes.set ("assets/data/fontData10pt.png", "image");
			resourceNames.set ("assets/data/fontData11pt.png", "assets/data/fontData11pt.png");
			resourceTypes.set ("assets/data/fontData11pt.png", "image");
			resourceNames.set ("assets/data/handle.png", "assets/data/handle.png");
			resourceTypes.set ("assets/data/handle.png", "image");
			resourceNames.set ("assets/data/logo.png", "assets/data/logo.png");
			resourceTypes.set ("assets/data/logo.png", "image");
			resourceNames.set ("assets/data/logo_corners.png", "assets/data/logo_corners.png");
			resourceTypes.set ("assets/data/logo_corners.png", "image");
			resourceNames.set ("assets/data/logo_light.png", "assets/data/logo_light.png");
			resourceTypes.set ("assets/data/logo_light.png", "image");
			resourceNames.set ("assets/data/nokiafc22.ttf", "assets/data/nokiafc22.ttf");
			resourceTypes.set ("assets/data/nokiafc22.ttf", "font");
			resourceNames.set ("assets/data/stick.png", "assets/data/stick.png");
			resourceTypes.set ("assets/data/stick.png", "image");
			resourceNames.set ("assets/data/vcr/flixel.png", "assets/data/vcr/flixel.png");
			resourceTypes.set ("assets/data/vcr/flixel.png", "image");
			resourceNames.set ("assets/data/vcr/open.png", "assets/data/vcr/open.png");
			resourceTypes.set ("assets/data/vcr/open.png", "image");
			resourceNames.set ("assets/data/vcr/pause.png", "assets/data/vcr/pause.png");
			resourceTypes.set ("assets/data/vcr/pause.png", "image");
			resourceNames.set ("assets/data/vcr/play.png", "assets/data/vcr/play.png");
			resourceTypes.set ("assets/data/vcr/play.png", "image");
			resourceNames.set ("assets/data/vcr/record_off.png", "assets/data/vcr/record_off.png");
			resourceTypes.set ("assets/data/vcr/record_off.png", "image");
			resourceNames.set ("assets/data/vcr/record_on.png", "assets/data/vcr/record_on.png");
			resourceTypes.set ("assets/data/vcr/record_on.png", "image");
			resourceNames.set ("assets/data/vcr/restart.png", "assets/data/vcr/restart.png");
			resourceTypes.set ("assets/data/vcr/restart.png", "image");
			resourceNames.set ("assets/data/vcr/step.png", "assets/data/vcr/step.png");
			resourceTypes.set ("assets/data/vcr/step.png", "image");
			resourceNames.set ("assets/data/vcr/stop.png", "assets/data/vcr/stop.png");
			resourceTypes.set ("assets/data/vcr/stop.png", "image");
			resourceNames.set ("assets/data/vis/bounds.png", "assets/data/vis/bounds.png");
			resourceTypes.set ("assets/data/vis/bounds.png", "image");
			resourceNames.set ("assets/default_alt.txt", "assets/default_alt.txt");
			resourceTypes.set ("assets/default_alt.txt", "text");
			resourceNames.set ("assets/default_auto.txt", "assets/default_auto.txt");
			resourceTypes.set ("assets/default_auto.txt", "text");
			resourceNames.set ("assets/default_empty.txt", "assets/default_empty.txt");
			resourceTypes.set ("assets/default_empty.txt", "text");
			resourceNames.set ("assets/empty_tiles.png", "assets/empty_tiles.png");
			resourceTypes.set ("assets/empty_tiles.png", "image");
			resourceNames.set ("assets/HaxeFlixel.svg", "assets/HaxeFlixel.svg");
			resourceTypes.set ("assets/HaxeFlixel.svg", "text");
			resourceNames.set ("assets/icons/address_book_16.png", "assets/icons/address_book_16.png");
			resourceTypes.set ("assets/icons/address_book_16.png", "image");
			resourceNames.set ("assets/icons/address_book_32.png", "assets/icons/address_book_32.png");
			resourceTypes.set ("assets/icons/address_book_32.png", "image");
			resourceNames.set ("assets/icons/application_16.png", "assets/icons/application_16.png");
			resourceTypes.set ("assets/icons/application_16.png", "image");
			resourceNames.set ("assets/icons/application_24.png", "assets/icons/application_24.png");
			resourceTypes.set ("assets/icons/application_24.png", "image");
			resourceNames.set ("assets/icons/application_32.png", "assets/icons/application_32.png");
			resourceTypes.set ("assets/icons/application_32.png", "image");
			resourceNames.set ("assets/icons/application_48.png", "assets/icons/application_48.png");
			resourceTypes.set ("assets/icons/application_48.png", "image");
			resourceNames.set ("assets/icons/default_16.png", "assets/icons/default_16.png");
			resourceTypes.set ("assets/icons/default_16.png", "image");
			resourceNames.set ("assets/icons/default_32.png", "assets/icons/default_32.png");
			resourceTypes.set ("assets/icons/default_32.png", "image");
			resourceNames.set ("assets/icons/fav_16.png", "assets/icons/fav_16.png");
			resourceTypes.set ("assets/icons/fav_16.png", "image");
			resourceNames.set ("assets/icons/fav_32.png", "assets/icons/fav_32.png");
			resourceTypes.set ("assets/icons/fav_32.png", "image");
			resourceNames.set ("assets/icons/file_blank_16.png", "assets/icons/file_blank_16.png");
			resourceTypes.set ("assets/icons/file_blank_16.png", "image");
			resourceNames.set ("assets/icons/file_blank_32.png", "assets/icons/file_blank_32.png");
			resourceTypes.set ("assets/icons/file_blank_32.png", "image");
			resourceNames.set ("assets/icons/file_gif_16.png", "assets/icons/file_gif_16.png");
			resourceTypes.set ("assets/icons/file_gif_16.png", "image");
			resourceNames.set ("assets/icons/file_gif_32.png", "assets/icons/file_gif_32.png");
			resourceTypes.set ("assets/icons/file_gif_32.png", "image");
			resourceNames.set ("assets/icons/file_text_16.png", "assets/icons/file_text_16.png");
			resourceTypes.set ("assets/icons/file_text_16.png", "image");
			resourceNames.set ("assets/icons/file_text_32.png", "assets/icons/file_text_32.png");
			resourceTypes.set ("assets/icons/file_text_32.png", "image");
			resourceNames.set ("assets/icons/folder_open_16.png", "assets/icons/folder_open_16.png");
			resourceTypes.set ("assets/icons/folder_open_16.png", "image");
			resourceNames.set ("assets/icons/folder_open_32.png", "assets/icons/folder_open_32.png");
			resourceTypes.set ("assets/icons/folder_open_32.png", "image");
			resourceNames.set ("assets/icons/home_16.png", "assets/icons/home_16.png");
			resourceTypes.set ("assets/icons/home_16.png", "image");
			resourceNames.set ("assets/icons/home_32.png", "assets/icons/home_32.png");
			resourceTypes.set ("assets/icons/home_32.png", "image");
			resourceNames.set ("assets/icons/search_16.png", "assets/icons/search_16.png");
			resourceTypes.set ("assets/icons/search_16.png", "image");
			resourceNames.set ("assets/icons/search_32.png", "assets/icons/search_32.png");
			resourceTypes.set ("assets/icons/search_32.png", "image");
			resourceNames.set ("assets/icons/settings_16.png", "assets/icons/settings_16.png");
			resourceTypes.set ("assets/icons/settings_16.png", "image");
			resourceNames.set ("assets/icons/settings_32.png", "assets/icons/settings_32.png");
			resourceTypes.set ("assets/icons/settings_32.png", "image");
			resourceNames.set ("assets/icons/user_16.png", "assets/icons/user_16.png");
			resourceTypes.set ("assets/icons/user_16.png", "image");
			resourceNames.set ("assets/icons/user_32.png", "assets/icons/user_32.png");
			resourceTypes.set ("assets/icons/user_32.png", "image");
			resourceNames.set ("assets/img/AgentOrange.ttf", "assets/img/AgentOrange.ttf");
			resourceTypes.set ("assets/img/AgentOrange.ttf", "font");
			resourceNames.set ("assets/img/blank_pixel.png", "assets/img/blank_pixel.png");
			resourceTypes.set ("assets/img/blank_pixel.png", "image");
			resourceNames.set ("assets/img/slinky.jpg", "assets/img/slinky.jpg");
			resourceTypes.set ("assets/img/slinky.jpg", "image");
			resourceNames.set ("assets/img/slinky_large.jpg", "assets/img/slinky_large.jpg");
			resourceTypes.set ("assets/img/slinky_large.jpg", "image");
			resourceNames.set ("assets/img/slinky_small.jpg", "assets/img/slinky_small.jpg");
			resourceTypes.set ("assets/img/slinky_small.jpg", "image");
			resourceNames.set ("assets/img/test_skin.png", "assets/img/test_skin.png");
			resourceTypes.set ("assets/img/test_skin.png", "image");
			resourceNames.set ("assets/nme.svg", "assets/nme.svg");
			resourceTypes.set ("assets/nme.svg", "text");
			resourceNames.set ("assets/skins/android/audio/TW_Touch.mp3", "assets/skins/android/audio/TW_Touch.mp3");
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.mp3", "music");
			resourceNames.set ("assets/skins/android/audio/TW_Touch.ogg", "assets/skins/android/audio/TW_Touch.ogg");
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.ogg", "sound");
			resourceNames.set ("assets/skins/android/audio/TW_Touch.wav", "assets/skins/android/audio/TW_Touch.wav");
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.wav", "sound");
			resourceNames.set ("assets/skins/android/button/button_down.png", "assets/skins/android/button/button_down.png");
			resourceTypes.set ("assets/skins/android/button/button_down.png", "image");
			resourceNames.set ("assets/skins/android/button/button_up.png", "assets/skins/android/button/button_up.png");
			resourceTypes.set ("assets/skins/android/button/button_up.png", "image");
			resourceNames.set ("assets/skins/android/checkbox/checkbox_checked_up.png", "assets/skins/android/checkbox/checkbox_checked_up.png");
			resourceTypes.set ("assets/skins/android/checkbox/checkbox_checked_up.png", "image");
			resourceNames.set ("assets/skins/android/checkbox/checkbox_unchecked_up.png", "assets/skins/android/checkbox/checkbox_unchecked_up.png");
			resourceTypes.set ("assets/skins/android/checkbox/checkbox_unchecked_up.png", "image");
			resourceNames.set ("assets/skins/android/container/container_bg.png", "assets/skins/android/container/container_bg.png");
			resourceTypes.set ("assets/skins/android/container/container_bg.png", "image");
			resourceNames.set ("assets/skins/android/dropdown/dropdown_arrow.png", "assets/skins/android/dropdown/dropdown_arrow.png");
			resourceTypes.set ("assets/skins/android/dropdown/dropdown_arrow.png", "image");
			resourceNames.set ("assets/skins/android/fonts/Roboto-Regular.ttf", "assets/skins/android/fonts/Roboto-Regular.ttf");
			resourceTypes.set ("assets/skins/android/fonts/Roboto-Regular.ttf", "font");
			resourceNames.set ("assets/skins/android/hscroll/hscroll_thumb_up.png", "assets/skins/android/hscroll/hscroll_thumb_up.png");
			resourceTypes.set ("assets/skins/android/hscroll/hscroll_thumb_up.png", "image");
			resourceNames.set ("assets/skins/android/icons/fav_32.png", "assets/skins/android/icons/fav_32.png");
			resourceTypes.set ("assets/skins/android/icons/fav_32.png", "image");
			resourceNames.set ("assets/skins/android/icons/folder_open_32.png", "assets/skins/android/icons/folder_open_32.png");
			resourceTypes.set ("assets/skins/android/icons/folder_open_32.png", "image");
			resourceNames.set ("assets/skins/android/icons/home_32.png", "assets/skins/android/icons/home_32.png");
			resourceTypes.set ("assets/skins/android/icons/home_32.png", "image");
			resourceNames.set ("assets/skins/android/icons/search_32.png", "assets/skins/android/icons/search_32.png");
			resourceTypes.set ("assets/skins/android/icons/search_32.png", "image");
			resourceNames.set ("assets/skins/android/icons/settings_32.png", "assets/skins/android/icons/settings_32.png");
			resourceTypes.set ("assets/skins/android/icons/settings_32.png", "image");
			resourceNames.set ("assets/skins/android/icons/user_32.png", "assets/skins/android/icons/user_32.png");
			resourceTypes.set ("assets/skins/android/icons/user_32.png", "image");
			resourceNames.set ("assets/skins/android/list/list_item_popup_unselected.png", "assets/skins/android/list/list_item_popup_unselected.png");
			resourceTypes.set ("assets/skins/android/list/list_item_popup_unselected.png", "image");
			resourceNames.set ("assets/skins/android/list/list_item_selected.png", "assets/skins/android/list/list_item_selected.png");
			resourceTypes.set ("assets/skins/android/list/list_item_selected.png", "image");
			resourceNames.set ("assets/skins/android/list/list_item_unselected.png", "assets/skins/android/list/list_item_unselected.png");
			resourceTypes.set ("assets/skins/android/list/list_item_unselected.png", "image");
			resourceNames.set ("assets/skins/android/optionbox/optionbox_selected_up.png", "assets/skins/android/optionbox/optionbox_selected_up.png");
			resourceTypes.set ("assets/skins/android/optionbox/optionbox_selected_up.png", "image");
			resourceNames.set ("assets/skins/android/optionbox/optionbox_unselected_up.png", "assets/skins/android/optionbox/optionbox_unselected_up.png");
			resourceTypes.set ("assets/skins/android/optionbox/optionbox_unselected_up.png", "image");
			resourceNames.set ("assets/skins/android/popup/popup_border.png", "assets/skins/android/popup/popup_border.png");
			resourceTypes.set ("assets/skins/android/popup/popup_border.png", "image");
			resourceNames.set ("assets/skins/android/popup/popup_border_no_title.png", "assets/skins/android/popup/popup_border_no_title.png");
			resourceTypes.set ("assets/skins/android/popup/popup_border_no_title.png", "image");
			resourceNames.set ("assets/skins/android/progress/progress_background.png", "assets/skins/android/progress/progress_background.png");
			resourceTypes.set ("assets/skins/android/progress/progress_background.png", "image");
			resourceNames.set ("assets/skins/android/progress/progress_value.png", "assets/skins/android/progress/progress_value.png");
			resourceTypes.set ("assets/skins/android/progress/progress_value.png", "image");
			resourceNames.set ("assets/skins/android/ratings/nostar.png", "assets/skins/android/ratings/nostar.png");
			resourceTypes.set ("assets/skins/android/ratings/nostar.png", "image");
			resourceNames.set ("assets/skins/android/ratings/star.png", "assets/skins/android/ratings/star.png");
			resourceTypes.set ("assets/skins/android/ratings/star.png", "image");
			resourceNames.set ("assets/skins/android/tabbar/tabbar_bg.png", "assets/skins/android/tabbar/tabbar_bg.png");
			resourceTypes.set ("assets/skins/android/tabbar/tabbar_bg.png", "image");
			resourceNames.set ("assets/skins/android/tabs/tab_selected_bg.png", "assets/skins/android/tabs/tab_selected_bg.png");
			resourceTypes.set ("assets/skins/android/tabs/tab_selected_bg.png", "image");
			resourceNames.set ("assets/skins/android/tabs/tab_unselected_bg.png", "assets/skins/android/tabs/tab_unselected_bg.png");
			resourceTypes.set ("assets/skins/android/tabs/tab_unselected_bg.png", "image");
			resourceNames.set ("assets/skins/android/textinput/textinput_normal.png", "assets/skins/android/textinput/textinput_normal.png");
			resourceTypes.set ("assets/skins/android/textinput/textinput_normal.png", "image");
			resourceNames.set ("assets/skins/android/vscroll/vscroll_thumb_up.png", "assets/skins/android/vscroll/vscroll_thumb_up.png");
			resourceTypes.set ("assets/skins/android/vscroll/vscroll_thumb_up.png", "image");
			resourceNames.set ("assets/skins/windows/button/button_down.png", "assets/skins/windows/button/button_down.png");
			resourceTypes.set ("assets/skins/windows/button/button_down.png", "image");
			resourceNames.set ("assets/skins/windows/button/button_over.png", "assets/skins/windows/button/button_over.png");
			resourceTypes.set ("assets/skins/windows/button/button_over.png", "image");
			resourceNames.set ("assets/skins/windows/button/button_up.png", "assets/skins/windows/button/button_up.png");
			resourceTypes.set ("assets/skins/windows/button/button_up.png", "image");
			resourceNames.set ("assets/skins/windows/checkbox/checkbox_checked_over.png", "assets/skins/windows/checkbox/checkbox_checked_over.png");
			resourceTypes.set ("assets/skins/windows/checkbox/checkbox_checked_over.png", "image");
			resourceNames.set ("assets/skins/windows/checkbox/checkbox_checked_up.png", "assets/skins/windows/checkbox/checkbox_checked_up.png");
			resourceTypes.set ("assets/skins/windows/checkbox/checkbox_checked_up.png", "image");
			resourceNames.set ("assets/skins/windows/checkbox/checkbox_unchecked_over.png", "assets/skins/windows/checkbox/checkbox_unchecked_over.png");
			resourceTypes.set ("assets/skins/windows/checkbox/checkbox_unchecked_over.png", "image");
			resourceNames.set ("assets/skins/windows/checkbox/checkbox_unchecked_up.png", "assets/skins/windows/checkbox/checkbox_unchecked_up.png");
			resourceTypes.set ("assets/skins/windows/checkbox/checkbox_unchecked_up.png", "image");
			resourceNames.set ("assets/skins/windows/container/container_bg.png", "assets/skins/windows/container/container_bg.png");
			resourceTypes.set ("assets/skins/windows/container/container_bg.png", "image");
			resourceNames.set ("assets/skins/windows/fonts/segoeui.ttf", "assets/skins/windows/fonts/segoeui.ttf");
			resourceTypes.set ("assets/skins/windows/fonts/segoeui.ttf", "font");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_bg.png", "assets/skins/windows/hscroll/hscroll_bg.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_bg.png", "image");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_button_down.png", "assets/skins/windows/hscroll/hscroll_button_down.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_button_down.png", "image");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_button_over.png", "assets/skins/windows/hscroll/hscroll_button_over.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_button_over.png", "image");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_button_up.png", "assets/skins/windows/hscroll/hscroll_button_up.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_button_up.png", "image");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_left_arrow.png", "assets/skins/windows/hscroll/hscroll_left_arrow.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_left_arrow.png", "image");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_right_arrow.png", "assets/skins/windows/hscroll/hscroll_right_arrow.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_right_arrow.png", "image");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png", "assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png", "image");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png", "assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png", "image");
			resourceNames.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png", "assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png");
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png", "image");
			resourceNames.set ("assets/skins/windows/listview/listview_item_over.png", "assets/skins/windows/listview/listview_item_over.png");
			resourceTypes.set ("assets/skins/windows/listview/listview_item_over.png", "image");
			resourceNames.set ("assets/skins/windows/listview/listview_item_selected.png", "assets/skins/windows/listview/listview_item_selected.png");
			resourceTypes.set ("assets/skins/windows/listview/listview_item_selected.png", "image");
			resourceNames.set ("assets/skins/windows/listview/listview_item_unselected.png", "assets/skins/windows/listview/listview_item_unselected.png");
			resourceTypes.set ("assets/skins/windows/listview/listview_item_unselected.png", "image");
			resourceNames.set ("assets/skins/windows/optionbox/optionbox_selected_over.png", "assets/skins/windows/optionbox/optionbox_selected_over.png");
			resourceTypes.set ("assets/skins/windows/optionbox/optionbox_selected_over.png", "image");
			resourceNames.set ("assets/skins/windows/optionbox/optionbox_selected_up.png", "assets/skins/windows/optionbox/optionbox_selected_up.png");
			resourceTypes.set ("assets/skins/windows/optionbox/optionbox_selected_up.png", "image");
			resourceNames.set ("assets/skins/windows/optionbox/optionbox_unselected_over.png", "assets/skins/windows/optionbox/optionbox_unselected_over.png");
			resourceTypes.set ("assets/skins/windows/optionbox/optionbox_unselected_over.png", "image");
			resourceNames.set ("assets/skins/windows/optionbox/optionbox_unselected_up.png", "assets/skins/windows/optionbox/optionbox_unselected_up.png");
			resourceTypes.set ("assets/skins/windows/optionbox/optionbox_unselected_up.png", "image");
			resourceNames.set ("assets/skins/windows/popup/popup_border.png", "assets/skins/windows/popup/popup_border.png");
			resourceTypes.set ("assets/skins/windows/popup/popup_border.png", "image");
			resourceNames.set ("assets/skins/windows/progress/progress_background.png", "assets/skins/windows/progress/progress_background.png");
			resourceTypes.set ("assets/skins/windows/progress/progress_background.png", "image");
			resourceNames.set ("assets/skins/windows/progress/progress_value.png", "assets/skins/windows/progress/progress_value.png");
			resourceTypes.set ("assets/skins/windows/progress/progress_value.png", "image");
			resourceNames.set ("assets/skins/windows/ratings/star-empty.png", "assets/skins/windows/ratings/star-empty.png");
			resourceTypes.set ("assets/skins/windows/ratings/star-empty.png", "image");
			resourceNames.set ("assets/skins/windows/ratings/star.png", "assets/skins/windows/ratings/star.png");
			resourceTypes.set ("assets/skins/windows/ratings/star.png", "image");
			resourceNames.set ("assets/skins/windows/tabbar/tabbar_bg.png", "assets/skins/windows/tabbar/tabbar_bg.png");
			resourceTypes.set ("assets/skins/windows/tabbar/tabbar_bg.png", "image");
			resourceNames.set ("assets/skins/windows/tabs/tab_selected_up.png", "assets/skins/windows/tabs/tab_selected_up.png");
			resourceTypes.set ("assets/skins/windows/tabs/tab_selected_up.png", "image");
			resourceNames.set ("assets/skins/windows/tabs/tab_unselected_over.png", "assets/skins/windows/tabs/tab_unselected_over.png");
			resourceTypes.set ("assets/skins/windows/tabs/tab_unselected_over.png", "image");
			resourceNames.set ("assets/skins/windows/tabs/tab_unselected_up.png", "assets/skins/windows/tabs/tab_unselected_up.png");
			resourceTypes.set ("assets/skins/windows/tabs/tab_unselected_up.png", "image");
			resourceNames.set ("assets/skins/windows/textinput/textinput_normal.png", "assets/skins/windows/textinput/textinput_normal.png");
			resourceTypes.set ("assets/skins/windows/textinput/textinput_normal.png", "image");
			resourceNames.set ("assets/skins/windows/textinput/textinput_over.png", "assets/skins/windows/textinput/textinput_over.png");
			resourceTypes.set ("assets/skins/windows/textinput/textinput_over.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_bg.png", "assets/skins/windows/vscroll/vscroll_bg.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_bg.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_button_down.png", "assets/skins/windows/vscroll/vscroll_button_down.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_button_down.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_button_over.png", "assets/skins/windows/vscroll/vscroll_button_over.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_button_over.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_button_up.png", "assets/skins/windows/vscroll/vscroll_button_up.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_button_up.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_down_arrow.png", "assets/skins/windows/vscroll/vscroll_down_arrow.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_down_arrow.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png", "assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png", "assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png", "assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png", "image");
			resourceNames.set ("assets/skins/windows/vscroll/vscroll_up_arrow.png", "assets/skins/windows/vscroll/vscroll_up_arrow.png");
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_up_arrow.png", "image");
			resourceNames.set ("assets/spaceman.png", "assets/spaceman.png");
			resourceTypes.set ("assets/spaceman.png", "image");
			resourceNames.set ("assets/ui/test01.xml", "assets/ui/test01.xml");
			resourceTypes.set ("assets/ui/test01.xml", "text");
			resourceNames.set ("img/AgentOrange.ttf", "img/AgentOrange.ttf");
			resourceTypes.set ("img/AgentOrange.ttf", "font");
			resourceNames.set ("img/blank_pixel.png", "img/blank_pixel.png");
			resourceTypes.set ("img/blank_pixel.png", "image");
			resourceNames.set ("img/slinky.jpg", "img/slinky.jpg");
			resourceTypes.set ("img/slinky.jpg", "image");
			resourceNames.set ("img/slinky_large.jpg", "img/slinky_large.jpg");
			resourceTypes.set ("img/slinky_large.jpg", "image");
			resourceNames.set ("img/slinky_small.jpg", "img/slinky_small.jpg");
			resourceTypes.set ("img/slinky_small.jpg", "image");
			resourceNames.set ("img/test_skin.png", "img/test_skin.png");
			resourceTypes.set ("img/test_skin.png", "image");
			resourceNames.set ("skins/android/audio/TW_Touch.mp3", "skins/android/audio/TW_Touch.mp3");
			resourceTypes.set ("skins/android/audio/TW_Touch.mp3", "music");
			resourceNames.set ("skins/android/audio/TW_Touch.ogg", "skins/android/audio/TW_Touch.ogg");
			resourceTypes.set ("skins/android/audio/TW_Touch.ogg", "sound");
			resourceNames.set ("skins/android/audio/TW_Touch.wav", "skins/android/audio/TW_Touch.wav");
			resourceTypes.set ("skins/android/audio/TW_Touch.wav", "sound");
			resourceNames.set ("skins/android/button/button_down.png", "skins/android/button/button_down.png");
			resourceTypes.set ("skins/android/button/button_down.png", "image");
			resourceNames.set ("skins/android/button/button_up.png", "skins/android/button/button_up.png");
			resourceTypes.set ("skins/android/button/button_up.png", "image");
			resourceNames.set ("skins/android/checkbox/checkbox_checked_up.png", "skins/android/checkbox/checkbox_checked_up.png");
			resourceTypes.set ("skins/android/checkbox/checkbox_checked_up.png", "image");
			resourceNames.set ("skins/android/checkbox/checkbox_unchecked_up.png", "skins/android/checkbox/checkbox_unchecked_up.png");
			resourceTypes.set ("skins/android/checkbox/checkbox_unchecked_up.png", "image");
			resourceNames.set ("skins/android/container/container_bg.png", "skins/android/container/container_bg.png");
			resourceTypes.set ("skins/android/container/container_bg.png", "image");
			resourceNames.set ("skins/android/dropdown/dropdown_arrow.png", "skins/android/dropdown/dropdown_arrow.png");
			resourceTypes.set ("skins/android/dropdown/dropdown_arrow.png", "image");
			resourceNames.set ("skins/android/fonts/Roboto-Regular.ttf", "skins/android/fonts/Roboto-Regular.ttf");
			resourceTypes.set ("skins/android/fonts/Roboto-Regular.ttf", "font");
			resourceNames.set ("skins/android/hscroll/hscroll_thumb_up.png", "skins/android/hscroll/hscroll_thumb_up.png");
			resourceTypes.set ("skins/android/hscroll/hscroll_thumb_up.png", "image");
			resourceNames.set ("skins/android/icons/fav_32.png", "skins/android/icons/fav_32.png");
			resourceTypes.set ("skins/android/icons/fav_32.png", "image");
			resourceNames.set ("skins/android/icons/folder_open_32.png", "skins/android/icons/folder_open_32.png");
			resourceTypes.set ("skins/android/icons/folder_open_32.png", "image");
			resourceNames.set ("skins/android/icons/home_32.png", "skins/android/icons/home_32.png");
			resourceTypes.set ("skins/android/icons/home_32.png", "image");
			resourceNames.set ("skins/android/icons/search_32.png", "skins/android/icons/search_32.png");
			resourceTypes.set ("skins/android/icons/search_32.png", "image");
			resourceNames.set ("skins/android/icons/settings_32.png", "skins/android/icons/settings_32.png");
			resourceTypes.set ("skins/android/icons/settings_32.png", "image");
			resourceNames.set ("skins/android/icons/user_32.png", "skins/android/icons/user_32.png");
			resourceTypes.set ("skins/android/icons/user_32.png", "image");
			resourceNames.set ("skins/android/list/list_item_popup_unselected.png", "skins/android/list/list_item_popup_unselected.png");
			resourceTypes.set ("skins/android/list/list_item_popup_unselected.png", "image");
			resourceNames.set ("skins/android/list/list_item_selected.png", "skins/android/list/list_item_selected.png");
			resourceTypes.set ("skins/android/list/list_item_selected.png", "image");
			resourceNames.set ("skins/android/list/list_item_unselected.png", "skins/android/list/list_item_unselected.png");
			resourceTypes.set ("skins/android/list/list_item_unselected.png", "image");
			resourceNames.set ("skins/android/optionbox/optionbox_selected_up.png", "skins/android/optionbox/optionbox_selected_up.png");
			resourceTypes.set ("skins/android/optionbox/optionbox_selected_up.png", "image");
			resourceNames.set ("skins/android/optionbox/optionbox_unselected_up.png", "skins/android/optionbox/optionbox_unselected_up.png");
			resourceTypes.set ("skins/android/optionbox/optionbox_unselected_up.png", "image");
			resourceNames.set ("skins/android/popup/popup_border.png", "skins/android/popup/popup_border.png");
			resourceTypes.set ("skins/android/popup/popup_border.png", "image");
			resourceNames.set ("skins/android/popup/popup_border_no_title.png", "skins/android/popup/popup_border_no_title.png");
			resourceTypes.set ("skins/android/popup/popup_border_no_title.png", "image");
			resourceNames.set ("skins/android/progress/progress_background.png", "skins/android/progress/progress_background.png");
			resourceTypes.set ("skins/android/progress/progress_background.png", "image");
			resourceNames.set ("skins/android/progress/progress_value.png", "skins/android/progress/progress_value.png");
			resourceTypes.set ("skins/android/progress/progress_value.png", "image");
			resourceNames.set ("skins/android/ratings/nostar.png", "skins/android/ratings/nostar.png");
			resourceTypes.set ("skins/android/ratings/nostar.png", "image");
			resourceNames.set ("skins/android/ratings/star.png", "skins/android/ratings/star.png");
			resourceTypes.set ("skins/android/ratings/star.png", "image");
			resourceNames.set ("skins/android/tabbar/tabbar_bg.png", "skins/android/tabbar/tabbar_bg.png");
			resourceTypes.set ("skins/android/tabbar/tabbar_bg.png", "image");
			resourceNames.set ("skins/android/tabs/tab_selected_bg.png", "skins/android/tabs/tab_selected_bg.png");
			resourceTypes.set ("skins/android/tabs/tab_selected_bg.png", "image");
			resourceNames.set ("skins/android/tabs/tab_unselected_bg.png", "skins/android/tabs/tab_unselected_bg.png");
			resourceTypes.set ("skins/android/tabs/tab_unselected_bg.png", "image");
			resourceNames.set ("skins/android/textinput/textinput_normal.png", "skins/android/textinput/textinput_normal.png");
			resourceTypes.set ("skins/android/textinput/textinput_normal.png", "image");
			resourceNames.set ("skins/android/vscroll/vscroll_thumb_up.png", "skins/android/vscroll/vscroll_thumb_up.png");
			resourceTypes.set ("skins/android/vscroll/vscroll_thumb_up.png", "image");
			resourceNames.set ("skins/windows/button/button_down.png", "skins/windows/button/button_down.png");
			resourceTypes.set ("skins/windows/button/button_down.png", "image");
			resourceNames.set ("skins/windows/button/button_over.png", "skins/windows/button/button_over.png");
			resourceTypes.set ("skins/windows/button/button_over.png", "image");
			resourceNames.set ("skins/windows/button/button_up.png", "skins/windows/button/button_up.png");
			resourceTypes.set ("skins/windows/button/button_up.png", "image");
			resourceNames.set ("skins/windows/checkbox/checkbox_checked_over.png", "skins/windows/checkbox/checkbox_checked_over.png");
			resourceTypes.set ("skins/windows/checkbox/checkbox_checked_over.png", "image");
			resourceNames.set ("skins/windows/checkbox/checkbox_checked_up.png", "skins/windows/checkbox/checkbox_checked_up.png");
			resourceTypes.set ("skins/windows/checkbox/checkbox_checked_up.png", "image");
			resourceNames.set ("skins/windows/checkbox/checkbox_unchecked_over.png", "skins/windows/checkbox/checkbox_unchecked_over.png");
			resourceTypes.set ("skins/windows/checkbox/checkbox_unchecked_over.png", "image");
			resourceNames.set ("skins/windows/checkbox/checkbox_unchecked_up.png", "skins/windows/checkbox/checkbox_unchecked_up.png");
			resourceTypes.set ("skins/windows/checkbox/checkbox_unchecked_up.png", "image");
			resourceNames.set ("skins/windows/container/container_bg.png", "skins/windows/container/container_bg.png");
			resourceTypes.set ("skins/windows/container/container_bg.png", "image");
			resourceNames.set ("skins/windows/fonts/segoeui.ttf", "skins/windows/fonts/segoeui.ttf");
			resourceTypes.set ("skins/windows/fonts/segoeui.ttf", "font");
			resourceNames.set ("skins/windows/hscroll/hscroll_bg.png", "skins/windows/hscroll/hscroll_bg.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_bg.png", "image");
			resourceNames.set ("skins/windows/hscroll/hscroll_button_down.png", "skins/windows/hscroll/hscroll_button_down.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_button_down.png", "image");
			resourceNames.set ("skins/windows/hscroll/hscroll_button_over.png", "skins/windows/hscroll/hscroll_button_over.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_button_over.png", "image");
			resourceNames.set ("skins/windows/hscroll/hscroll_button_up.png", "skins/windows/hscroll/hscroll_button_up.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_button_up.png", "image");
			resourceNames.set ("skins/windows/hscroll/hscroll_left_arrow.png", "skins/windows/hscroll/hscroll_left_arrow.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_left_arrow.png", "image");
			resourceNames.set ("skins/windows/hscroll/hscroll_right_arrow.png", "skins/windows/hscroll/hscroll_right_arrow.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_right_arrow.png", "image");
			resourceNames.set ("skins/windows/hscroll/hscroll_thumb_gripper_down.png", "skins/windows/hscroll/hscroll_thumb_gripper_down.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_thumb_gripper_down.png", "image");
			resourceNames.set ("skins/windows/hscroll/hscroll_thumb_gripper_over.png", "skins/windows/hscroll/hscroll_thumb_gripper_over.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_thumb_gripper_over.png", "image");
			resourceNames.set ("skins/windows/hscroll/hscroll_thumb_gripper_up.png", "skins/windows/hscroll/hscroll_thumb_gripper_up.png");
			resourceTypes.set ("skins/windows/hscroll/hscroll_thumb_gripper_up.png", "image");
			resourceNames.set ("skins/windows/listview/listview_item_over.png", "skins/windows/listview/listview_item_over.png");
			resourceTypes.set ("skins/windows/listview/listview_item_over.png", "image");
			resourceNames.set ("skins/windows/listview/listview_item_selected.png", "skins/windows/listview/listview_item_selected.png");
			resourceTypes.set ("skins/windows/listview/listview_item_selected.png", "image");
			resourceNames.set ("skins/windows/listview/listview_item_unselected.png", "skins/windows/listview/listview_item_unselected.png");
			resourceTypes.set ("skins/windows/listview/listview_item_unselected.png", "image");
			resourceNames.set ("skins/windows/optionbox/optionbox_selected_over.png", "skins/windows/optionbox/optionbox_selected_over.png");
			resourceTypes.set ("skins/windows/optionbox/optionbox_selected_over.png", "image");
			resourceNames.set ("skins/windows/optionbox/optionbox_selected_up.png", "skins/windows/optionbox/optionbox_selected_up.png");
			resourceTypes.set ("skins/windows/optionbox/optionbox_selected_up.png", "image");
			resourceNames.set ("skins/windows/optionbox/optionbox_unselected_over.png", "skins/windows/optionbox/optionbox_unselected_over.png");
			resourceTypes.set ("skins/windows/optionbox/optionbox_unselected_over.png", "image");
			resourceNames.set ("skins/windows/optionbox/optionbox_unselected_up.png", "skins/windows/optionbox/optionbox_unselected_up.png");
			resourceTypes.set ("skins/windows/optionbox/optionbox_unselected_up.png", "image");
			resourceNames.set ("skins/windows/popup/popup_border.png", "skins/windows/popup/popup_border.png");
			resourceTypes.set ("skins/windows/popup/popup_border.png", "image");
			resourceNames.set ("skins/windows/progress/progress_background.png", "skins/windows/progress/progress_background.png");
			resourceTypes.set ("skins/windows/progress/progress_background.png", "image");
			resourceNames.set ("skins/windows/progress/progress_value.png", "skins/windows/progress/progress_value.png");
			resourceTypes.set ("skins/windows/progress/progress_value.png", "image");
			resourceNames.set ("skins/windows/ratings/star-empty.png", "skins/windows/ratings/star-empty.png");
			resourceTypes.set ("skins/windows/ratings/star-empty.png", "image");
			resourceNames.set ("skins/windows/ratings/star.png", "skins/windows/ratings/star.png");
			resourceTypes.set ("skins/windows/ratings/star.png", "image");
			resourceNames.set ("skins/windows/tabbar/tabbar_bg.png", "skins/windows/tabbar/tabbar_bg.png");
			resourceTypes.set ("skins/windows/tabbar/tabbar_bg.png", "image");
			resourceNames.set ("skins/windows/tabs/tab_selected_up.png", "skins/windows/tabs/tab_selected_up.png");
			resourceTypes.set ("skins/windows/tabs/tab_selected_up.png", "image");
			resourceNames.set ("skins/windows/tabs/tab_unselected_over.png", "skins/windows/tabs/tab_unselected_over.png");
			resourceTypes.set ("skins/windows/tabs/tab_unselected_over.png", "image");
			resourceNames.set ("skins/windows/tabs/tab_unselected_up.png", "skins/windows/tabs/tab_unselected_up.png");
			resourceTypes.set ("skins/windows/tabs/tab_unselected_up.png", "image");
			resourceNames.set ("skins/windows/textinput/textinput_normal.png", "skins/windows/textinput/textinput_normal.png");
			resourceTypes.set ("skins/windows/textinput/textinput_normal.png", "image");
			resourceNames.set ("skins/windows/textinput/textinput_over.png", "skins/windows/textinput/textinput_over.png");
			resourceTypes.set ("skins/windows/textinput/textinput_over.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_bg.png", "skins/windows/vscroll/vscroll_bg.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_bg.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_button_down.png", "skins/windows/vscroll/vscroll_button_down.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_button_down.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_button_over.png", "skins/windows/vscroll/vscroll_button_over.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_button_over.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_button_up.png", "skins/windows/vscroll/vscroll_button_up.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_button_up.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_down_arrow.png", "skins/windows/vscroll/vscroll_down_arrow.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_down_arrow.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_thumb_gripper_down.png", "skins/windows/vscroll/vscroll_thumb_gripper_down.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_thumb_gripper_down.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_thumb_gripper_over.png", "skins/windows/vscroll/vscroll_thumb_gripper_over.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_thumb_gripper_over.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_thumb_gripper_up.png", "skins/windows/vscroll/vscroll_thumb_gripper_up.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_thumb_gripper_up.png", "image");
			resourceNames.set ("skins/windows/vscroll/vscroll_up_arrow.png", "skins/windows/vscroll/vscroll_up_arrow.png");
			resourceTypes.set ("skins/windows/vscroll/vscroll_up_arrow.png", "image");
			resourceNames.set ("icons/address_book_16.png", "icons/address_book_16.png");
			resourceTypes.set ("icons/address_book_16.png", "image");
			resourceNames.set ("icons/address_book_32.png", "icons/address_book_32.png");
			resourceTypes.set ("icons/address_book_32.png", "image");
			resourceNames.set ("icons/application_16.png", "icons/application_16.png");
			resourceTypes.set ("icons/application_16.png", "image");
			resourceNames.set ("icons/application_24.png", "icons/application_24.png");
			resourceTypes.set ("icons/application_24.png", "image");
			resourceNames.set ("icons/application_32.png", "icons/application_32.png");
			resourceTypes.set ("icons/application_32.png", "image");
			resourceNames.set ("icons/application_48.png", "icons/application_48.png");
			resourceTypes.set ("icons/application_48.png", "image");
			resourceNames.set ("icons/default_16.png", "icons/default_16.png");
			resourceTypes.set ("icons/default_16.png", "image");
			resourceNames.set ("icons/default_32.png", "icons/default_32.png");
			resourceTypes.set ("icons/default_32.png", "image");
			resourceNames.set ("icons/fav_16.png", "icons/fav_16.png");
			resourceTypes.set ("icons/fav_16.png", "image");
			resourceNames.set ("icons/fav_32.png", "icons/fav_32.png");
			resourceTypes.set ("icons/fav_32.png", "image");
			resourceNames.set ("icons/file_blank_16.png", "icons/file_blank_16.png");
			resourceTypes.set ("icons/file_blank_16.png", "image");
			resourceNames.set ("icons/file_blank_32.png", "icons/file_blank_32.png");
			resourceTypes.set ("icons/file_blank_32.png", "image");
			resourceNames.set ("icons/file_gif_16.png", "icons/file_gif_16.png");
			resourceTypes.set ("icons/file_gif_16.png", "image");
			resourceNames.set ("icons/file_gif_32.png", "icons/file_gif_32.png");
			resourceTypes.set ("icons/file_gif_32.png", "image");
			resourceNames.set ("icons/file_text_16.png", "icons/file_text_16.png");
			resourceTypes.set ("icons/file_text_16.png", "image");
			resourceNames.set ("icons/file_text_32.png", "icons/file_text_32.png");
			resourceTypes.set ("icons/file_text_32.png", "image");
			resourceNames.set ("icons/folder_open_16.png", "icons/folder_open_16.png");
			resourceTypes.set ("icons/folder_open_16.png", "image");
			resourceNames.set ("icons/folder_open_32.png", "icons/folder_open_32.png");
			resourceTypes.set ("icons/folder_open_32.png", "image");
			resourceNames.set ("icons/home_16.png", "icons/home_16.png");
			resourceTypes.set ("icons/home_16.png", "image");
			resourceNames.set ("icons/home_32.png", "icons/home_32.png");
			resourceTypes.set ("icons/home_32.png", "image");
			resourceNames.set ("icons/search_16.png", "icons/search_16.png");
			resourceTypes.set ("icons/search_16.png", "image");
			resourceNames.set ("icons/search_32.png", "icons/search_32.png");
			resourceTypes.set ("icons/search_32.png", "image");
			resourceNames.set ("icons/settings_16.png", "icons/settings_16.png");
			resourceTypes.set ("icons/settings_16.png", "image");
			resourceNames.set ("icons/settings_32.png", "icons/settings_32.png");
			resourceTypes.set ("icons/settings_32.png", "image");
			resourceNames.set ("icons/user_16.png", "icons/user_16.png");
			resourceTypes.set ("icons/user_16.png", "image");
			resourceNames.set ("icons/user_32.png", "icons/user_32.png");
			resourceTypes.set ("icons/user_32.png", "image");
			resourceNames.set ("ui/test01.xml", "ui/test01.xml");
			resourceTypes.set ("ui/test01.xml", "text");
			resourceNames.set ("assets/skins/android/audio/TW_Touch.mp3", "assets/skins/android/audio/TW_Touch.mp3");
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.mp3", "sound");
			resourceNames.set ("assets/skins/android/audio/TW_Touch.ogg", "assets/skins/android/audio/TW_Touch.ogg");
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.ogg", "sound");
			resourceNames.set ("assets/skins/android/audio/TW_Touch.wav", "assets/skins/android/audio/TW_Touch.wav");
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.wav", "sound");
			
			
			initialized = true;
			
		}
		
	}
	
	
	public static function getBitmapData (id:String, useCache:Bool = true):BitmapData {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "image") {
			
			if (useCache && cachedBitmapData.exists (id)) {
				
				return cachedBitmapData.get (id);
				
			} else {
				
				var data = BitmapData.load (resourceNames.get (id));
				
				if (useCache) {
					
					cachedBitmapData.set (id, data);
					
				}
				
				return data;
				
			}
			
		}  else if (id.indexOf (":") > -1) {
			
			var libraryName = id.substr (0, id.indexOf (":"));
			var symbolName = id.substr (id.indexOf (":") + 1);
			
			if (libraryTypes.exists (libraryName)) {
				
				#if swf
				
				if (libraryTypes.get (libraryName) == "swf") {
					
					if (!cachedSWFLibraries.exists (libraryName)) {
						
						cachedSWFLibraries.set (libraryName, new SWF (getBytes ("libraries/" + libraryName + ".swf")));
						
					}
					
					return cachedSWFLibraries.get (libraryName).getBitmapData (symbolName);
					
				}
				
				#end
				
				#if xfl
				
				if (libraryTypes.get (libraryName) == "xfl") {
					
					if (!cachedXFLLibraries.exists (libraryName)) {
						
						cachedXFLLibraries.set (libraryName, Unserializer.run (getText ("libraries/" + libraryName + "/" + libraryName + ".dat")));
						
					}
					
					return cachedXFLLibraries.get (libraryName).getBitmapData (symbolName);
					
				}
				
				#end
				
			} else {
				
				trace ("[nme.Assets] There is no asset library named \"" + libraryName + "\"");
				
			}
			
		} else {
			
			trace ("[nme.Assets] There is no BitmapData asset with an ID of \"" + id + "\"");
			
		}
		
		return null;
		
	}
	
	
	public static function getBytes (id:String):ByteArray {
		
		initialize ();
		
		if (resourceNames.exists (id)) {
			
			return ByteArray.readFile (resourceNames.get (id));
			
		} else {
			
			trace ("[nme.Assets] There is no String or ByteArray asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getFont (id:String):Font {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "font") {
			
			return new Font (resourceNames.get (id));
			
		} else {
			
			trace ("[nme.Assets] There is no Font asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getMovieClip (id:String):MovieClip {
		
		initialize ();
		
		var libraryName = id.substr (0, id.indexOf (":"));
		var symbolName = id.substr (id.indexOf (":") + 1);
		
		if (libraryTypes.exists (libraryName)) {
			
			#if swf
			
			if (libraryTypes.get (libraryName) == "swf") {
				
				if (!cachedSWFLibraries.exists (libraryName)) {
					
					cachedSWFLibraries.set (libraryName, new SWF (getBytes ("libraries/" + libraryName + ".swf")));
					
				}
				
				return cachedSWFLibraries.get (libraryName).createMovieClip (symbolName);
				
			}
			
			#end
			
			#if xfl
			
			if (libraryTypes.get (libraryName) == "xfl") {
				
				if (!cachedXFLLibraries.exists (libraryName)) {
					
					cachedXFLLibraries.set (libraryName, Unserializer.run (getText ("libraries/" + libraryName + "/" + libraryName + ".dat")));
					
				}
				
				return cachedXFLLibraries.get (libraryName).createMovieClip (symbolName);
				
			}
			
			#end
			
		} else {
			
			trace ("[nme.Assets] There is no asset library named \"" + libraryName + "\"");
			
		}
		
		return null;
		
	}
	
	
	public static function getResourceName (id:String):String {
		
		initialize ();
		
		return resourceNames.get (id);
		
	}
	
	
	public static function getSound (id:String):Sound {
		
		initialize ();
		
		if (resourceTypes.exists (id)) {
			
			if (resourceTypes.get (id).toLowerCase () == "sound") {
				
				return new Sound (new URLRequest (resourceNames.get (id)), null, false);
				
			} else if (resourceTypes.get (id).toLowerCase () == "music") {
				
				return new Sound (new URLRequest (resourceNames.get (id)), null, true);
				
			}
			
		}
		
		trace ("[nme.Assets] There is no Sound asset with an ID of \"" + id + "\"");
		
		return null;
		
	}
	
	
	public static function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	//public static function loadBitmapData(id:String, handler:BitmapData -> Void, useCache:Bool = true):BitmapData
	//{
		//return null;
	//}
	//
	//
	//public static function loadBytes(id:String, handler:ByteArray -> Void):ByteArray
	//{	
		//return null;
	//}
	//
	//
	//public static function loadText(id:String, handler:String -> Void):String
	//{
		//return null;
	//}
	
	
}
