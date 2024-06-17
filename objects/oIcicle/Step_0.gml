if(abs(image_xscale) < target_scale && !despawn) {
	image_xscale+=image_direction;
	image_yscale+=abs(image_direction);
}
else if(despawn) {
	image_xscale-=image_direction;
	image_yscale-=abs(image_direction);
	if(image_xscale < 0) { instance_destroy(); }
}