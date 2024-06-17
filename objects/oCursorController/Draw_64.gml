/// @description use draw gui event because it has priority over draw events and ignores layer depth
var _x = device_mouse_x_to_gui(0);
var _y = device_mouse_y_to_gui(0)

if(instance_exists(oGameOver)) {draw_sprite_ext(sCursorSelect, -1, _x, _y, 0.6, 0.6, 0, c_white, 1); exit;}
if(instance_exists(oUpgrade)) {
	var _mouse_over = false;
	for (var _i = 0; _i < instance_number(oUpgrade); _i++;) {
		if(instance_find(oUpgrade, _i).mouse_over) {
			_mouse_over = true;
		}
	}
	if(_mouse_over) {
		draw_sprite_ext(sCursorSelect, -1, _x, _y, 0.6, 0.6, 0, c_white, 1);
	}
	else {
		draw_sprite_ext(sCursorDefault, -1, _x, _y, 0.6, 0.6, 0, c_white, 1);
	}
}
else if (instance_exists(oWeaponParent)) {
	if(array_length(instance_find(oWeaponParent, 0).queued_elements) > 0) {
		draw_sprite_ext(sCursorTarget, -1, _x, _y, 0.6, 0.6, 0, c_white, 1);
	}
	else {
		draw_sprite_ext(sCursorNoTarget, -1, _x, _y, 0.6, 0.6, 0, c_white, 1);
	}
}