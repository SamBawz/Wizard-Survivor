/// @description draw vignette
if(IsObjectPaused()){exit;}

var _t = current_time * 0.01;
if(vignette) {
	vignette_alpha = min(1, vignette_alpha+0.05);
	draw_sprite_ext(sHurtVignette, -1, display_get_gui_width() / 2, display_get_gui_height() / 2, max(1.02, 1.02 + sin(_t) * 0.05), max(1.02, 1.02 + sin(_t) * 0.05), 0, c_white, vignette_alpha);
	//vignette_max = max(1, vignette_max=-0.01);
}
else {
	vignette_alpha = max(0, vignette_alpha-0.05);
	draw_sprite_ext(sHurtVignette, -1, display_get_gui_width() / 2, display_get_gui_height() / 2, max(1.02, 1.02 + sin(_t) * 0.05), max(1.02, 1.02 + sin(_t) * 0.05), 0, c_white, vignette_alpha);
}