/// @description Delete hitbox
instance_destroy(hitbox);
if(part_emitter_exists(global.spell_ps, pemit1)) {part_emitter_destroy(global.spell_ps, pemit1)}