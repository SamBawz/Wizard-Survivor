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
	part_emitter_region(global.spell_ps, part_emit_failed, x, x, y-5, y-5, ps_shape_rectangle, ps_distr_linear);
	casting_animation = true;
	alarm[0] = 50;
	PlayerCast();
}

if(mouse_check_button(mb_right)) {
	queued_elements = [];
}
