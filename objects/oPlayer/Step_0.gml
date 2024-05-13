if (global.paused) {
	exit;
}

PlayerMovement();

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

// Set depth to minus our y position.
// This is also done in enemies, with the
// result being instances higher up on the screen
// being drawn first.
depth = -y;
