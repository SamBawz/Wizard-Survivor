if(IsObjectPaused()) {exit;}

part_emitter_region(global.spell_ps, part_emit_lightning, x, x, y, y, ps_shape_rectangle, ps_distr_linear);

var _distance = 2; //random_range(0, 20);
x_offset = lengthdir_x(_distance, rand_direction);
y_offset = lengthdir_y(_distance, rand_direction);
x+=x_offset + lengthdir_x(2, direction);
y+=y_offset + lengthdir_y(2, direction);