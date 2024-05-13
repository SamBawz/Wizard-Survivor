/// @description Draw the queued elements onto the gui
draw_set_alpha(1);
draw_sprite( sElementQueue, 0, 0, display_get_gui_height());
draw_set_alpha(0.2);
var _fire = draw_sprite( sHeatButton, 0, 2, display_get_gui_height()-22);

draw_set_alpha(1);