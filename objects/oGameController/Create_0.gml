//GameController will display actual information on the GUI
//layer_element_move(self, "GUI");

//Hotbar positioning
hotbar_index = 0;
global.hotbar_vec = {x: display_get_gui_width() / 2, y: display_get_gui_height() - 22};
hotbar_icon_vec = [ 
	{x: global.hotbar_vec.x - 21, y: global.hotbar_vec.y}, 
	{x: global.hotbar_vec.x, y: global.hotbar_vec.y}, 
	{x: global.hotbar_vec.x + 21, y: global.hotbar_vec.y}
];

global.current_xp = 0;
global.level = 1;
global.player_health = 100;
global.xp_modifier = 1 / global.level;

enemy_spawn_speed = 120;
spawn_limit = 50;
global.enemy_additive_defense_mod = 1;

global.obtained_elements = [1, 0, 0];

//Spawn the player
instance_create_layer(x, y, "Instances", oPlayer);

enemy_list = ds_list_create();
ds_list_add(enemy_list, oZombie);
spawn_enemy_cooldown = enemy_spawn_speed * (1 / 60);
spawn_distance = 350;
function SpawnEnemy() {
	if(instance_number(oEnemyParent) < spawn_limit) {
		//Reset cd
		spawn_enemy_cooldown = enemy_spawn_speed * (1 / 60);
	
		ds_list_shuffle(enemy_list);
		var _enemy = enemy_list[| 0];
	
		var _dir = random(360);
		var _x = oPlayer.x + lengthdir_x(spawn_distance, _dir);
		var _y = oPlayer.y + lengthdir_y(spawn_distance, _dir);
	
		instance_create_layer(_x, _y, "Instances", _enemy);
	}
}

message_string = "";
announcement = false;
function announce(_message) {
	message_string = string(_message);
	announcement = true;
	alarm[0] = 150;
}