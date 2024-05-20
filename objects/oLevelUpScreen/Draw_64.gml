draw_set_alpha(1);

//Backdrop
draw_sprite(sLevelUpBackdrop, 0, 0, 0);

//Hotbar
draw_sprite(sHotbar, 0, selection_bar_pos.x, selection_bar_pos.y);
selection_bar_index = 0;
array_foreach(global.obtained_elements, function(_element, _i) {
	obtained_element = _element;
	array_foreach(global.elements, function(_element) {
		if(obtained_element = _element.id) {
			if(obtained_element != 0) {
				draw_sprite(asset_get_index(_element.button), 0, selection_bar_vecs[selection_bar_index].x, selection_bar_vecs[selection_bar_index].y);
			}
			selection_bar_index++; 
		}
	});
});

//Hotbar selection
image_speed = 0.05;
draw_sprite(sAKey, image_index, selection_bar_pos.x - 38, selection_bar_pos.y);
draw_sprite(sDKey, image_index, selection_bar_pos.x + 38, selection_bar_pos.y);
draw_sprite(sArrow, image_index, selection_bar_vecs[selection_index].x, selection_bar_vecs[selection_index].y - 20);

//Text
draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fLarge);
draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 9.5, "SELECT A NEW SKILL", 0.8, 0.8, 0);
draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 10 * 9, "WHERE SHOULD YOUR NEW SKILL GO?", 0.5, 0.5, 0);

