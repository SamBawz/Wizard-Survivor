initial_depth = 2;
player_distance = 10;

obtained_elements = [];
queued_elements = [1, 2, 3];

function QueueElement(_element) {
	if(array_length(queued_elements) < 3) {
		array_push(queued_elements, _element);
	}
}
