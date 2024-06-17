//shaders
if(flash > 0) {
	flash -=1;
    shader_set(shadEnemyFlash);
}
else if(frozen) {
	shader_set(shadEnemyFrozen);
}

if(!frozen && !IsObjectPaused()) {
	if(direction > 90 && direction < 270) {
	image_xscale = -1;
	}
	else {
	image_xscale = 1;
	}
	animation_time = current_time * 0.01;
}

draw_sprite_ext(object_get_sprite(object_index), image_index, x, y + sin(animation_time) * jump_mod,  min(1, image_xscale + sin(animation_time) * xscale_mod), max(1, image_yscale + sin(animation_time) * yscale_mod), 0 + sin(animation_time) * rotate_mod, c_white, 1);

//reset shaders
shader_reset();

