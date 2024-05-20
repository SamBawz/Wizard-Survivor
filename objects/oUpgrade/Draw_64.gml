if(mouse_over) {
	draw_sprite(sUpgradeOutline, 0, x, y);
	
	for(var _i = 0; _i < array_length(interaction_preview_sprites); _i++) {
		if(string_length(interaction_preview_sprites[_i]) > 0) {
			draw_sprite(asset_get_index(interaction_preview_sprites[_i]), 0, oLevelUpScreen.selection_bar_vecs[_i].x, oLevelUpScreen.selection_bar_vecs[_i].y);
		} 
	}
}
draw_self();

draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fLarge);
draw_text_transformed(x, y-25, element.name, 0.5, 0.5, 0);
draw_text_ext_transformed(x, y-10, element.description, 19, 120,  0.4, 0.4, 0);