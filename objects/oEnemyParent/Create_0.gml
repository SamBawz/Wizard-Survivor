//Default enemy values
enemy_state = CHARACTER_STATE.IDLE;
max_hp = 100;// * global.enemy_health_mod;
current_hp = max_hp;
damage_mod = 1;
//for animations
jump_mod = 0.75;
rotate_mod = 2;
yscale_mod = 0;
xscale_mod = 0;
flash = 0;
frozen = false;
stunned = false;
animation_time = current_time * 0.01;
//speed
starting_speed =  0.75;
speed = starting_speed;
chilled_slow = 0;


invincibility_time = 100;
invincibility_list = ds_list_create();

debuff_list = ds_list_create();

shadow = instance_create_layer(x, y, "Shadows", oShadow);
shadow.owner_object = self;

knockback_direction = 0;
walking_direction = 0;
function knockback(_direction, _time) {
	enemy_state = CHARACTER_STATE.KNOCKED;
	alarm[1] = _time;
	knockback_direction = _direction;
}

initializeDebuffEmitters();