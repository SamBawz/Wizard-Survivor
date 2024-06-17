if(IsObjectPaused()) {exit;}

if(ds_list_find_index(invincibility_list, other) = -1) {
	ds_list_add(invincibility_list, other);
	current_hp-=30 * other.strength * damage_mod;
	alarm[0] = invincibility_time;
	flash = 3;
	
	knockback(point_direction(other.x, other.y, x, y), 7);
}