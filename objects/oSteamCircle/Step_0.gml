if (IsObjectPaused()) { exit; }


image_angle += 2;
if(image_xscale != 1 && alive) {
	image_xscale+= 0.1;
	image_yscale+= 0.1;
}
else if(image_xscale > 0 && !alive) {
	image_xscale-= 0.1;
	image_yscale-= 0.1;
}

if (image_xscale <= 0) {
	alarm[1] = 75;
}

/*
x = oPlayer.x;
y = oPlayer.y;
part_system_position(ps, x, y);
*/