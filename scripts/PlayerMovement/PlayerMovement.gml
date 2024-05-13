function PlayerMovement(){
	var _max_speed = 2;
	speed = 0;
	
	if(character_state = CHARACTER_STATE.DEAD) {
		exit;
	}
	
	if (keyboard_check(ord("W")))
	{
		vspeed += -10;
	}
	
	if (keyboard_check(ord("S")))
	{
		vspeed += 10;
	}
	
	if (keyboard_check(ord("A")))
	{
		hspeed += -10;
	}
	
	if (keyboard_check(ord("D")))
	{
		hspeed += 10;
	}
	
	direction = point_direction(x, y, x + hspeed, y + vspeed);
	// Set speed to a fixed value in the current direction.
	// This essentially normalizes the curent hspeed and vspeed values.
	speed = min(speed, _max_speed);
	
	if (hspeed != 0)
	{
		image_xscale = 1 * -sign(hspeed);
	}
	
	if(character_state != CHARACTER_STATE.DAMAGED || character_state != CHARACTER_STATE.DEAD) {
		if (speed > 0) {
			character_state = CHARACTER_STATE.MOVING;
		}
		else {
			character_state = CHARACTER_STATE.IDLE;
		}
	}
}