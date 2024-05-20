/// @description Hotbar, experience and health bars

if(instance_exists(oLevelUpScreen)) {
	exit;
} 

draw_set_alpha(1);

draw_healthbar(10, display_get_gui_height() - 10, display_get_gui_width() - 10, display_get_gui_height() -5, global.current_xp, c_gray, c_gray, c_blue, 0, false, false);

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