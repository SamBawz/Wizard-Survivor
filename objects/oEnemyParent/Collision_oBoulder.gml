if(global.paused) {exit;}

if(other.speed != 0) {
	if(ds_list_find_index(invincibility_list, other) = -1) {
		ds_list_add(invincibility_list, other);
		current_hp-=20 * other.strength + other.speed;
		alarm[0] = invincibility_time;
	}
}
