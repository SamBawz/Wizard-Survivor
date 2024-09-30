speed = 0.2;
speed_increase = speed;
despawn = false;

ps_lightning = part_system_create();
part_system_depth(ps_lightning, -9999);
part_system_draw_order(ps_lightning, true);
part_system_position(ps_lightning, 0, 0);

//Emitter
part_type_lightning_tracker = part_type_create();
part_type_shape(part_type_lightning_tracker, pt_shape_disk);
part_type_size(part_type_lightning_tracker, 0.4, 0.4, 0, 0);
part_type_scale(part_type_lightning_tracker, 0.3, 0.3);
part_type_speed(part_type_lightning_tracker, 0, 0, 0, 3);
part_type_direction(part_type_lightning_tracker, 0, 360, 0, -25);
part_type_gravity(part_type_lightning_tracker, speed, direction);
part_type_orientation(part_type_lightning_tracker, 0, 0, 0, 0, false);
part_type_colour3(part_type_lightning_tracker, $FF2184, $FFFFFF, $FFFFFF);
part_type_alpha3(part_type_lightning_tracker, 0.471, 0.251, 0.259);
part_type_blend(part_type_lightning_tracker, false);
part_type_life(part_type_lightning_tracker, 9999, 9999);

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
part_type_step(part_type_lightning_tracker, 1, part_type_lightning_trail);

part_emit_lightning = part_emitter_create(ps_lightning);

part_emitter_region(ps_lightning, part_emit_lightning, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(ps_lightning, part_emit_lightning, part_type_lightning_tracker, 4);
