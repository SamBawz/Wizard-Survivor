function activateDebuff(_debuff) {
	switch (_debuff.id) {
		//burning
		case 1:
		//current_hp-= 0.0075 * _debuff.stacks * damage_mod;
		current_hp-= 0.01 * _debuff.stacks * damage_mod;
		part_emitter_region(global.spell_ps, part_emit_burning, x - sprite_width / 2, x + sprite_width / 2, y - sprite_height / 2, y + sprite_height / 2, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(global.spell_ps, part_emit_burning, part_burning, 1);
		reduceStackDuration(_debuff);
		break;
		
		//cold, slows enemies until they're frozen
		case 2:
		chilled_slow = 0.25 * _debuff.stacks;
		speed = starting_speed - chilled_slow;
		//Replace cold with frozen
		if (speed <= 0) {
			ds_list_delete(debuff_list, returnListItemIndex(debuff_list, _debuff.id));
			applyDebuff(3);
		}
		else {
			reduceStackDuration(_debuff);
		}
		//particles
		part_emitter_region(global.spell_ps, part_emit_snow, x - sprite_width / 2, x + sprite_width / 2, y - sprite_height / 2, y + sprite_height / 2, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(global.spell_ps, part_emit_snow, part_snow, 1);
		break;
		
		//Frozen
		case 3:
		if(_debuff.duration > _debuff.freeze_duration) {
			frozen = true;
			speed = 0;
			//particles
			part_emitter_region(global.spell_ps, part_emit_snow, x - sprite_width / 2, x + sprite_width / 2, y - sprite_height / 2, y + sprite_height / 2, ps_shape_rectangle, ps_distr_linear);
			part_emitter_burst(global.spell_ps, part_emit_snow, part_snow, 1);
		}
		else {
			//Return speed to starting_speed after frozen
			frozen = false;
			speed = starting_speed;
		}
		reduceStackDuration(_debuff);
		break;
		
		default: 
		break;
	}
}

function reduceStackDuration(_debuff) {
	_debuff.duration--;
	if (_debuff.duration < 1) {
		_debuff.stacks = max(_debuff.stacks - 1, 0);
		_debuff.duration = _debuff.initial_duration;
	}
	if(_debuff.stacks < 1) {
		ds_list_delete(debuff_list, returnListItemIndex(debuff_list, _debuff.id));
		//For chill specifically
		if(_debuff.id = 2) { speed = starting_speed; }
	}
}

//Apply debuff to an enemy while also checking if max stacks have been exceeded
function applyDebuff(_debuff_id) {
	var _debuff = {id: -1}
	
	switch (_debuff_id) {
		
		//Burning
		case 1:
		_debuff = {
			id: 1,
	        name:"Burning",
			stacks: 1,
			max_stacks: 100,
			initial_duration: 5,
			duration: 5
		}
		break;
		
		//Cold
		case 2:
		//Check if frozen is still on there. Frozen should remain for a period of time but unfreeze midway through duration.
		//Dont apply if still frozen
		if(returnListItemIndex(debuff_list, 3) = -1) {
			_debuff = {
				id: 2,
		        name:"Chilled",
				stacks: 1,
				max_stacks: 5,
				initial_duration: 150,
				duration: 150
			}
		}
		break;
		
		//Frozen
		case 3:
		_debuff = {
			id: 3,
	        name:"frozen",
			stacks: 1,
			max_stacks: 1,
			freeze_duration: 300,
			initial_duration: 500,
			duration: 500
		}
		break;
		
		default:
		break;
	}
	
	if(_debuff.id != -1) {
		if(returnListItemIndex(debuff_list, _debuff.id) = -1) {
			ds_list_add(debuff_list, _debuff);
		}
		else {
			var _i = returnListItemIndex(debuff_list, _debuff.id);
			if(debuff_list[| _i].stacks < debuff_list[| _i].max_stacks) {
				debuff_list[| _i].stacks++;
			}
		}
	}
}

function returnListItemIndex(_list, _item_id) {
	for(var _i = 0; _i < ds_list_size(_list); _i++) {
		if(_list[| _i].id = _item_id) {
			return _i;
		}
	}
	return -1;
}

function initializeDebuffEmitters() {
	//chilled / frozen
	part_snow = part_type_create();
	part_type_shape(part_snow, pt_shape_snow);
	part_type_size(part_snow, 0.5, 1, -0.02, 0);
	part_type_scale(part_snow, 0.05, 0.05);
	part_type_speed(part_snow, 0.01, 0.01, 0, 0);
	part_type_direction(part_snow, 0, 360, 0, 0);
	part_type_gravity(part_snow, 0.01, 270);
	part_type_orientation(part_snow, 0, 0, 0, 0, true);
	part_type_colour3(part_snow, #00BFF3, #00BFF3, #00BFF3);
	part_type_alpha3(part_snow, 0.5, 1, 1);
	part_type_blend(part_snow, false);
	part_type_life(part_snow, 60, 60);
	part_emit_snow = part_emitter_create(global.spell_ps);
	
	//burning
	part_burning = part_type_create();
	part_type_shape(part_burning, pt_shape_square);
	part_type_size(part_burning, 0, 0, 0.02, 0);
	part_type_scale(part_burning, 0.1, 0.1);
	part_type_speed(part_burning, 0.1, 0.3, 0, 0);
	part_type_direction(part_burning, 80, 100, 0, 0);
	part_type_colour3(part_burning, $00FAFF, $3D81FF, $4D4D4D);
	part_type_alpha3(part_burning, 0.9, 0.9, 0.9);
	part_type_blend(part_burning, false);
	part_type_life(part_burning, 20, 20);
	part_emit_burning = part_emitter_create(global.spell_ps);
}