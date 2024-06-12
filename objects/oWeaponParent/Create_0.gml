initial_depth = 2;
player_distance = 5;

queued_elements = [];
floating_icon_vec = {x:0, y:0};

casting_animation = false;


function QueueElement(_i) {
	hotbar_index = _i;
	array_foreach(global.obtained_elements, function(_element, _index) {
		if(_index = hotbar_index) {
			if(array_length(queued_elements) < 3 && _element != 0) {
				array_push(queued_elements, _element);
			}
		}
	});
}
