/// @description Health bar
if(current_hp != 100) {
	draw_healthbar(x - 8, y - 13, x + 7, y - 12, current_hp, c_gray, c_red, c_red, 0, true, false);
}

draw_set_font(fMedium);
draw_set_color(c_white);
draw_set_halign(fa_left);

var _text_offset = 0;

//Burning
if(returnListItemIndex(debuff_list, 1) != -1) {
	draw_text_transformed(x + 14 + _text_offset, y - 15, string(debuff_list[| returnListItemIndex(debuff_list, 1)].stacks), 0.3, 0.3, 0);
	draw_sprite_ext(sHeatButton, -1, x + 11 + _text_offset, y - 13, 0.3, 0.3, 0, c_white, 1);
	_text_offset+=10;
}
//Charged
if(returnListItemIndex(debuff_list, 4) != -1) {
	draw_text_transformed(x + 14 + _text_offset, y - 15, string(debuff_list[| returnListItemIndex(debuff_list, 4)].stacks), 0.3, 0.3, 0);
	draw_sprite_ext(sAirButton, -1, x + 11 + _text_offset, y - 13, 0.3, 0.3, 0, c_white, 1);
	_text_offset+=10;
}