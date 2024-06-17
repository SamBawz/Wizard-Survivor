if(IsObjectPaused()) {exit;}

//current_hp-=1;
applyDebuff(1);

if(other.steam) {
	knockback(point_direction(other.x, other.y, x, y), 2);
}