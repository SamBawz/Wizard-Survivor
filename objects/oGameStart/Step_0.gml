if(mouse_check_button_pressed(mb_left)) {
	if(slide_index < ds_list_size(slides)){

	sprite_index = slides[| slide_index];
	//stretch sprite to fill
	image_xscale = room_width / sprite_get_width(sprite_index);
	image_yscale = room_height / sprite_get_height(sprite_index);
	slide_index ++;
	
	gpu_set_tex_filter(false);
	
	}
	else {
		room_goto(rMain);
	}
}

if (keyboard_check_pressed(vk_backspace)) {
	window_set_fullscreen(!window_get_fullscreen());
}
