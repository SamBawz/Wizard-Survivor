x_scale_target = 1.5;
y_scale_target = 1.5;
image_xscale = 0;
image_yscale = 0;

despawn = false;
alarm[0] = 60 * strength;

part_burning = part_type_create();
part_type_shape(part_burning, pt_shape_square);
part_type_size(part_burning, 0, 0, 0.02, 0);
part_type_scale(part_burning, 0.1, 0.1);
part_type_speed(part_burning, 0.1, 0.3, 0, 0);
part_type_direction(part_burning, 80, 100, 0, 0);
part_type_colour3(part_burning, $00FAFF, $3D81FF, $4D4D4D);
part_type_alpha3(part_burning, 0.9, 0.9, 0.9);
part_type_blend(part_burning, false);
part_type_life(part_burning, 20, 20);
part_emit_burning = part_emitter_create(global.spell_ps);
part_emitter_stream(global.spell_ps, part_emit_burning, part_burning, 3);
