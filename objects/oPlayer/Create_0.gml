if(!instance_exists(oWeaponParent)) {
	staff = instance_create_layer(x, y, "Instances", oDefaultStaff);
}

depth = 1;

experience = 0;
level = 0;
character_state = CHARACTER_STATE.IDLE;