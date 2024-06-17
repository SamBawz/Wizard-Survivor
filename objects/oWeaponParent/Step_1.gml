/// @description Destroy instance if no player, also handle image angle before casting

if(!instance_exists(oPlayer)) {
	instance_destroy();
}

if (IsObjectPaused()) { exit; }

else {
	image_angle = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);
	if(image_angle >= 270 || image_angle <= 90) {
		image_yscale = 1;
	}
	else {
		image_yscale = -1;
	}
}

//queued_elements_gui_object.queued_elements = queued_elements;