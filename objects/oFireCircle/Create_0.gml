alive = true;
image_xscale = 0;
image_yscale = 0;
image_alpha = 1;
image_index = 1;
image_speed = 0;

alarm[0] = fire_duration;

hitbox = instance_create_layer(x, y, "instances", oFireHitbox, {image_angle : fire_direction});

//Emitter
ptype1 = part_type_create();
part_type_shape(ptype1, pt_shape_square);
part_type_size(ptype1, 0.01, 0.01, 0.003, 0);
part_type_scale(ptype1, 1, 1);
part_type_speed(ptype1, 2, 2, -0.01, 0);
part_type_direction(ptype1, fire_direction - 10, fire_direction + 10, 0, 0);
part_type_gravity(ptype1, 0, 270);
part_type_orientation(ptype1, 0, 0, 0, 0, false);
part_type_colour3(ptype1, $02B3FF, $113DFF, $000000);
part_type_alpha3(ptype1, 1, 1, 1);
part_type_blend(ptype1, true);
part_type_life(ptype1, 35, 50);

pemit1 = part_emitter_create(global.spell_ps);
part_emitter_region(global.spell_ps, pemit1, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.spell_ps, pemit1, ptype1, 1);

