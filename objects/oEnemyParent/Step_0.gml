if(global.paused) {exit;}

if(instance_exists(oPlayer)) {
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
}


if(hspeed != 0)
{
	image_xscale = -sign(hspeed);
}

if(current_hp <= 0) {
	instance_destroy();
}