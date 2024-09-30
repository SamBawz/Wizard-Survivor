if(IsObjectPaused()) {exit;}

if(ds_list_find_index(invincibility_list, other) = -1) {
	ds_list_add(invincibility_list, other);
	current_hp-=20 * other.strength * damage_mod;
	alarm[0] = invincibility_time;
	flash = 3;
	
	applyDebuff(2);
	applyDebuff(2);
}