global.maximum_debuff_ticks = 5;

function activateDebuff(_debuff) {
	switch (_debuff.id) {
		//burning
		case 0:
		current_hp-= 0.005 * _debuff.stacks;
		
		reduceStackDuration(_debuff);
		show_debug_message(_debuff.stacks);
		break;
		
		//wet, makes burning less strong but enhances other types of damage
		case 1:
		break;
		
		//cold, slows enemies until they're frozen
		case 2:
		speed -=1;
		//Replace cold with frozen
		if (speed <= 0) {
			ds_list_delete(debuff_list, returnListItemIndex(debuff_list, _debuff.id));
			applyDebuff(3);
		}
		break;
		
		default: 
		break;
	}
}

function reduceStackDuration(_debuff) {
	_debuff.duration--;
	if (_debuff.duration < 1) {
		_debuff.stacks = max(_debuff.stacks-1, 0);
		show_debug_message("removing stack");
		_debuff.duration = global.maximum_debuff_ticks;
	}
	if(_debuff.stacks < 1) {
		show_debug_message("removing debuff");
		show_debug_message(debuff_list);
		ds_list_delete(debuff_list, returnListItemIndex(debuff_list, _debuff.id));
	}
}

//Apply debuff to an enemy while also checking if max stacks have been exceeded
function applyDebuff(_debuff_id) {
	var _debuff = {id: -1}
	
	switch (_debuff_id) {
		
		//Burning
		case 0:
		_debuff = {
			id: 0,
	        name:"Burning",
			stacks: 1,
			max_stacks: 100,
			emitter: global.burning_emitter, 
			duration: global.maximum_debuff_ticks
		}
		break;
		
		//Wet
		case 1:
		break;
		
		//Cold
		case 2:
		//Check if frozen is still on there. Frozen should remain for a period of time but unfreeze midway through duration.
		//Dont apply if still frozen
		break;
		
		//Frozen
		case 3:
		break;
		
		default:
		break;
	}
	
	if(_debuff.id != -1) {
		if(returnListItemIndex(debuff_list, _debuff.id) == -1) {
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
		if(_list[| _i].id == _item_id) {
			return _i;
		}
		else {
			return -1;
		}
	}
	return -1;
}