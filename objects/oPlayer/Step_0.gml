if (IsObjectPaused()) { exit; }

var _dash = keyboard_check_pressed(vk_space);
PlayerMovement(_dash);

switch character_state {
	case CHARACTER_STATE.IDLE:
	sprite_index = sPlayerIdle;
	break;
	
	case CHARACTER_STATE.MOVING:
	sprite_index = sPlayerMoving;
	break;
	
	case CHARACTER_STATE.DAMAGED:
	sprite_index = sPlayerDamaged;
	break;
	
	case CHARACTER_STATE.DEAD:
	sprite_index = sPlayerDead;
	exit;
}
