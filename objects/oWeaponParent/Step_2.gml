/// @description Position logic
// Put in end step so it more accurately follows the main body

if (IsObjectPaused()) { exit; }

if(casting_animation) {image_angle = 90; depth -= 10;}

x = oPlayer.x + lengthdir_x(player_distance, image_angle);
y = oPlayer.y + lengthdir_y(player_distance, image_angle);



