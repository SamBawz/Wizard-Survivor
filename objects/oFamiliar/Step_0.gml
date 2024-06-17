if(instance_exists(oEnemyParent)) {
	var _nearest =  instance_nearest(x, y, oEnemyParent);
	if(distance_to_object(_nearest) < 100) {
		image_angle = point_direction(x, y, _nearest.x, _nearest.y) - 90;
		
		if(!cooldown) {
			cooldown = true;
			alarm[0] = 75;
		
			flash = 4;
			animation_playing = true;
			FamiliarCast(_nearest.x, _nearest.y);
		}
	}
	else {
		image_angle = orbit;
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
