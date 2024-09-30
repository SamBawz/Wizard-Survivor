
//Spell effects
global.spell_ps = part_system_create();
part_system_depth(global.spell_ps, -9999);
part_system_draw_order(global.spell_ps, true);
part_system_position(global.spell_ps, 0, 0);

//The following particle systems are assigned to spells that require particles that move with the spell
global.tornado_ps  = part_system_create();
part_system_depth(global.tornado_ps, -9999);
part_system_draw_order(global.tornado_ps, true);
part_system_position(global.tornado_ps, 0, 0);

global.lightning_ps  = part_system_create();
part_system_depth(global.lightning_ps, -9999);
part_system_draw_order(global.lightning_ps, true);
part_system_position(global.lightning_ps, 0, 0);

	
