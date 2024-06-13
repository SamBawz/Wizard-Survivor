if(spawning) {
	image_angle+=speed_at_spawn;
}
 else {
	 speed = speed-resistance;
	 if(speed > 0) {
	image_angle+=speed;
	}
	else {
		instance_destroy();
	}
 }

