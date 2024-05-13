GameStart();

if(!instance_exists(oWeaponParent)) {
	instance_create_layer(x, y, "Instances", oDefaultStaff);
}

depth = 1;

character_state = CHARACTER_STATE.IDLE;