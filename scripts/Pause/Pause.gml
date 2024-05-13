global.paused = false;

function Pause(){
	global.paused = !global.paused;
	
	if (global.paused) {
		with (all) {
			// Save the instance's speed.
			paused_speed = speed;
	
			// Save the animation speed.
			paused_animation = image_speed;
	
			speed = 0;
			image_speed = 0;
		}
	}

	else {
		with (all) {
		speed = paused_speed;
		image_speed = paused_animation;
		}
	}
}