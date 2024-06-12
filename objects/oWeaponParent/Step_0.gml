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

if(mouse_check_button_pressed(mb_left) && casting_animation = false && array_length(queued_elements) > 0) {
	casting_animation = true;
	alarm[0] = 50;
	PlayerCast();
}
