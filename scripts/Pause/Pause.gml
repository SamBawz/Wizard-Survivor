global.paused = false;

//The following function can also be used to pause/unpause the game whenever a UI element appears
//Make sure to avoid adding objects after pausing, or they won't have paused properties when unpausing (such as paused_speed)
function PauseGame() {
	pause_screen = instance_create_layer(0, 0, "PauseOverlay", oPauseScreen);
	global.paused = true;
	
	with (all) {
		// Save the instance's speed.
		paused_speed = speed;
		// Save the animation speed.
		paused_animation = image_speed;
		speed = 0;
		image_speed = 0;
	}
	//Pause relevant ps systems
	part_system_automatic_update(global.spell_ps, false);
}

function UnpauseGame() {
	instance_destroy(pause_screen);
	
	global.paused = false;

	with (all) {
		speed = paused_speed;
		image_speed = paused_animation;
	}
	part_system_automatic_update(global.spell_ps, true);
}

//This function is ran by multiple objects to see if the game is paused or a menu screen is present
//Disable extra object logic with exit; when true
function IsObjectPaused() {
	if(global.paused || instance_exists(oLevelUpScreen)) {
		return true;
	} 
}