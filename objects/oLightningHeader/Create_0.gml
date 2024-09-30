speed = 0;
x_offset = 0;
y_offset = 0;
bounces = 0;

target_list = ds_list_create();

direction_range = 80;
direction_interval = 5;
alarm[0] = direction_interval;
alarm[1] = 1000;

rand_direction = random_range(direction - direction_range, direction + direction_range);

/*
part_type_lightning_trail = part_type_create();
part_type_shape(part_type_lightning_trail, pt_shape_square);
part_type_size(part_type_lightning_trail, 0.15, 0.15, -0.003, 0);
part_type_scale(part_type_lightning_trail, 0.3, 0.3);
part_type_speed(part_type_lightning_trail, 0.1, 0.1, 0, 0);
part_type_direction(part_type_lightning_trail, 60, 100, 0, 0);
part_type_gravity(part_type_lightning_trail, 0, 270);
part_type_orientation(part_type_lightning_trail, 0, 0, 1, 0, true);
part_type_colour3(part_type_lightning_trail, $FFFFFF, $FF99C6, $FF2184);
part_type_alpha3(part_type_lightning_trail, 1, 1, 1);
part_type_blend(part_type_lightning_trail, false);
part_type_life(part_type_lightning_trail, 40, 40);
*/

part_type_lightning_trail = part_type_create();
part_type_shape(part_type_lightning_trail, pt_shape_square);
part_type_sprite(part_type_lightning_trail, sLightningOrb, 0, 0, 0);
part_type_size(part_type_lightning_trail, 1, 1, -0.04, 0);
part_type_scale(part_type_lightning_trail, 0.9, 0.9);
part_type_speed(part_type_lightning_trail, 0.1, 0.1, 0, 0);
part_type_direction(part_type_lightning_trail, 60, 100, 0, 0);
part_type_gravity(part_type_lightning_trail, 0, 270);
part_type_orientation(part_type_lightning_trail, 0, 0, 0, 0, false);
part_type_colour3(part_type_lightning_trail, $FFFFFF, $FF99C6, $FF2184);
part_type_alpha3(part_type_lightning_trail, 1, 1, 1);
part_type_blend(part_type_lightning_trail, false);
part_type_life(part_type_lightning_trail, 20, 20);

part_emit_lightning = part_emitter_create(global.spell_ps);

part_emitter_region(global.spell_ps, part_emit_lightning, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.spell_ps, part_emit_lightning, part_type_lightning_trail, 1);
part_emitter_interval(global.spell_ps, part_emit_lightning, -2, -2, time_source_units_frames);