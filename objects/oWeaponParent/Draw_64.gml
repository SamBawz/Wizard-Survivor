/// @description Draw the hotbar
/*
draw_set_alpha(1);
draw_sprite( sHotbar, 0, 0, display_get_gui_height());
draw_set_alpha(0.2);
var _fire = draw_sprite( sHeatButton, 0, 2, display_get_gui_height()-22);

draw_set_alpha(1);
*/

//Draw the hotbar
draw_sprite( sHotbar, 0, hotbar_vec.x, hotbar_vec.y);
hotbar_index = 0;
array_foreach(obtained_elements, function(_element, _i) {
	obtained_element = _element;
	array_foreach(global.elements, function(_element) {
		if(obtained_element = _element.id) {
			draw_sprite(asset_get_index(_element.button), 0, hotbar_icon_vec[hotbar_index].x, hotbar_icon_vec[hotbar_index].y)
			hotbar_index++;
		}
	});
});

