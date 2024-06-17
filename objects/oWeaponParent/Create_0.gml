initial_depth = 2;
player_distance = 5;

queued_elements = [];
floating_icon_vec = {x:0, y:0};

casting_animation = false;

//Outsource the task of displaying element icons above players head because that way this element can have a different depth than the player weapon
// = instance_create_layer(x, y, "Instances", oQueuedElements);


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

//Failed spell emitter
part_failed = part_type_create();
part_type_shape(part_failed, pt_shape_square);
part_type_size(part_failed, 1, 1, -0.03, 0);
part_type_scale(part_failed, 0.1, 0.1);
part_type_speed(part_failed, 0.5, 1, 0, 0);
part_type_direction(part_failed, 75, 105, 0, 0);
part_type_colour3(part_failed, $676767, $808080, $343434);
part_type_life(part_failed, 40, 40);

part_emit_failed = part_emitter_create(global.spell_ps);


