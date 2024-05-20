function PlayerMovement(_dash){
	//TODO add dash cooldown and temporary dash state (1 tick is not enough time)
	var _max_speed = _dash? 4 : 2;
	var _speed_mod = _dash? 2 : 1;
	speed = 0;
	
	if(character_state = CHARACTER_STATE.DEAD) {
		exit;
	}
	
	if (keyboard_check(ord("W")))
	{
		vspeed += -10*_speed_mod;
	}
	
	if (keyboard_check(ord("S")))
	{
		vspeed += 10*_speed_mod;
	}
	
	if (keyboard_check(ord("A")))
	{
		hspeed += -10*_speed_mod;
	}
	
	if (keyboard_check(ord("D")))
	{
		hspeed += 10*_speed_mod;
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