/// @description Insert description here
// You can write your code in this editor

if(character_state = CHARACTER_STATE.DAMAGED) {
	image_alpha = current_time mod 20 > 10? 0:1;
}

if(character_state = CHARACTER_STATE.MOVING) {
	var _t = current_time * 0.01;
	draw_sprite_ext(sPlayerIdle, image_index, x, y + sin(_t) * 0.5, image_xscale, image_yscale, 0 + sin(_t) * 2, c_white, 1);
	//draw_sprite(sPlayerMoving, 0, x, y + sin(_t) * 1);
	image_index+=image_speed;
}

else {
	draw_self();
}


