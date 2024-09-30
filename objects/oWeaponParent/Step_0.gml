/// @description Cast controls and moving emitter

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
	prepareCast();
}

if(mouse_check_button_pressed(mb_right) && casting_animation = false && array_length(queued_elements) > 0) {
	saved_queued_elements = [];
	array_copy(saved_queued_elements, 0, queued_elements, 0, array_length(queued_elements));
	queued_elements = [];
	//saved_queued_elements = queued_elements;
	//prepareCast();
}
else if(mouse_check_button_pressed(mb_right) && casting_animation = false && array_length(saved_queued_elements) > 0) {
	queued_elements = [];
	array_copy(queued_elements, 0, saved_queued_elements, 0, array_length(saved_queued_elements));
	//queued_elements = saved_queued_elements;
	prepareCast();
}
