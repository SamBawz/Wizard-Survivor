if(!despawn) {
	if(image_xscale < x_scale_target) {
		image_xscale+= 0.075;
		image_yscale+= 0.075;
	}
}
else {
	image_xscale-= 0.05;
	image_yscale-= 0.05;
	if(image_xscale < 0) {instance_destroy();}
}

part_emitter_region(global.spell_ps, part_emit_burning, x-sprite_width * image_xscale * 0.4, x+sprite_width * image_xscale * 0.4, y-sprite_height * image_yscale * 0.4,  y+sprite_height * image_yscale * 0.4, ps_shape_ellipse, ps_distr_linear);
