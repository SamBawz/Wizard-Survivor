/// @description Check if mouse over
mouse_over = false;

if(device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
{
	mouse_over = true;
}

if(mouse_over && interactable) {
	
	if(mouse_check_button_pressed(mb_left)) {
		is_clicked = true;
	}
	
	//is_clicked is turned off at the end of the step so that the following code can only be fired once
	if(is_clicked) {
		if (mouse_check_button_released(mb_left)) {
			
			//Start animation and disable further inputs
			interactable = false;
			oLevelUpScreen.animation_playing = true;
			image_speed = 1;
			alarm[0] = 35;
		}
	}
}