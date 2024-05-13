if (keyboard_check_pressed(vk_escape)) {
	Pause();
}
if (keyboard_check_pressed(vk_backspace)) {
	window_set_fullscreen(!window_get_fullscreen());
}

