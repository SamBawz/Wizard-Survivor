image_xscale = choose(scale, -scale);
image_yscale = scale;
alarm[0] = 20;

part_smoke = part_type_create();
part_type_shape(part_smoke, pt_shape_square);
part_type_size(part_smoke, 1, 1, -0.03, 0);
part_type_scale(part_smoke, 0.1, 0.1);
part_type_speed(part_smoke, 0.5, 1, 0, 0);
part_type_direction(part_smoke, 75, 105, 0, 0);
part_type_colour3(part_smoke, $676767, $808080, $343434);
part_type_life(part_smoke, 40, 40);

part_emit_smoke = part_emitter_create(global.spell_ps);
part_emitter_region(global.spell_ps, part_emit_smoke, x, x, y+5, y+5, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.spell_ps, part_emit_smoke, part_smoke, 3);