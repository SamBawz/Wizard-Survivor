if(IsObjectPaused()){exit;}

if(spawning) {
	//image_angle+=speed_at_spawn;
}
 else {
	 part_emitter_region(global.spell_ps, part_emit_boulder, x - 7, x + 7, y + 6, y + 6, ps_shape_rectangle, ps_distr_linear);
	 
	 speed = speed-resistance;
	 if(speed > 0) {
		 if(spin_direction = 1) { image_angle+=speed; }
		 else { image_angle-=speed; }
	}
	else {
		image_yscale-=0.1;
		image_xscale-=0.1;
		if(image_xscale <= 0) {instance_destroy();}
	}
 }

