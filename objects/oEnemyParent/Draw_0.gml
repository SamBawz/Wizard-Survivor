if(direction > 90 && direction < 270) {
	image_yscale = -1;
}
else {
	image_yscale = 1;
}

if(global.paused) {
	draw_self()
}
else {
	var _t = current_time * 0.01;
	draw_sprite_ext(object_get_sprite(object_index), image_index, x, y + sin(_t) * 0.75, image_xscale, image_yscale, 0 + sin(_t) * 2, c_white, 1);
}

draw_set_font(fMedium);
if(ds_list_size(debuff_list) > 0) {
	draw_text(x, y, string(debuff_list[| 0].stacks));
}

