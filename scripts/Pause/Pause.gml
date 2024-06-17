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
		
		//Save all alarms except for... exceptions
		var _name = object_get_name(object_index)
		if (_name != "oUpgrade" && _name != "oGameOver") {
			alarm_list = ds_list_create();
			for(var _i = 0; _i < 12; _i += 1){
			ds_list_add(alarm_list, alarm[_i]);
			alarm[_i] = -1;//stop alarm from happening
			}
		}
	}
	//Pause relevant ps systems
	part_system_automatic_update(global.spell_ps, false);
	part_system_automatic_update(global.moving_spell_ps, false);
}

function UnpauseGame() {
	instance_destroy(pause_screen);
	
	global.paused = false;

	with (all) {
		if(variable_instance_exists(id, "paused_speed") && variable_instance_exists(id, "image_speed")) {
			speed = paused_speed;
			image_speed = paused_animation;
		}
		
		//Unpause all alarms
		if(variable_instance_exists(id, "alarm_list")) {
			var _len = ds_list_size(alarm_list);
			for(var _i = 0; _i < _len; _i += 1){
				alarm[_i] = ds_list_find_value(alarm_list, _i);
			}
			ds_list_destroy(alarm_list);
		}
	}
	part_system_automatic_update(global.spell_ps, true);
	part_system_automatic_update(global.moving_spell_ps, true);
}

//This function is ran by multiple objects to see if the game is paused or a menu screen is present
//Disable extra object logic with exit; when true
function IsObjectPaused() {
	if(global.paused || instance_exists(oLevelUpScreen) || instance_exists(oGameOver)) {
		return true;
	} 
}