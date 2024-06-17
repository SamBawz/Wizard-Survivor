spawn_time = current_time;
resistance = 0.1;

spawning = true;
spin_direction = choose(1,2);
speed_at_spawn = 6;
alarm[0] = 45;

image_yscale = 0.7 + 0.3 * strength;
image_xscale = 0.7 + 0.3 * strength;

//Emitter
part_type_boulder = part_type_create();
part_type_shape(part_type_boulder, pt_shape_square);
part_type_size(part_type_boulder, 0.7, 0.9, -0.04, 0);
part_type_scale(part_type_boulder, 0.1, 0.1);
part_type_speed(part_type_boulder, 1, 2, -0.02, 0);
part_type_direction(part_type_boulder, 80, 100, 0, 0);
part_type_gravity(part_type_boulder, 0, 270);
part_type_orientation(part_type_boulder, 0, 0, 0, 0, true);
part_type_colour3(part_type_boulder, $585850, $585850, $585850);
part_type_alpha3(part_type_boulder, 1, 1, 1);
part_type_blend(part_type_boulder, false);
part_type_life(part_type_boulder, 80, 80);

part_emit_boulder = part_emitter_create(global.spell_ps);
part_emitter_stream(global.spell_ps, part_emit_boulder, part_type_boulder, 3);
part_emitter_interval(global.spell_ps, part_emit_boulder, 0.05, 0.05, time_source_units_seconds);
