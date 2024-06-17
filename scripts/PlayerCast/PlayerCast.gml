function PlayerCast(){
	//Prepare and process the queue of elements!
	
	//Empty the queue
	casting_queue = [];
	
	function_first_element = "";
	function_second_index = "";
	function_first_index = "";
	array_foreach(queued_elements, function(_element, _i) {
		function_is_combined = false;
		function_first_index = _i;
		function_first_element = _element;
		
		array_foreach(queued_elements, function(_element, _i) { 	
			function_second_index = _i;
			
			var _result = CheckCombinations(function_first_element, _element);
			
			if(CheckCombinations(function_first_element, _element) != false) {
				array_push(casting_queue, CheckCombinations(function_first_element, _element));
				//Set to 0 instead of deleting as not to mess with the array index
				array_set(queued_elements, function_first_index, 0);
				array_set(queued_elements, _i, 0);
				//prevent the variable of the array element (foreach loop is still using this instead of the actual array element) from pairing with other elements for a second time.
				function_first_element = 0;
				function_is_combined = true;
			}
			
		});

		if (!function_is_combined && function_first_element != 0) {
			array_push(casting_queue, function_first_element);
		}
	});
	queued_elements = [];
	//show_debug_message(casting_queue);
	
	
	
	
	//Cast the damn spell
	array_foreach(casting_queue, function(_element, _index) {
		var _strength = CountElementAmount(_element);
		switch(_element) {
			
			//Heat
			case 1:
			var _fire_circle = instance_create_layer(x, y, "Instances", oFireCircle, {fire_direction : image_angle, fire_duration: _strength * 50 });
			break;
			
			//Cold
			case 2:
			for(_i = 0; _strength * 2 > _i; _i++) {
				var _Snowball = instance_create_layer(x, y, "Instances", oSnowball);
				with (_Snowball) {
				direction = random_range(other.image_angle - 10,  other.image_angle + 10);
				}
			}
			break;
			
			//Water
			case 3:
			if(instance_exists(oBubble)) {
				with(oBubble) {alarm[0] = base_duration * strength}
			}
			else {
				var _bubble = instance_create_layer(x, y, "Instances", oBubble, { strength: _strength });
			}
			break;
			
			//Air
			case 4:
			var _tornado_dash = instance_create_layer(x, y, "Instances", oDashTornado);
			with (_tornado_dash) { strength = _strength }
			PlayerDash(mouse_x, mouse_y);
			break;
			
			//Earth
			case 5:
			var _boulder = instance_create_layer(x + lengthdir_x(10, image_angle), y + lengthdir_y(10, image_angle), "Instances", oBoulder, { strength: _strength });
			with (_boulder) {
				direction = other.image_angle;
			}
			break;
			
			//Steam
			case 13:
			var _steam_circle = instance_create_layer(x, y, "Instances", oSteamCircle, {fire_direction : image_angle, fire_duration: _strength * 50 });
			break;
			
			//Magma
			case 15:
			if(instance_exists(oMagma)) {with(oMagma) {despawn = true;}}
			var _magma = instance_create_layer(mouse_x, mouse_y, "Instances", oMagma, { strength: _strength });
			break;
			
			//Pressure
			case 14:
			break;
			
			//Ice
			case 23:
			var _icicle_bolt = instance_create_layer(x, y, "Instances", oIcicleBolt, { direction: image_angle, _strength: _strength });
			break;
			
			//Vacuum
			case 24:
			break;
			
			case 0:
			break;
			
			//Failed spells
			default:
			part_emitter_burst(global.spell_ps, part_emit_failed, part_failed, 5);
		}
	});
}

//Element parameters refer to an elements id
function CheckCombinations(_first_element, _second_element) {
	//GAMEMAKER CANNOT RETURN IN AN ARRAY FOREACH LOOP BECAUSE IT HAS A SCOPE AS ITS OWN FUNCTION. USE A PUBLIC PROPERTY TO SAVE THE RETURN VALUE
	//Returning in an array foreach is like returning to the function that is used to itterate through the loop
	return_value = false;
		
	_combined_index_one = string_digits(string_replace_all(string(_first_element) + string(_second_element), "0", ""));
	_combined_index_two = string_digits(string_replace_all(string(_second_element) + string(_first_element), "0", ""));
			
	array_foreach(global.elements, function(_combination) {
		if(_combined_index_one == _combination.id) {
			return_value = _combined_index_one;
		}
		else if(_combined_index_two == _combination.id) {
			return_value = _combined_index_two;
		}
	});
		
	if(string_length(_combined_index_one) < 2 || string_length(_combined_index_two) < 2) {
		return_value = false;
	}
		
	return return_value;
}

function IsEleObtainable(_element) {
	function_return_value = false;
	function_element_to_test = _element;
	if(_element != false) {
		array_foreach(global.elements, function(_ele, _i) {
			if(function_element_to_test == _ele.id && _ele.obtainable = true) {
				function_return_value = true;
			}
		});
	}
	return function_return_value;
}

function_element_index = 0;
function_element_amount = 0;
function CountElementAmount(_i) {
	function_element_amount = 0;
	function_element_index = _i;
	array_foreach(casting_queue, function(_element, _index) {
		if(_element = function_element_index) {
			function_element_amount++;
			array_set(casting_queue, _index, 0);
		}
	});
	return function_element_amount;
}

function getElementName(_id) {
	for(var _i = 0; _i < array_length(global.elements); _i++) {
		if(global.elements[_i].id == _id) {
			return global.elements[_i].name;
		}
	}
}