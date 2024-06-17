global.dash_vec = {x: 0, y: 0};
function PlayerDash(_x, _y) {
	if(oPlayer.character_state != CHARACTER_STATE.DEAD) {
		global.dash_vec.x = _x;
		global.dash_vec.y = _y;
		oPlayer.speed = 5;
		oPlayer.direction = point_direction(oPlayer.x, oPlayer.y, _x, _y);
		oPlayer.character_state = CHARACTER_STATE.DASHING;
		oPlayer.alarm[0] = 50;
	}
}

function PlayerMovement(_dash){
	//TODO add dash cooldown and temporary dash state (1 tick is not enough time)
	var _max_speed = _dash? 4 : 2;
	var _speed_mod = _dash? 2 : 1;
	
	
	if(character_state = CHARACTER_STATE.DEAD) {
		exit;
	}
	
	if(character_state = CHARACTER_STATE.DASHING) {
		//Return to non-dash state when approaching destination
		if(point_distance(x, y, global.dash_vec.x, global.dash_vec.y) < 5) {
			character_state = CHARACTER_STATE.IDLE;
			with (oDashTornado) {instance_destroy();}
			alarm[0] = -1;
		}
		exit;
	}
	
	speed = 0;
	
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
		image_xscale = 1 * sign(hspeed);
	}
	
	if(character_state != CHARACTER_STATE.DAMAGED && character_state != CHARACTER_STATE.DEAD) {
		if (speed > 0) {
			character_state = CHARACTER_STATE.MOVING;
		}
		else {
			character_state = CHARACTER_STATE.IDLE;
		}
	}
}