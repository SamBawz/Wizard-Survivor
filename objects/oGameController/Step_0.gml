if (keyboard_check_pressed(vk_backspace)) {
	window_set_fullscreen(!window_get_fullscreen());
}

if(keyboard_check_pressed(ord("R")) || global.player_health <= 0) {
	global.paused = false;
	game_restart();
}

//When UI is present, disable pausing
if(instance_exists(oLevelUpScreen)) {
	exit;
} 

if (keyboard_check_pressed(vk_escape)) {
	if(!global.paused) { PauseGame() }
	else { UnpauseGame() }
}

if(global.paused) {
	exit;
}

// Set depth to minus our y position.
// This is also done in enemies, with the
// result being instances higher up on the screen
// being drawn first.
with(all) {
	depth = -y;
}

if(global.current_xp >= 100) {
	global.current_xp = 0;
	global.level++;
	global.xp_modifier = 1 / global.level;
	
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


