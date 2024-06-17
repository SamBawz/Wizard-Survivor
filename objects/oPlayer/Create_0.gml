if(!instance_exists(oWeaponParent)) {
	staff = instance_create_layer(x, y, "Instances", oDefaultStaff);
}

depth = 1;

vignette = false;
vignette_alpha = 0;

experience = 0;
level = 0;
character_state = CHARACTER_STATE.IDLE;

function TakeDamage(_amount) {
	if(instance_exists(oBubble)) { 
		with(oBubble) { popBubble(); } 
		//gain some invuln time
		if(character_state != CHARACTER_STATE.DASHING) {
			character_state = CHARACTER_STATE.DAMAGED;
			alarm[0] = 15;
		}
		exit;
	}
	if(character_state = CHARACTER_STATE.DASHING || character_state = CHARACTER_STATE.DEAD || IsObjectPaused()) { exit; }
	if (character_state != CHARACTER_STATE.DAMAGED) {
		character_state = CHARACTER_STATE.DAMAGED;
		vignette = true;
		global.player_health -= _amount;
		alarm[0] = 50;
		alarm[1] = 50;
	}
}

var _shadow = instance_create_layer(x, y, "Shadows", oShadow);
_shadow.owner_object = self;