/// @description Position logic
// Put in end step so it more accurately follows the main body

if (IsObjectPaused()) { exit; }

image_angle = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);
if(image_angle >= 270 || image_angle <= 90) {
	image_yscale = 1;
}
else {
	image_yscale = -1;
}

x = oPlayer.x + lengthdir_x(player_distance, image_angle);
y = oPlayer.y + lengthdir_y(player_distance, image_angle);

