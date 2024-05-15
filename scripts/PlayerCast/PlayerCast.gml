function PlayerCast(){
	//Prepare and process the queue of elements!
	
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
			//Check for both combinations
			_combined_index_one = string_digits(string_replace_all(string(_first_element) + string(_element), "0", ""));
			_combined_index_two = string_digits(string_replace_all(string(_element) + string(_first_element), "0", ""));
			
		
			array_foreach(global.elements, function(_combination) {
				//show_debug_message(string(_combined_index) + " en " + string(_combination.id))
				if (_combined_index_one == _combination.id || _combined_index_two == _combination.id) {
					if(_combined_index_one == _combination.id) {
						array_push(casting_queue, _combined_index_one);
					}
					else {
						array_push(casting_queue, _combined_index_two);
					}
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
	show_debug_message(casting_queue);
	
	
	
	
	//Cast the damn spell
	var _projectile_angle = image_angle;
	array_foreach(casting_queue, function(_element, _index) {
		if(_element = 2) {
			var _fireball = instance_create_layer(x, y, "Instances", oFireball);
			with (_fireball) {
				direction = random_range(other.image_angle - 10,  other.image_angle + 10);
				speed = 3;
			}
			
			var _fire_circle = instance_create_layer(x, y, "Instances", oFireCircle);
			with (_fire_circle) {
				image_angle = oPlayer.image_angle;
				direction = other.image_angle;
			}
		}
	});
}