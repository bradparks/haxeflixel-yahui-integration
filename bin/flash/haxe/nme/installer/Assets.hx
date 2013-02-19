package nme.installer;


import format.display.MovieClip;
import haxe.Unserializer;
import nme.display.BitmapData;
import nme.media.Sound;
import nme.net.URLRequest;
import nme.text.Font;
import nme.utils.ByteArray;
import ApplicationMain;

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
	private static var resourceClasses:Hash <Dynamic> = new Hash <Dynamic> ();
	private static var resourceTypes:Hash <String> = new Hash <String> ();
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			resourceClasses.set ("Beep", NME_assets_data_beep_mp3);
			resourceTypes.set ("Beep", "sound");
			resourceClasses.set ("assets/alt_tiles.png", NME_assets_alt_tiles_png);
			resourceTypes.set ("assets/alt_tiles.png", "image");
			resourceClasses.set ("assets/auto_tiles.png", NME_assets_auto_tiles_png);
			resourceTypes.set ("assets/auto_tiles.png", "image");
			resourceClasses.set ("assets/data/autotiles.png", NME_assets_data_autotiles_png);
			resourceTypes.set ("assets/data/autotiles.png", "image");
			resourceClasses.set ("assets/data/autotiles_alt.png", NME_assets_data_autotiles_alt_png);
			resourceTypes.set ("assets/data/autotiles_alt.png", "image");
			resourceClasses.set ("assets/data/base.png", NME_assets_data_base_png);
			resourceTypes.set ("assets/data/base.png", "image");
			resourceClasses.set ("assets/data/beep.mp3", NME_assets_data_beep_mp4);
			resourceTypes.set ("assets/data/beep.mp3", "music");
			resourceClasses.set ("assets/data/button.png", NME_assets_data_button_png);
			resourceTypes.set ("assets/data/button.png", "image");
			resourceClasses.set ("assets/data/button_a.png", NME_assets_data_button_a_png);
			resourceTypes.set ("assets/data/button_a.png", "image");
			resourceClasses.set ("assets/data/button_b.png", NME_assets_data_button_b_png);
			resourceTypes.set ("assets/data/button_b.png", "image");
			resourceClasses.set ("assets/data/button_c.png", NME_assets_data_button_c_png);
			resourceTypes.set ("assets/data/button_c.png", "image");
			resourceClasses.set ("assets/data/button_down.png", NME_assets_data_button_down_png);
			resourceTypes.set ("assets/data/button_down.png", "image");
			resourceClasses.set ("assets/data/button_left.png", NME_assets_data_button_left_png);
			resourceTypes.set ("assets/data/button_left.png", "image");
			resourceClasses.set ("assets/data/button_right.png", NME_assets_data_button_right_png);
			resourceTypes.set ("assets/data/button_right.png", "image");
			resourceClasses.set ("assets/data/button_up.png", NME_assets_data_button_up_png);
			resourceTypes.set ("assets/data/button_up.png", "image");
			resourceClasses.set ("assets/data/button_x.png", NME_assets_data_button_x_png);
			resourceTypes.set ("assets/data/button_x.png", "image");
			resourceClasses.set ("assets/data/button_y.png", NME_assets_data_button_y_png);
			resourceTypes.set ("assets/data/button_y.png", "image");
			resourceClasses.set ("assets/data/courier.ttf", NME_assets_data_courier_ttf);
			resourceTypes.set ("assets/data/courier.ttf", "font");
			resourceClasses.set ("assets/data/cursor.png", NME_assets_data_cursor_png);
			resourceTypes.set ("assets/data/cursor.png", "image");
			resourceClasses.set ("assets/data/default.png", NME_assets_data_default_png);
			resourceTypes.set ("assets/data/default.png", "image");
			resourceClasses.set ("assets/data/fontData10pt.png", NME_assets_data_fontdata10pt_png);
			resourceTypes.set ("assets/data/fontData10pt.png", "image");
			resourceClasses.set ("assets/data/fontData11pt.png", NME_assets_data_fontdata11pt_png);
			resourceTypes.set ("assets/data/fontData11pt.png", "image");
			resourceClasses.set ("assets/data/handle.png", NME_assets_data_handle_png);
			resourceTypes.set ("assets/data/handle.png", "image");
			resourceClasses.set ("assets/data/logo.png", NME_assets_data_logo_png);
			resourceTypes.set ("assets/data/logo.png", "image");
			resourceClasses.set ("assets/data/logo_corners.png", NME_assets_data_logo_corners_png);
			resourceTypes.set ("assets/data/logo_corners.png", "image");
			resourceClasses.set ("assets/data/logo_light.png", NME_assets_data_logo_light_png);
			resourceTypes.set ("assets/data/logo_light.png", "image");
			resourceClasses.set ("assets/data/nokiafc22.ttf", NME_assets_data_nokiafc22_ttf);
			resourceTypes.set ("assets/data/nokiafc22.ttf", "font");
			resourceClasses.set ("assets/data/stick.png", NME_assets_data_stick_png);
			resourceTypes.set ("assets/data/stick.png", "image");
			resourceClasses.set ("assets/data/vcr/flixel.png", NME_assets_data_vcr_flixel_png);
			resourceTypes.set ("assets/data/vcr/flixel.png", "image");
			resourceClasses.set ("assets/data/vcr/open.png", NME_assets_data_vcr_open_png);
			resourceTypes.set ("assets/data/vcr/open.png", "image");
			resourceClasses.set ("assets/data/vcr/pause.png", NME_assets_data_vcr_pause_png);
			resourceTypes.set ("assets/data/vcr/pause.png", "image");
			resourceClasses.set ("assets/data/vcr/play.png", NME_assets_data_vcr_play_png);
			resourceTypes.set ("assets/data/vcr/play.png", "image");
			resourceClasses.set ("assets/data/vcr/record_off.png", NME_assets_data_vcr_record_off_png);
			resourceTypes.set ("assets/data/vcr/record_off.png", "image");
			resourceClasses.set ("assets/data/vcr/record_on.png", NME_assets_data_vcr_record_on_png);
			resourceTypes.set ("assets/data/vcr/record_on.png", "image");
			resourceClasses.set ("assets/data/vcr/restart.png", NME_assets_data_vcr_restart_png);
			resourceTypes.set ("assets/data/vcr/restart.png", "image");
			resourceClasses.set ("assets/data/vcr/step.png", NME_assets_data_vcr_step_png);
			resourceTypes.set ("assets/data/vcr/step.png", "image");
			resourceClasses.set ("assets/data/vcr/stop.png", NME_assets_data_vcr_stop_png);
			resourceTypes.set ("assets/data/vcr/stop.png", "image");
			resourceClasses.set ("assets/data/vis/bounds.png", NME_assets_data_vis_bounds_png);
			resourceTypes.set ("assets/data/vis/bounds.png", "image");
			resourceClasses.set ("assets/default_alt.txt", NME_assets_default_alt_txt);
			resourceTypes.set ("assets/default_alt.txt", "text");
			resourceClasses.set ("assets/default_auto.txt", NME_assets_default_auto_txt);
			resourceTypes.set ("assets/default_auto.txt", "text");
			resourceClasses.set ("assets/default_empty.txt", NME_assets_default_empty_txt);
			resourceTypes.set ("assets/default_empty.txt", "text");
			resourceClasses.set ("assets/empty_tiles.png", NME_assets_empty_tiles_png);
			resourceTypes.set ("assets/empty_tiles.png", "image");
			resourceClasses.set ("assets/HaxeFlixel.svg", NME_assets_haxeflixel_svg);
			resourceTypes.set ("assets/HaxeFlixel.svg", "text");
			resourceClasses.set ("assets/icons/address_book_16.png", NME_assets_icons_address_book_16_png);
			resourceTypes.set ("assets/icons/address_book_16.png", "image");
			resourceClasses.set ("assets/icons/address_book_32.png", NME_assets_icons_address_book_32_png);
			resourceTypes.set ("assets/icons/address_book_32.png", "image");
			resourceClasses.set ("assets/icons/application_16.png", NME_assets_icons_application_16_png);
			resourceTypes.set ("assets/icons/application_16.png", "image");
			resourceClasses.set ("assets/icons/application_24.png", NME_assets_icons_application_24_png);
			resourceTypes.set ("assets/icons/application_24.png", "image");
			resourceClasses.set ("assets/icons/application_32.png", NME_assets_icons_application_32_png);
			resourceTypes.set ("assets/icons/application_32.png", "image");
			resourceClasses.set ("assets/icons/application_48.png", NME_assets_icons_application_48_png);
			resourceTypes.set ("assets/icons/application_48.png", "image");
			resourceClasses.set ("assets/icons/default_16.png", NME_assets_icons_default_16_png);
			resourceTypes.set ("assets/icons/default_16.png", "image");
			resourceClasses.set ("assets/icons/default_32.png", NME_assets_icons_default_32_png);
			resourceTypes.set ("assets/icons/default_32.png", "image");
			resourceClasses.set ("assets/icons/fav_16.png", NME_assets_icons_fav_16_png);
			resourceTypes.set ("assets/icons/fav_16.png", "image");
			resourceClasses.set ("assets/icons/fav_32.png", NME_assets_icons_fav_32_png);
			resourceTypes.set ("assets/icons/fav_32.png", "image");
			resourceClasses.set ("assets/icons/file_blank_16.png", NME_assets_icons_file_blank_16_png);
			resourceTypes.set ("assets/icons/file_blank_16.png", "image");
			resourceClasses.set ("assets/icons/file_blank_32.png", NME_assets_icons_file_blank_32_png);
			resourceTypes.set ("assets/icons/file_blank_32.png", "image");
			resourceClasses.set ("assets/icons/file_gif_16.png", NME_assets_icons_file_gif_16_png);
			resourceTypes.set ("assets/icons/file_gif_16.png", "image");
			resourceClasses.set ("assets/icons/file_gif_32.png", NME_assets_icons_file_gif_32_png);
			resourceTypes.set ("assets/icons/file_gif_32.png", "image");
			resourceClasses.set ("assets/icons/file_text_16.png", NME_assets_icons_file_text_16_png);
			resourceTypes.set ("assets/icons/file_text_16.png", "image");
			resourceClasses.set ("assets/icons/file_text_32.png", NME_assets_icons_file_text_32_png);
			resourceTypes.set ("assets/icons/file_text_32.png", "image");
			resourceClasses.set ("assets/icons/folder_open_16.png", NME_assets_icons_folder_open_16_png);
			resourceTypes.set ("assets/icons/folder_open_16.png", "image");
			resourceClasses.set ("assets/icons/folder_open_32.png", NME_assets_icons_folder_open_32_png);
			resourceTypes.set ("assets/icons/folder_open_32.png", "image");
			resourceClasses.set ("assets/icons/home_16.png", NME_assets_icons_home_16_png);
			resourceTypes.set ("assets/icons/home_16.png", "image");
			resourceClasses.set ("assets/icons/home_32.png", NME_assets_icons_home_32_png);
			resourceTypes.set ("assets/icons/home_32.png", "image");
			resourceClasses.set ("assets/icons/search_16.png", NME_assets_icons_search_16_png);
			resourceTypes.set ("assets/icons/search_16.png", "image");
			resourceClasses.set ("assets/icons/search_32.png", NME_assets_icons_search_32_png);
			resourceTypes.set ("assets/icons/search_32.png", "image");
			resourceClasses.set ("assets/icons/settings_16.png", NME_assets_icons_settings_16_png);
			resourceTypes.set ("assets/icons/settings_16.png", "image");
			resourceClasses.set ("assets/icons/settings_32.png", NME_assets_icons_settings_32_png);
			resourceTypes.set ("assets/icons/settings_32.png", "image");
			resourceClasses.set ("assets/icons/user_16.png", NME_assets_icons_user_16_png);
			resourceTypes.set ("assets/icons/user_16.png", "image");
			resourceClasses.set ("assets/icons/user_32.png", NME_assets_icons_user_32_png);
			resourceTypes.set ("assets/icons/user_32.png", "image");
			resourceClasses.set ("assets/img/AgentOrange.ttf", NME_assets_img_agentorange_ttf);
			resourceTypes.set ("assets/img/AgentOrange.ttf", "font");
			resourceClasses.set ("assets/img/blank_pixel.png", NME_assets_img_blank_pixel_png);
			resourceTypes.set ("assets/img/blank_pixel.png", "image");
			resourceClasses.set ("assets/img/slinky.jpg", NME_assets_img_slinky_jpg);
			resourceTypes.set ("assets/img/slinky.jpg", "image");
			resourceClasses.set ("assets/img/slinky_large.jpg", NME_assets_img_slinky_large_jpg);
			resourceTypes.set ("assets/img/slinky_large.jpg", "image");
			resourceClasses.set ("assets/img/slinky_small.jpg", NME_assets_img_slinky_small_jpg);
			resourceTypes.set ("assets/img/slinky_small.jpg", "image");
			resourceClasses.set ("assets/img/test_skin.png", NME_assets_img_test_skin_png);
			resourceTypes.set ("assets/img/test_skin.png", "image");
			resourceClasses.set ("assets/nme.svg", NME_assets_nme_svg);
			resourceTypes.set ("assets/nme.svg", "text");
			resourceClasses.set ("assets/skins/android/audio/TW_Touch.mp3", NME_assets_skins_android_audio_tw_touch_mp3);
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.mp3", "music");
			resourceClasses.set ("assets/skins/android/audio/TW_Touch.ogg", NME_assets_skins_android_audio_tw_touch_ogg);
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.ogg", "sound");
			resourceClasses.set ("assets/skins/android/button/button_down.png", NME_assets_skins_android_button_button_down_png);
			resourceTypes.set ("assets/skins/android/button/button_down.png", "image");
			resourceClasses.set ("assets/skins/android/button/button_up.png", NME_assets_skins_android_button_button_up_png);
			resourceTypes.set ("assets/skins/android/button/button_up.png", "image");
			resourceClasses.set ("assets/skins/android/checkbox/checkbox_checked_up.png", NME_assets_skins_android_checkbox_checkbox_checked_up_png);
			resourceTypes.set ("assets/skins/android/checkbox/checkbox_checked_up.png", "image");
			resourceClasses.set ("assets/skins/android/checkbox/checkbox_unchecked_up.png", NME_assets_skins_android_checkbox_checkbox_unchecked_up_png);
			resourceTypes.set ("assets/skins/android/checkbox/checkbox_unchecked_up.png", "image");
			resourceClasses.set ("assets/skins/android/container/container_bg.png", NME_assets_skins_android_container_container_bg_png);
			resourceTypes.set ("assets/skins/android/container/container_bg.png", "image");
			resourceClasses.set ("assets/skins/android/dropdown/dropdown_arrow.png", NME_assets_skins_android_dropdown_dropdown_arrow_png);
			resourceTypes.set ("assets/skins/android/dropdown/dropdown_arrow.png", "image");
			resourceClasses.set ("assets/skins/android/fonts/Roboto-Regular.ttf", NME_assets_skins_android_fonts_roboto_regular_ttf);
			resourceTypes.set ("assets/skins/android/fonts/Roboto-Regular.ttf", "font");
			resourceClasses.set ("assets/skins/android/hscroll/hscroll_thumb_up.png", NME_assets_skins_android_hscroll_hscroll_thumb_up_png);
			resourceTypes.set ("assets/skins/android/hscroll/hscroll_thumb_up.png", "image");
			resourceClasses.set ("assets/skins/android/icons/fav_32.png", NME_assets_skins_android_icons_fav_32_png);
			resourceTypes.set ("assets/skins/android/icons/fav_32.png", "image");
			resourceClasses.set ("assets/skins/android/icons/folder_open_32.png", NME_assets_skins_android_icons_folder_open_32_png);
			resourceTypes.set ("assets/skins/android/icons/folder_open_32.png", "image");
			resourceClasses.set ("assets/skins/android/icons/home_32.png", NME_assets_skins_android_icons_home_32_png);
			resourceTypes.set ("assets/skins/android/icons/home_32.png", "image");
			resourceClasses.set ("assets/skins/android/icons/search_32.png", NME_assets_skins_android_icons_search_32_png);
			resourceTypes.set ("assets/skins/android/icons/search_32.png", "image");
			resourceClasses.set ("assets/skins/android/icons/settings_32.png", NME_assets_skins_android_icons_settings_32_png);
			resourceTypes.set ("assets/skins/android/icons/settings_32.png", "image");
			resourceClasses.set ("assets/skins/android/icons/user_32.png", NME_assets_skins_android_icons_user_32_png);
			resourceTypes.set ("assets/skins/android/icons/user_32.png", "image");
			resourceClasses.set ("assets/skins/android/list/list_item_popup_unselected.png", NME_assets_skins_android_list_list_item_popup_unselected_png);
			resourceTypes.set ("assets/skins/android/list/list_item_popup_unselected.png", "image");
			resourceClasses.set ("assets/skins/android/list/list_item_selected.png", NME_assets_skins_android_list_list_item_selected_png);
			resourceTypes.set ("assets/skins/android/list/list_item_selected.png", "image");
			resourceClasses.set ("assets/skins/android/list/list_item_unselected.png", NME_assets_skins_android_list_list_item_unselected_png);
			resourceTypes.set ("assets/skins/android/list/list_item_unselected.png", "image");
			resourceClasses.set ("assets/skins/android/optionbox/optionbox_selected_up.png", NME_assets_skins_android_optionbox_optionbox_selected_up_png);
			resourceTypes.set ("assets/skins/android/optionbox/optionbox_selected_up.png", "image");
			resourceClasses.set ("assets/skins/android/optionbox/optionbox_unselected_up.png", NME_assets_skins_android_optionbox_optionbox_unselected_up_png);
			resourceTypes.set ("assets/skins/android/optionbox/optionbox_unselected_up.png", "image");
			resourceClasses.set ("assets/skins/android/popup/popup_border.png", NME_assets_skins_android_popup_popup_border_png);
			resourceTypes.set ("assets/skins/android/popup/popup_border.png", "image");
			resourceClasses.set ("assets/skins/android/popup/popup_border_no_title.png", NME_assets_skins_android_popup_popup_border_no_title_png);
			resourceTypes.set ("assets/skins/android/popup/popup_border_no_title.png", "image");
			resourceClasses.set ("assets/skins/android/progress/progress_background.png", NME_assets_skins_android_progress_progress_background_png);
			resourceTypes.set ("assets/skins/android/progress/progress_background.png", "image");
			resourceClasses.set ("assets/skins/android/progress/progress_value.png", NME_assets_skins_android_progress_progress_value_png);
			resourceTypes.set ("assets/skins/android/progress/progress_value.png", "image");
			resourceClasses.set ("assets/skins/android/ratings/nostar.png", NME_assets_skins_android_ratings_nostar_png);
			resourceTypes.set ("assets/skins/android/ratings/nostar.png", "image");
			resourceClasses.set ("assets/skins/android/ratings/star.png", NME_assets_skins_android_ratings_star_png);
			resourceTypes.set ("assets/skins/android/ratings/star.png", "image");
			resourceClasses.set ("assets/skins/android/tabbar/tabbar_bg.png", NME_assets_skins_android_tabbar_tabbar_bg_png);
			resourceTypes.set ("assets/skins/android/tabbar/tabbar_bg.png", "image");
			resourceClasses.set ("assets/skins/android/tabs/tab_selected_bg.png", NME_assets_skins_android_tabs_tab_selected_bg_png);
			resourceTypes.set ("assets/skins/android/tabs/tab_selected_bg.png", "image");
			resourceClasses.set ("assets/skins/android/tabs/tab_unselected_bg.png", NME_assets_skins_android_tabs_tab_unselected_bg_png);
			resourceTypes.set ("assets/skins/android/tabs/tab_unselected_bg.png", "image");
			resourceClasses.set ("assets/skins/android/textinput/textinput_normal.png", NME_assets_skins_android_textinput_textinput_normal_png);
			resourceTypes.set ("assets/skins/android/textinput/textinput_normal.png", "image");
			resourceClasses.set ("assets/skins/android/vscroll/vscroll_thumb_up.png", NME_assets_skins_android_vscroll_vscroll_thumb_up_png);
			resourceTypes.set ("assets/skins/android/vscroll/vscroll_thumb_up.png", "image");
			resourceClasses.set ("assets/skins/windows/button/button_down.png", NME_assets_skins_windows_button_button_down_png);
			resourceTypes.set ("assets/skins/windows/button/button_down.png", "image");
			resourceClasses.set ("assets/skins/windows/button/button_over.png", NME_assets_skins_windows_button_button_over_png);
			resourceTypes.set ("assets/skins/windows/button/button_over.png", "image");
			resourceClasses.set ("assets/skins/windows/button/button_up.png", NME_assets_skins_windows_button_button_up_png);
			resourceTypes.set ("assets/skins/windows/button/button_up.png", "image");
			resourceClasses.set ("assets/skins/windows/checkbox/checkbox_checked_over.png", NME_assets_skins_windows_checkbox_checkbox_checked_over_png);
			resourceTypes.set ("assets/skins/windows/checkbox/checkbox_checked_over.png", "image");
			resourceClasses.set ("assets/skins/windows/checkbox/checkbox_checked_up.png", NME_assets_skins_windows_checkbox_checkbox_checked_up_png);
			resourceTypes.set ("assets/skins/windows/checkbox/checkbox_checked_up.png", "image");
			resourceClasses.set ("assets/skins/windows/checkbox/checkbox_unchecked_over.png", NME_assets_skins_windows_checkbox_checkbox_unchecked_over_png);
			resourceTypes.set ("assets/skins/windows/checkbox/checkbox_unchecked_over.png", "image");
			resourceClasses.set ("assets/skins/windows/checkbox/checkbox_unchecked_up.png", NME_assets_skins_windows_checkbox_checkbox_unchecked_up_png);
			resourceTypes.set ("assets/skins/windows/checkbox/checkbox_unchecked_up.png", "image");
			resourceClasses.set ("assets/skins/windows/container/container_bg.png", NME_assets_skins_windows_container_container_bg_png);
			resourceTypes.set ("assets/skins/windows/container/container_bg.png", "image");
			resourceClasses.set ("assets/skins/windows/fonts/segoeui.ttf", NME_assets_skins_windows_fonts_segoeui_ttf);
			resourceTypes.set ("assets/skins/windows/fonts/segoeui.ttf", "font");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_bg.png", NME_assets_skins_windows_hscroll_hscroll_bg_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_bg.png", "image");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_button_down.png", NME_assets_skins_windows_hscroll_hscroll_button_down_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_button_down.png", "image");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_button_over.png", NME_assets_skins_windows_hscroll_hscroll_button_over_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_button_over.png", "image");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_button_up.png", NME_assets_skins_windows_hscroll_hscroll_button_up_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_button_up.png", "image");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_left_arrow.png", NME_assets_skins_windows_hscroll_hscroll_left_arrow_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_left_arrow.png", "image");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_right_arrow.png", NME_assets_skins_windows_hscroll_hscroll_right_arrow_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_right_arrow.png", "image");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png", NME_assets_skins_windows_hscroll_hscroll_thumb_gripper_down_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_down.png", "image");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png", NME_assets_skins_windows_hscroll_hscroll_thumb_gripper_over_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_over.png", "image");
			resourceClasses.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png", NME_assets_skins_windows_hscroll_hscroll_thumb_gripper_up_png);
			resourceTypes.set ("assets/skins/windows/hscroll/hscroll_thumb_gripper_up.png", "image");
			resourceClasses.set ("assets/skins/windows/listview/listview_item_over.png", NME_assets_skins_windows_listview_listview_item_over_png);
			resourceTypes.set ("assets/skins/windows/listview/listview_item_over.png", "image");
			resourceClasses.set ("assets/skins/windows/listview/listview_item_selected.png", NME_assets_skins_windows_listview_listview_item_selected_png);
			resourceTypes.set ("assets/skins/windows/listview/listview_item_selected.png", "image");
			resourceClasses.set ("assets/skins/windows/listview/listview_item_unselected.png", NME_assets_skins_windows_listview_listview_item_unselected_png);
			resourceTypes.set ("assets/skins/windows/listview/listview_item_unselected.png", "image");
			resourceClasses.set ("assets/skins/windows/optionbox/optionbox_selected_over.png", NME_assets_skins_windows_optionbox_optionbox_selected_over_png);
			resourceTypes.set ("assets/skins/windows/optionbox/optionbox_selected_over.png", "image");
			resourceClasses.set ("assets/skins/windows/optionbox/optionbox_selected_up.png", NME_assets_skins_windows_optionbox_optionbox_selected_up_png);
			resourceTypes.set ("assets/skins/windows/optionbox/optionbox_selected_up.png", "image");
			resourceClasses.set ("assets/skins/windows/optionbox/optionbox_unselected_over.png", NME_assets_skins_windows_optionbox_optionbox_unselected_over_png);
			resourceTypes.set ("assets/skins/windows/optionbox/optionbox_unselected_over.png", "image");
			resourceClasses.set ("assets/skins/windows/optionbox/optionbox_unselected_up.png", NME_assets_skins_windows_optionbox_optionbox_unselected_up_png);
			resourceTypes.set ("assets/skins/windows/optionbox/optionbox_unselected_up.png", "image");
			resourceClasses.set ("assets/skins/windows/popup/popup_border.png", NME_assets_skins_windows_popup_popup_border_png);
			resourceTypes.set ("assets/skins/windows/popup/popup_border.png", "image");
			resourceClasses.set ("assets/skins/windows/progress/progress_background.png", NME_assets_skins_windows_progress_progress_background_png);
			resourceTypes.set ("assets/skins/windows/progress/progress_background.png", "image");
			resourceClasses.set ("assets/skins/windows/progress/progress_value.png", NME_assets_skins_windows_progress_progress_value_png);
			resourceTypes.set ("assets/skins/windows/progress/progress_value.png", "image");
			resourceClasses.set ("assets/skins/windows/ratings/star-empty.png", NME_assets_skins_windows_ratings_star_empty_png);
			resourceTypes.set ("assets/skins/windows/ratings/star-empty.png", "image");
			resourceClasses.set ("assets/skins/windows/ratings/star.png", NME_assets_skins_windows_ratings_star_png);
			resourceTypes.set ("assets/skins/windows/ratings/star.png", "image");
			resourceClasses.set ("assets/skins/windows/tabbar/tabbar_bg.png", NME_assets_skins_windows_tabbar_tabbar_bg_png);
			resourceTypes.set ("assets/skins/windows/tabbar/tabbar_bg.png", "image");
			resourceClasses.set ("assets/skins/windows/tabs/tab_selected_up.png", NME_assets_skins_windows_tabs_tab_selected_up_png);
			resourceTypes.set ("assets/skins/windows/tabs/tab_selected_up.png", "image");
			resourceClasses.set ("assets/skins/windows/tabs/tab_unselected_over.png", NME_assets_skins_windows_tabs_tab_unselected_over_png);
			resourceTypes.set ("assets/skins/windows/tabs/tab_unselected_over.png", "image");
			resourceClasses.set ("assets/skins/windows/tabs/tab_unselected_up.png", NME_assets_skins_windows_tabs_tab_unselected_up_png);
			resourceTypes.set ("assets/skins/windows/tabs/tab_unselected_up.png", "image");
			resourceClasses.set ("assets/skins/windows/textinput/textinput_normal.png", NME_assets_skins_windows_textinput_textinput_normal_png);
			resourceTypes.set ("assets/skins/windows/textinput/textinput_normal.png", "image");
			resourceClasses.set ("assets/skins/windows/textinput/textinput_over.png", NME_assets_skins_windows_textinput_textinput_over_png);
			resourceTypes.set ("assets/skins/windows/textinput/textinput_over.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_bg.png", NME_assets_skins_windows_vscroll_vscroll_bg_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_bg.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_button_down.png", NME_assets_skins_windows_vscroll_vscroll_button_down_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_button_down.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_button_over.png", NME_assets_skins_windows_vscroll_vscroll_button_over_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_button_over.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_button_up.png", NME_assets_skins_windows_vscroll_vscroll_button_up_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_button_up.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_down_arrow.png", NME_assets_skins_windows_vscroll_vscroll_down_arrow_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_down_arrow.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png", NME_assets_skins_windows_vscroll_vscroll_thumb_gripper_down_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_down.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png", NME_assets_skins_windows_vscroll_vscroll_thumb_gripper_over_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_over.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png", NME_assets_skins_windows_vscroll_vscroll_thumb_gripper_up_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_thumb_gripper_up.png", "image");
			resourceClasses.set ("assets/skins/windows/vscroll/vscroll_up_arrow.png", NME_assets_skins_windows_vscroll_vscroll_up_arrow_png);
			resourceTypes.set ("assets/skins/windows/vscroll/vscroll_up_arrow.png", "image");
			resourceClasses.set ("assets/spaceman.png", NME_assets_spaceman_png);
			resourceTypes.set ("assets/spaceman.png", "image");
			resourceClasses.set ("assets/ui/test01.xml", NME_assets_ui_test01_xml);
			resourceTypes.set ("assets/ui/test01.xml", "text");
			resourceClasses.set ("img/AgentOrange.ttf", NME_img_agentorange_ttf);
			resourceTypes.set ("img/AgentOrange.ttf", "font");
			resourceClasses.set ("img/blank_pixel.png", NME_img_blank_pixel_png);
			resourceTypes.set ("img/blank_pixel.png", "image");
			resourceClasses.set ("img/slinky.jpg", NME_img_slinky_jpg);
			resourceTypes.set ("img/slinky.jpg", "image");
			resourceClasses.set ("img/slinky_large.jpg", NME_img_slinky_large_jpg);
			resourceTypes.set ("img/slinky_large.jpg", "image");
			resourceClasses.set ("img/slinky_small.jpg", NME_img_slinky_small_jpg);
			resourceTypes.set ("img/slinky_small.jpg", "image");
			resourceClasses.set ("img/test_skin.png", NME_img_test_skin_png);
			resourceTypes.set ("img/test_skin.png", "image");
			resourceClasses.set ("skins/android/audio/TW_Touch.mp3", NME_skins_android_audio_tw_touch_mp3);
			resourceTypes.set ("skins/android/audio/TW_Touch.mp3", "music");
			resourceClasses.set ("skins/android/audio/TW_Touch.ogg", NME_skins_android_audio_tw_touch_ogg);
			resourceTypes.set ("skins/android/audio/TW_Touch.ogg", "sound");
			resourceClasses.set ("skins/android/audio/TW_Touch.wav", NME_skins_android_audio_tw_touch_wav);
			resourceTypes.set ("skins/android/audio/TW_Touch.wav", "sound");
			resourceClasses.set ("skins/android/button/button_down.png", NME_skins_android_button_button_down_png);
			resourceTypes.set ("skins/android/button/button_down.png", "image");
			resourceClasses.set ("skins/android/button/button_up.png", NME_skins_android_button_button_up_png);
			resourceTypes.set ("skins/android/button/button_up.png", "image");
			resourceClasses.set ("skins/android/checkbox/checkbox_checked_up.png", NME_skins_android_checkbox_checkbox_checked_up_png);
			resourceTypes.set ("skins/android/checkbox/checkbox_checked_up.png", "image");
			resourceClasses.set ("skins/android/checkbox/checkbox_unchecked_up.png", NME_skins_android_checkbox_checkbox_unchecked_up_png);
			resourceTypes.set ("skins/android/checkbox/checkbox_unchecked_up.png", "image");
			resourceClasses.set ("skins/android/container/container_bg.png", NME_skins_android_container_container_bg_png);
			resourceTypes.set ("skins/android/container/container_bg.png", "image");
			resourceClasses.set ("skins/android/dropdown/dropdown_arrow.png", NME_skins_android_dropdown_dropdown_arrow_png);
			resourceTypes.set ("skins/android/dropdown/dropdown_arrow.png", "image");
			resourceClasses.set ("skins/android/fonts/Roboto-Regular.ttf", NME_skins_android_fonts_roboto_regular_ttf);
			resourceTypes.set ("skins/android/fonts/Roboto-Regular.ttf", "font");
			resourceClasses.set ("skins/android/hscroll/hscroll_thumb_up.png", NME_skins_android_hscroll_hscroll_thumb_up_png);
			resourceTypes.set ("skins/android/hscroll/hscroll_thumb_up.png", "image");
			resourceClasses.set ("skins/android/icons/fav_32.png", NME_skins_android_icons_fav_32_png);
			resourceTypes.set ("skins/android/icons/fav_32.png", "image");
			resourceClasses.set ("skins/android/icons/folder_open_32.png", NME_skins_android_icons_folder_open_32_png);
			resourceTypes.set ("skins/android/icons/folder_open_32.png", "image");
			resourceClasses.set ("skins/android/icons/home_32.png", NME_skins_android_icons_home_32_png);
			resourceTypes.set ("skins/android/icons/home_32.png", "image");
			resourceClasses.set ("skins/android/icons/search_32.png", NME_skins_android_icons_search_32_png);
			resourceTypes.set ("skins/android/icons/search_32.png", "image");
			resourceClasses.set ("skins/android/icons/settings_32.png", NME_skins_android_icons_settings_32_png);
			resourceTypes.set ("skins/android/icons/settings_32.png", "image");
			resourceClasses.set ("skins/android/icons/user_32.png", NME_skins_android_icons_user_32_png);
			resourceTypes.set ("skins/android/icons/user_32.png", "image");
			resourceClasses.set ("skins/android/list/list_item_popup_unselected.png", NME_skins_android_list_list_item_popup_unselected_png);
			resourceTypes.set ("skins/android/list/list_item_popup_unselected.png", "image");
			resourceClasses.set ("skins/android/list/list_item_selected.png", NME_skins_android_list_list_item_selected_png);
			resourceTypes.set ("skins/android/list/list_item_selected.png", "image");
			resourceClasses.set ("skins/android/list/list_item_unselected.png", NME_skins_android_list_list_item_unselected_png);
			resourceTypes.set ("skins/android/list/list_item_unselected.png", "image");
			resourceClasses.set ("skins/android/optionbox/optionbox_selected_up.png", NME_skins_android_optionbox_optionbox_selected_up_png);
			resourceTypes.set ("skins/android/optionbox/optionbox_selected_up.png", "image");
			resourceClasses.set ("skins/android/optionbox/optionbox_unselected_up.png", NME_skins_android_optionbox_optionbox_unselected_up_png);
			resourceTypes.set ("skins/android/optionbox/optionbox_unselected_up.png", "image");
			resourceClasses.set ("skins/android/popup/popup_border.png", NME_skins_android_popup_popup_border_png);
			resourceTypes.set ("skins/android/popup/popup_border.png", "image");
			resourceClasses.set ("skins/android/popup/popup_border_no_title.png", NME_skins_android_popup_popup_border_no_title_png);
			resourceTypes.set ("skins/android/popup/popup_border_no_title.png", "image");
			resourceClasses.set ("skins/android/progress/progress_background.png", NME_skins_android_progress_progress_background_png);
			resourceTypes.set ("skins/android/progress/progress_background.png", "image");
			resourceClasses.set ("skins/android/progress/progress_value.png", NME_skins_android_progress_progress_value_png);
			resourceTypes.set ("skins/android/progress/progress_value.png", "image");
			resourceClasses.set ("skins/android/ratings/nostar.png", NME_skins_android_ratings_nostar_png);
			resourceTypes.set ("skins/android/ratings/nostar.png", "image");
			resourceClasses.set ("skins/android/ratings/star.png", NME_skins_android_ratings_star_png);
			resourceTypes.set ("skins/android/ratings/star.png", "image");
			resourceClasses.set ("skins/android/tabbar/tabbar_bg.png", NME_skins_android_tabbar_tabbar_bg_png);
			resourceTypes.set ("skins/android/tabbar/tabbar_bg.png", "image");
			resourceClasses.set ("skins/android/tabs/tab_selected_bg.png", NME_skins_android_tabs_tab_selected_bg_png);
			resourceTypes.set ("skins/android/tabs/tab_selected_bg.png", "image");
			resourceClasses.set ("skins/android/tabs/tab_unselected_bg.png", NME_skins_android_tabs_tab_unselected_bg_png);
			resourceTypes.set ("skins/android/tabs/tab_unselected_bg.png", "image");
			resourceClasses.set ("skins/android/textinput/textinput_normal.png", NME_skins_android_textinput_textinput_normal_png);
			resourceTypes.set ("skins/android/textinput/textinput_normal.png", "image");
			resourceClasses.set ("skins/android/vscroll/vscroll_thumb_up.png", NME_skins_android_vscroll_vscroll_thumb_up_png);
			resourceTypes.set ("skins/android/vscroll/vscroll_thumb_up.png", "image");
			resourceClasses.set ("skins/windows/button/button_down.png", NME_skins_windows_button_button_down_png);
			resourceTypes.set ("skins/windows/button/button_down.png", "image");
			resourceClasses.set ("skins/windows/button/button_over.png", NME_skins_windows_button_button_over_png);
			resourceTypes.set ("skins/windows/button/button_over.png", "image");
			resourceClasses.set ("skins/windows/button/button_up.png", NME_skins_windows_button_button_up_png);
			resourceTypes.set ("skins/windows/button/button_up.png", "image");
			resourceClasses.set ("skins/windows/checkbox/checkbox_checked_over.png", NME_skins_windows_checkbox_checkbox_checked_over_png);
			resourceTypes.set ("skins/windows/checkbox/checkbox_checked_over.png", "image");
			resourceClasses.set ("skins/windows/checkbox/checkbox_checked_up.png", NME_skins_windows_checkbox_checkbox_checked_up_png);
			resourceTypes.set ("skins/windows/checkbox/checkbox_checked_up.png", "image");
			resourceClasses.set ("skins/windows/checkbox/checkbox_unchecked_over.png", NME_skins_windows_checkbox_checkbox_unchecked_over_png);
			resourceTypes.set ("skins/windows/checkbox/checkbox_unchecked_over.png", "image");
			resourceClasses.set ("skins/windows/checkbox/checkbox_unchecked_up.png", NME_skins_windows_checkbox_checkbox_unchecked_up_png);
			resourceTypes.set ("skins/windows/checkbox/checkbox_unchecked_up.png", "image");
			resourceClasses.set ("skins/windows/container/container_bg.png", NME_skins_windows_container_container_bg_png);
			resourceTypes.set ("skins/windows/container/container_bg.png", "image");
			resourceClasses.set ("skins/windows/fonts/segoeui.ttf", NME_skins_windows_fonts_segoeui_ttf);
			resourceTypes.set ("skins/windows/fonts/segoeui.ttf", "font");
			resourceClasses.set ("skins/windows/hscroll/hscroll_bg.png", NME_skins_windows_hscroll_hscroll_bg_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_bg.png", "image");
			resourceClasses.set ("skins/windows/hscroll/hscroll_button_down.png", NME_skins_windows_hscroll_hscroll_button_down_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_button_down.png", "image");
			resourceClasses.set ("skins/windows/hscroll/hscroll_button_over.png", NME_skins_windows_hscroll_hscroll_button_over_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_button_over.png", "image");
			resourceClasses.set ("skins/windows/hscroll/hscroll_button_up.png", NME_skins_windows_hscroll_hscroll_button_up_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_button_up.png", "image");
			resourceClasses.set ("skins/windows/hscroll/hscroll_left_arrow.png", NME_skins_windows_hscroll_hscroll_left_arrow_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_left_arrow.png", "image");
			resourceClasses.set ("skins/windows/hscroll/hscroll_right_arrow.png", NME_skins_windows_hscroll_hscroll_right_arrow_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_right_arrow.png", "image");
			resourceClasses.set ("skins/windows/hscroll/hscroll_thumb_gripper_down.png", NME_skins_windows_hscroll_hscroll_thumb_gripper_down_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_thumb_gripper_down.png", "image");
			resourceClasses.set ("skins/windows/hscroll/hscroll_thumb_gripper_over.png", NME_skins_windows_hscroll_hscroll_thumb_gripper_over_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_thumb_gripper_over.png", "image");
			resourceClasses.set ("skins/windows/hscroll/hscroll_thumb_gripper_up.png", NME_skins_windows_hscroll_hscroll_thumb_gripper_up_png);
			resourceTypes.set ("skins/windows/hscroll/hscroll_thumb_gripper_up.png", "image");
			resourceClasses.set ("skins/windows/listview/listview_item_over.png", NME_skins_windows_listview_listview_item_over_png);
			resourceTypes.set ("skins/windows/listview/listview_item_over.png", "image");
			resourceClasses.set ("skins/windows/listview/listview_item_selected.png", NME_skins_windows_listview_listview_item_selected_png);
			resourceTypes.set ("skins/windows/listview/listview_item_selected.png", "image");
			resourceClasses.set ("skins/windows/listview/listview_item_unselected.png", NME_skins_windows_listview_listview_item_unselected_png);
			resourceTypes.set ("skins/windows/listview/listview_item_unselected.png", "image");
			resourceClasses.set ("skins/windows/optionbox/optionbox_selected_over.png", NME_skins_windows_optionbox_optionbox_selected_over_png);
			resourceTypes.set ("skins/windows/optionbox/optionbox_selected_over.png", "image");
			resourceClasses.set ("skins/windows/optionbox/optionbox_selected_up.png", NME_skins_windows_optionbox_optionbox_selected_up_png);
			resourceTypes.set ("skins/windows/optionbox/optionbox_selected_up.png", "image");
			resourceClasses.set ("skins/windows/optionbox/optionbox_unselected_over.png", NME_skins_windows_optionbox_optionbox_unselected_over_png);
			resourceTypes.set ("skins/windows/optionbox/optionbox_unselected_over.png", "image");
			resourceClasses.set ("skins/windows/optionbox/optionbox_unselected_up.png", NME_skins_windows_optionbox_optionbox_unselected_up_png);
			resourceTypes.set ("skins/windows/optionbox/optionbox_unselected_up.png", "image");
			resourceClasses.set ("skins/windows/popup/popup_border.png", NME_skins_windows_popup_popup_border_png);
			resourceTypes.set ("skins/windows/popup/popup_border.png", "image");
			resourceClasses.set ("skins/windows/progress/progress_background.png", NME_skins_windows_progress_progress_background_png);
			resourceTypes.set ("skins/windows/progress/progress_background.png", "image");
			resourceClasses.set ("skins/windows/progress/progress_value.png", NME_skins_windows_progress_progress_value_png);
			resourceTypes.set ("skins/windows/progress/progress_value.png", "image");
			resourceClasses.set ("skins/windows/ratings/star-empty.png", NME_skins_windows_ratings_star_empty_png);
			resourceTypes.set ("skins/windows/ratings/star-empty.png", "image");
			resourceClasses.set ("skins/windows/ratings/star.png", NME_skins_windows_ratings_star_png);
			resourceTypes.set ("skins/windows/ratings/star.png", "image");
			resourceClasses.set ("skins/windows/tabbar/tabbar_bg.png", NME_skins_windows_tabbar_tabbar_bg_png);
			resourceTypes.set ("skins/windows/tabbar/tabbar_bg.png", "image");
			resourceClasses.set ("skins/windows/tabs/tab_selected_up.png", NME_skins_windows_tabs_tab_selected_up_png);
			resourceTypes.set ("skins/windows/tabs/tab_selected_up.png", "image");
			resourceClasses.set ("skins/windows/tabs/tab_unselected_over.png", NME_skins_windows_tabs_tab_unselected_over_png);
			resourceTypes.set ("skins/windows/tabs/tab_unselected_over.png", "image");
			resourceClasses.set ("skins/windows/tabs/tab_unselected_up.png", NME_skins_windows_tabs_tab_unselected_up_png);
			resourceTypes.set ("skins/windows/tabs/tab_unselected_up.png", "image");
			resourceClasses.set ("skins/windows/textinput/textinput_normal.png", NME_skins_windows_textinput_textinput_normal_png);
			resourceTypes.set ("skins/windows/textinput/textinput_normal.png", "image");
			resourceClasses.set ("skins/windows/textinput/textinput_over.png", NME_skins_windows_textinput_textinput_over_png);
			resourceTypes.set ("skins/windows/textinput/textinput_over.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_bg.png", NME_skins_windows_vscroll_vscroll_bg_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_bg.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_button_down.png", NME_skins_windows_vscroll_vscroll_button_down_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_button_down.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_button_over.png", NME_skins_windows_vscroll_vscroll_button_over_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_button_over.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_button_up.png", NME_skins_windows_vscroll_vscroll_button_up_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_button_up.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_down_arrow.png", NME_skins_windows_vscroll_vscroll_down_arrow_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_down_arrow.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_thumb_gripper_down.png", NME_skins_windows_vscroll_vscroll_thumb_gripper_down_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_thumb_gripper_down.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_thumb_gripper_over.png", NME_skins_windows_vscroll_vscroll_thumb_gripper_over_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_thumb_gripper_over.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_thumb_gripper_up.png", NME_skins_windows_vscroll_vscroll_thumb_gripper_up_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_thumb_gripper_up.png", "image");
			resourceClasses.set ("skins/windows/vscroll/vscroll_up_arrow.png", NME_skins_windows_vscroll_vscroll_up_arrow_png);
			resourceTypes.set ("skins/windows/vscroll/vscroll_up_arrow.png", "image");
			resourceClasses.set ("icons/address_book_16.png", NME_icons_address_book_16_png);
			resourceTypes.set ("icons/address_book_16.png", "image");
			resourceClasses.set ("icons/address_book_32.png", NME_icons_address_book_32_png);
			resourceTypes.set ("icons/address_book_32.png", "image");
			resourceClasses.set ("icons/application_16.png", NME_icons_application_16_png);
			resourceTypes.set ("icons/application_16.png", "image");
			resourceClasses.set ("icons/application_24.png", NME_icons_application_24_png);
			resourceTypes.set ("icons/application_24.png", "image");
			resourceClasses.set ("icons/application_32.png", NME_icons_application_32_png);
			resourceTypes.set ("icons/application_32.png", "image");
			resourceClasses.set ("icons/application_48.png", NME_icons_application_48_png);
			resourceTypes.set ("icons/application_48.png", "image");
			resourceClasses.set ("icons/default_16.png", NME_icons_default_16_png);
			resourceTypes.set ("icons/default_16.png", "image");
			resourceClasses.set ("icons/default_32.png", NME_icons_default_32_png);
			resourceTypes.set ("icons/default_32.png", "image");
			resourceClasses.set ("icons/fav_16.png", NME_icons_fav_16_png);
			resourceTypes.set ("icons/fav_16.png", "image");
			resourceClasses.set ("icons/fav_32.png", NME_icons_fav_32_png);
			resourceTypes.set ("icons/fav_32.png", "image");
			resourceClasses.set ("icons/file_blank_16.png", NME_icons_file_blank_16_png);
			resourceTypes.set ("icons/file_blank_16.png", "image");
			resourceClasses.set ("icons/file_blank_32.png", NME_icons_file_blank_32_png);
			resourceTypes.set ("icons/file_blank_32.png", "image");
			resourceClasses.set ("icons/file_gif_16.png", NME_icons_file_gif_16_png);
			resourceTypes.set ("icons/file_gif_16.png", "image");
			resourceClasses.set ("icons/file_gif_32.png", NME_icons_file_gif_32_png);
			resourceTypes.set ("icons/file_gif_32.png", "image");
			resourceClasses.set ("icons/file_text_16.png", NME_icons_file_text_16_png);
			resourceTypes.set ("icons/file_text_16.png", "image");
			resourceClasses.set ("icons/file_text_32.png", NME_icons_file_text_32_png);
			resourceTypes.set ("icons/file_text_32.png", "image");
			resourceClasses.set ("icons/folder_open_16.png", NME_icons_folder_open_16_png);
			resourceTypes.set ("icons/folder_open_16.png", "image");
			resourceClasses.set ("icons/folder_open_32.png", NME_icons_folder_open_32_png);
			resourceTypes.set ("icons/folder_open_32.png", "image");
			resourceClasses.set ("icons/home_16.png", NME_icons_home_16_png);
			resourceTypes.set ("icons/home_16.png", "image");
			resourceClasses.set ("icons/home_32.png", NME_icons_home_32_png);
			resourceTypes.set ("icons/home_32.png", "image");
			resourceClasses.set ("icons/search_16.png", NME_icons_search_16_png);
			resourceTypes.set ("icons/search_16.png", "image");
			resourceClasses.set ("icons/search_32.png", NME_icons_search_32_png);
			resourceTypes.set ("icons/search_32.png", "image");
			resourceClasses.set ("icons/settings_16.png", NME_icons_settings_16_png);
			resourceTypes.set ("icons/settings_16.png", "image");
			resourceClasses.set ("icons/settings_32.png", NME_icons_settings_32_png);
			resourceTypes.set ("icons/settings_32.png", "image");
			resourceClasses.set ("icons/user_16.png", NME_icons_user_16_png);
			resourceTypes.set ("icons/user_16.png", "image");
			resourceClasses.set ("icons/user_32.png", NME_icons_user_32_png);
			resourceTypes.set ("icons/user_32.png", "image");
			resourceClasses.set ("ui/test01.xml", NME_ui_test01_xml);
			resourceTypes.set ("ui/test01.xml", "text");
			resourceClasses.set ("assets/skins/android/audio/TW_Touch.mp3", NME_assets_skins_android_audio_tw_touch_mp4);
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.mp3", "sound");
			resourceClasses.set ("assets/skins/android/audio/TW_Touch.ogg", NME_assets_skins_android_audio_tw_touch_ogg1);
			resourceTypes.set ("assets/skins/android/audio/TW_Touch.ogg", "sound");
			resourceClasses.set ("assets/skins/android/audio/TW_Touch.wav", NME_assets_skins_android_audio_tw_touch_wav);
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
				
				var data = cast (Type.createInstance (resourceClasses.get (id), []), BitmapData);
				
				if (useCache) {
					
					cachedBitmapData.set (id, data);
					
				}
				
				return data;
				
			}
			
		} else if (id.indexOf (":") > -1) {
			
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
		
		if (resourceClasses.exists (id)) {
			
			return Type.createInstance (resourceClasses.get (id), []);
			
		} else {
			
			trace ("[nme.Assets] There is no ByteArray asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getFont (id:String):Font {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "font") {
			
			return cast (Type.createInstance (resourceClasses.get (id), []), Font);
			
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
	
	
	public static function getSound (id:String):Sound {
		
		initialize ();
		
		if (resourceTypes.exists (id)) {
			
			if (resourceTypes.get (id).toLowerCase () == "sound" || resourceTypes.get (id).toLowerCase () == "music") {
				
				return cast (Type.createInstance (resourceClasses.get (id), []), Sound);
				
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