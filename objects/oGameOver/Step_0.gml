if(mouse_check_button_pressed(mb_left) && interactable) {
	part_emitter_destroy_all(global.spell_ps);
	game_restart();
}