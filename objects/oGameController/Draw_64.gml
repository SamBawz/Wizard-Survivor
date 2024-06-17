/// @description Hotbar, experience and health bars

if(instance_exists(oLevelUpScreen)) {
	exit;
} 

draw_set_alpha(1);

if(announcement) {
	draw_set_font(fLarge);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 7, message_string, 0.9, 0.9, 0);
}

//Exp
draw_healthbar(global.hotbar_vec.x - 40, global.hotbar_vec.y - 19, global.hotbar_vec.x + 40, global.hotbar_vec.y - 18, global.current_xp, c_gray, c_aqua, c_aqua, 0, true, false);

//Draw the hotbar
draw_sprite( sHotbar, 0, global.hotbar_vec.x, global.hotbar_vec.y);
hotbar_index = 0;
array_foreach(global.obtained_elements, function(_element, _i) {
	obtained_element = _element;
	array_foreach(global.elements, function(_element) {
		if(obtained_element = _element.id) {
			if(obtained_element != 0) {
				draw_sprite(asset_get_index(_element.button), 0, hotbar_icon_vec[hotbar_index].x, hotbar_icon_vec[hotbar_index].y);
			}
			hotbar_index++;
		}
	});
});

//Health
draw_set_font(fMedium);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_text_transformed(global.hotbar_vec.x - 45, global.hotbar_vec.y - 25, "Lv " + string(global.level), 0.5, 0.5, 0);
draw_healthbar(global.hotbar_vec.x - 40, global.hotbar_vec.y - 25, global.hotbar_vec.x + 40, global.hotbar_vec.y - 21, global.player_health, c_gray, c_red, c_red, 0, true, false);
