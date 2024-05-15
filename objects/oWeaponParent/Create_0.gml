initial_depth = 2;
player_distance = 10;

obtained_elements = [2, 2, 3];
queued_elements = [];

hotbar_index = 0;
floating_icon_vec = {x:0, y:0};

hotbar_vec = {x: display_get_gui_width() / 2, y: display_get_gui_height() - 40};
hotbar_icon_vec = [ 
	{x: hotbar_vec.x - 21, y: hotbar_vec.y}, 
	{x: hotbar_vec.x, y: hotbar_vec.y}, 
	{x: hotbar_vec.x + 21, y: hotbar_vec.y}
];

function QueueElement(_i) {
	hotbar_index = _i;
	array_foreach(obtained_elements, function(_element, _i) {
		if(_i = hotbar_index) {
			if(array_length(queued_elements) < 3) {
				array_push(queued_elements, _element);
			}
		}
	});
}
