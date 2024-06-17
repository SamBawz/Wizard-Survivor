spawn_cooldown -= delta_time * 0.000001;
	
if(spawn_cooldown <= 0) {
	spawn_cooldown = 0.7 * (1 / 60);
	
	var _spawn_pos = {x: x + random_range(-sprite_width*spawn_range_mod, sprite_width*spawn_range_mod), y: y + random_range(-sprite_height*spawn_range_mod, sprite_height*spawn_range_mod)}
	instance_create_layer(_spawn_pos.x, _spawn_pos.y, "Instances", oIcicle);
}