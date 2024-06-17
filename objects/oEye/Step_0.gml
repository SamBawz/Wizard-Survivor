/// @description Shoot lasers at player
event_inherited();

//if in room
if(bbox_right || bbox_bottom || bbox_left<room_width || bbox_top<room_height) {
	if(instance_exists(oPlayer)) {
		if(point_distance(x, y, oPlayer.x, oPlayer.y) < 90 && !cooldown && !frozen) {
			cooldown = true;
			alarm[11] = 150;
			alarm[10] = 25;
			animation_playing = true;
		} 
	}
}

if (animation_playing) {
	percent += 4 / ANIMATION_FRAMES;
	var _size = animcurve_channel_evaluate(size_curve, percent);
	image_xscale = _size;
	image_yscale = _size;
	if(percent >= 1) {
		percent = 0;
		animation_playing = false;
	}
}