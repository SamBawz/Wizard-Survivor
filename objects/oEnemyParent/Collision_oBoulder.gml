if(IsObjectPaused()) {exit;}

if(other.speed != 0) {
	if(ds_list_find_index(invincibility_list, other) = -1) {
		ds_list_add(invincibility_list, other);
		current_hp-=(25 * other.strength + other.speed) * damage_mod;
		alarm[0] = invincibility_time;
		flash = 3;
		
		knockback(point_direction(other.x, other.y, x, y), 7);
	}
}
