if(!instance_exists(oWeaponParent)) {
	staff = instance_create_layer(x, y, "Instances", oDefaultStaff);
}

depth = 1;

experience = 0;
level = 0;
character_state = CHARACTER_STATE.IDLE;

function TakeDamage(_amount) {
	if (character_state != CHARACTER_STATE.DAMAGED) {
		character_state = CHARACTER_STATE.DAMAGED;
		global.player_health -= _amount;
		alarm[0] = 50;
	}
}