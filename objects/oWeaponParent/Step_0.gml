/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("1"))) {
	QueueElement(1);
}

if(mouse_check_button_pressed(mb_left)) {
	var _projectile_angle = image_angle;
	PlayerCast();
}
