/// @description Check if mouse over
mouse_over = false;

if(device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
{
	mouse_over = true;
}

if(mouse_over) {
	
	if(mouse_check_button_pressed(mb_left)) {
		is_clicked = true;
	}
	
	//is_clicked is turned off at the end of the step so that the following code can only be fired once
	if(is_clicked) {
		if (mouse_check_button_released(mb_left)) {
			
			//If there is a valid combination and its obtainable, set it
			if(CheckCombinations(element.id, global.obtained_elements[oLevelUpScreen.selection_index]) != false && IsEleObtainable(CheckCombinations(element.id, global.obtained_elements[oLevelUpScreen.selection_index]))) {
				global.obtained_elements[oLevelUpScreen.selection_index] = CheckCombinations(element.id, global.obtained_elements[oLevelUpScreen.selection_index]);
			}
			 //Otherwise set this element
			else {
				global.obtained_elements[oLevelUpScreen.selection_index] = element.id;
			}
			
			//The game controller paused in the first place so it still holds all saved variables for unpausing
			with(oGameController) {
				UnpauseGame();
			}
			with(oLevelUpScreen) {
				instance_destroy();
			}
		}
	}
}