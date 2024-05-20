if(global.paused) {exit;}

if(ds_list_find_index(invincibility_list, other) = -1) {
	ds_list_add(invincibility_list, other);
	current_hp-=20;
	alarm[0] = invincibility_time;
}