
//Spell effects
global.spell_ps = part_system_create();
part_system_depth(global.spell_ps, -9999);
part_system_draw_order(global.spell_ps, true);
part_system_position(global.spell_ps, 0, 0);

global.moving_spell_ps  = part_system_create();
part_system_depth(global.moving_spell_ps, -9999);
part_system_draw_order(global.moving_spell_ps, true);
part_system_position(global.moving_spell_ps, 0, 0);

	
