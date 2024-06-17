alarm[0] = 50;

y_offset = 12;
strength = 1;

//Tornado emitter
var _part_type_tornado = part_type_create();
part_type_shape(_part_type_tornado, pt_shape_square);
part_type_size(_part_type_tornado, 0.3, 0.3, 0, 0.2);
part_type_scale(_part_type_tornado, 0.3, 0.3);
part_type_speed(_part_type_tornado, 2, 3, 0, 0);
part_type_direction(_part_type_tornado, 70, 110, 0, 70);
part_type_gravity(_part_type_tornado, 0.02, 90);
part_type_orientation(_part_type_tornado, 0, 0, 0, 0, false);
part_type_colour3(_part_type_tornado, $4C4C4C, $343434, $676767);
part_type_alpha3(_part_type_tornado, 1, 1, 1);
part_type_blend(_part_type_tornado, false);
part_type_life(_part_type_tornado, 40, 40);

part_emit_tornado = part_emitter_create(global.moving_spell_ps);
part_emitter_stream(global.moving_spell_ps, part_emit_tornado, _part_type_tornado, 1);
