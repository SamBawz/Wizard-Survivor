/// @description Cast controls

if (IsObjectPaused()) { exit; }

if(keyboard_check_pressed(ord("1"))) {
	QueueElement(0);
}

if(keyboard_check_pressed(ord("2"))) {
	QueueElement(1);
}

if(keyboard_check_pressed(ord("3"))) {
	QueueElement(2);
}

if(mouse_check_button_pressed(mb_left)) {
	PlayerCast();
}
