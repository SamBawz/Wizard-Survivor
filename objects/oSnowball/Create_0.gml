/// @description create emitter
speed = 3;

//Emitter
part_snow = part_type_create();
part_type_shape(part_snow, pt_shape_snow);
part_type_size(part_snow, 0.5, 1, -0.02, 0);
part_type_scale(part_snow, 0.075, 0.075);
part_type_speed(part_snow, 0.01, 0.01, 0, 0);
part_type_direction(part_snow, 0, 360, 0, 0);
part_type_gravity(part_snow, 0.02, 270);
part_type_orientation(part_snow, 0, 0, 0, 0, true);
part_type_colour3(part_snow, #00BFF3, #00BFF3, #00BFF3);
part_type_alpha3(part_snow, 1, 1, 1);
part_type_blend(part_snow, false);
part_type_life(part_snow, 80, 80);

part_emit_snow = part_emitter_create(global.spell_ps);

part_emitter_stream(global.spell_ps, part_emit_snow, part_snow, 1);
part_emitter_interval(global.spell_ps, part_emit_snow, 0.1, 0.5, time_source_units_seconds);
