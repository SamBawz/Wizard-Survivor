/// @description Insert description here
// You can write your code in this editor

if(IsObjectPaused()) {
	exit;
}

if(current_time - last_spawn > spawn_cooldown) {
	last_spawn = current_time;
	
	instance_create_layer(random_range(100, room_width - 100), random_range(100, room_height - 100), "Instances", oExperience);
}