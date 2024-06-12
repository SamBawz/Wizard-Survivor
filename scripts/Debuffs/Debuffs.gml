global.burning_emitter = part_emitter_create(global.spell_ps);
global.maximum_debuff_ticks = 5;

//Create a list of debuffs instead of global funcs. This because you'll otherwise copy and use shared
//global variables. This means enemies will share the same debuffs with the same amount of stacks etc.
global.debuffs = ds_list_create();
ds_list_add(global.debuffs, 
{id: 0, name: "burning", stacks: 1, max_stacks: 100, emitter: global.burning_emitter, duration: global.maximum_debuff_ticks}
)

/*
global.debuff_burning = {id: 0, name: "burning", stacks: 1, max_stacks: 100, emitter: global.burning_emitter, duration: global.maximum_debuff_ticks}
global.debuff_wet = {}
global.debuff_cold = {}
global.debuff_frozen = {}
*/

function activateDebuff(_debuff) {
	switch (_debuff.id) {
		//burning
		case 0:
		current_hp-= 0.005 * _debuff.stacks;
		reduceStackDuration(_debuff);
		show_debug_message(_debuff.stacks);
		break;
		
		default: 
		break;
	}
}

function reduceStackDuration(_debuff) {
	_debuff.duration--;
	if (_debuff.duration < 1) {
		_debuff.stacks = max(_debuff.stacks--, 0);
		_debuff.duration = global.maximum_debuff_ticks;
	}
	if(_debuff.stacks < 1) {
		ds_list_delete(debuff_list, ds_list_find_index(debuff_list, _debuff));
	}
}

//Apply debuff to an enemy while also checking if max stacks have been exceeded
function applyDebuff(_debuff) {
	if(ds_list_find_index(debuff_list, _debuff) == -1) {
		ds_list_add(debuff_list, _debuff);
	}
	else {
		var _i = ds_list_find_index(debuff_list, _debuff);
		if(debuff_list[| _i].stacks < debuff_list[| _i].max_stacks) {
			debuff_list[| _i].stacks++;
		}
	}
}