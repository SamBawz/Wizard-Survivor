if(IsObjectPaused()) {exit;}

//Activate current debuffs
for(var _i = 0; _i < ds_list_size(debuff_list); _i++;) {
	activateDebuff(debuff_list[| _i]);
}

if(enemy_state = CHARACTER_STATE.KNOCKED) {
	direction = knockback_direction;	
	speed = 2.5;
}
else {
	if(instance_exists(oPlayer)) {
		direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	}
}

if(hspeed != 0) {
	image_xscale = -sign(hspeed);
}

if(current_hp <= 0) {
	instance_destroy();
}