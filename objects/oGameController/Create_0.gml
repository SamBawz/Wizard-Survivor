//GameController will display actual information on the GUI
layer_element_move(self, "GUI");

//Hotbar positioning
hotbar_index = 0;
global.hotbar_vec = {x: display_get_gui_width() / 2, y: display_get_gui_height() - 30};
hotbar_icon_vec = [ 
	{x: global.hotbar_vec.x - 21, y: global.hotbar_vec.y}, 
	{x: global.hotbar_vec.x, y: global.hotbar_vec.y}, 
	{x: global.hotbar_vec.x + 21, y: global.hotbar_vec.y}
];

global.current_xp = 0;
global.level = 1;
global.xp_modifier = 1 / global.level;

global.enemy_spawn_speed = 300;
global.enemy_health_mod = 1;

global.obtained_elements = [2, 3, 0];

//Spawn the player
instance_create_layer(x, y, "Instances", oPlayer);

spawn_enemy_cooldown = global.enemy_spawn_speed * (1 / 60);
spawn_distance = 300;
function SpawnEnemy() {
	//Reset cd
	spawn_enemy_cooldown = global.enemy_spawn_speed * (1 / 60);
	
	var _enemy = oTestEnemy;
	
	//Choose a random enemy based on the level
	if(global.level > 2) {
		//_enemy = choose(obj_pigun, obj_pumpkill, obj_rooster);
	}
	if(global.level > 4) {
	}
	if(global.level > 6) {
	}
	
	var _dir = random(360);
	var _x = oPlayer.x + lengthdir_x(spawn_distance, _dir);
	var _y = oPlayer.y + lengthdir_y(spawn_distance, _dir);
	
	instance_create_layer(_x, _y, "Instances", _enemy);
}