if (keyboard_check_pressed(vk_backspace)) {
	window_set_fullscreen(!window_get_fullscreen());
}

if(instance_exists(oGameOver)) {exit;}

if(keyboard_check_pressed(ord("R")) || global.player_health <= 0) {
	if(global.paused) {UnpauseGame();}
	//else {PauseGame(); UnpauseGame();}
	part_emitter_destroy_all(global.spell_ps);
	game_restart();
}

//When UI is present, disable pausing and enemy spawning
if(instance_exists(oLevelUpScreen)) {
	exit;
} 

if (keyboard_check_pressed(vk_escape)) {
	if(!global.paused) { PauseGame() }
	else { UnpauseGame() }
}

if(IsObjectPaused()) {
	exit;
}

// Set depth to minus our y position.
// This is also done in enemies, with the
// result being instances higher up on the screen
// being drawn first.
with(all) {
	//Disclude controllers and screens
	//This actually doesn't matter because controllers and screens are sorted with layer_depth instead
	var _name = object_get_name(object_index)
	if (_name != "oCursorController" && _name != "oGameController" && _name != "oLevelUpScreen" && _name != "oUpgrade" && _name != "oPauseScreen" && _name != "oShadow") {
		depth = -y;
	}
}

if(global.current_xp >= 100) {
	global.current_xp = 0;
	global.level++;
	global.xp_modifier = 0.3 / global.level;
	
	//Add enemies to possible spawns
	switch (global.level) {
		
		case 2:
		enemy_spawn_speed = 100;
		ds_list_add(enemy_list, oSkeleton);
		break;
		
		case 4:
		enemy_spawn_speed = 80;
		ds_list_add(enemy_list, oCube);
		break;
		
		case 6:
		enemy_spawn_speed = 60;
		ds_list_add(enemy_list, oEye);
		break;
		
		
		case 8:
		enemy_spawn_speed = 40;
		ds_list_add(enemy_list, oTentacle);
		break;
		
		case 10:
		enemy_spawn_speed = 50;
		break;
	}
	
	//ALWAYS PAUSE LAST. Otherwise you will create objects that don't include paused properties (like image_speed)
	instance_create_layer(0, 0, "Menus", oLevelUpScreen);
	PauseGame();
}


// Reduce spawner cooldown timer.
spawn_enemy_cooldown -= delta_time * 0.000001;
	
// Checks if spawner has expired.
if(spawn_enemy_cooldown <= 0) {
	// Calls spawn enemy function.
	SpawnEnemy();	
}


