//THIS FILE IS DEPRECATED

//All elemental attacks that are queued are fired at once
//BUT if queue contains combinations, remove those elements from queue and insert combined element
//Same method for failed combinations (e.g. Heat and Cold) but these don't have replacements

//Mayhaps the following method:
//For each element in queue; add up enum index with each other element in queue
//If resulting index exists as enum (or element), then add resulting element to casting queue array and remove both elements from queued elements array
//If resulting index does not exist in enum, add current element to casting queue instead
//Arcane is unique and has an index of 0, check if element = 0. If yes, add homing = true to PlayerCast(true) 
function PlayerProcessQueue(){
	//Empty the queue
	casting_queue = [];
	
	var _first_element;
	var _combined_index;
	var _second_index;
	var _first_index;
	array_foreach(queued_elements, function(_element, _i) {
		//KIJK NAAR PUSHED SHIT
		var _pushed = false;
		_first_index = _i;
		_first_element = _element;
		
		array_foreach(queued_elements, function(_element, _i) { 	
			_second_index = _i;
			//Remove zeros which get added when parsing to string
			_combined_index = string_digits(string_replace_all(string(_first_element) + string(_element), "0", ""));
			
		
			array_foreach(global.elements, function(_combination) {
				//show_debug_message(string(_combined_index) + " en " + string(_combination.id))
				if (_combined_index == _combination.id) {
					array_push(casting_queue, _combined_index);
					_pushed = true;
					//Set to 0 instead of deleting as not to mess with the array index
					array_set(queued_elements, _first_index, 0);
					array_set(queued_elements, _second_index, 0);
					//prevent the variable of the array element (foreach loop is still using this instead of the actual array element) from pairing with other elements for a second time.
					_first_element = 0;
				}
			});
		});

		if (!_pushed && _first_element != 0) {
			array_push(casting_queue, _first_element);
		}
	});
	queued_elements = [];
	//EXPECTED RESULT = [12,3]
	show_debug_message(casting_queue);
}