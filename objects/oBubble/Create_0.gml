base_duration = 100;
alarm[0] = base_duration * strength;
depth = 0;

image_speed = 0;
image_index = 1;

//BubbleBlast
part_type_bubble_blast = part_type_create();
part_type_sprite(part_type_bubble_blast, sBubble, false, true, false)
part_type_size(part_type_bubble_blast, 0, 0, 0.02, 0);
part_type_scale(part_type_bubble_blast, 0.7, 0.7);
part_type_speed(part_type_bubble_blast, 2.5, 4, -0.1, 0);
part_type_direction(part_type_bubble_blast, 0, 360, 0, 0);
part_type_gravity(part_type_bubble_blast, 0, 270);
part_type_orientation(part_type_bubble_blast, 0, 0, 0, 0, true);
part_type_colour3(part_type_bubble_blast, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(part_type_bubble_blast, 0.3, 0.4, 0.5);
part_type_blend(part_type_bubble_blast, false);
part_type_life(part_type_bubble_blast, 40, 50);

part_type_bubble_pop = part_type_create();
part_type_shape(part_type_bubble_pop, pt_shape_square);
part_type_size(part_type_bubble_pop, 0.01, 0.01, 0, 0);
part_type_scale(part_type_bubble_pop, 1, 1);
part_type_speed(part_type_bubble_pop, 0.5, 0.5, -0.03, 0);
part_type_direction(part_type_bubble_pop, 32, 139, 0, 0);
part_type_gravity(part_type_bubble_pop, 0.05, 270);
part_type_orientation(part_type_bubble_pop, 0, 0, 0, 0, true);
part_type_colour3(part_type_bubble_pop, #0054A6, #0054A6, #0054A6);
part_type_alpha3(part_type_bubble_pop, 1, 1, 1);
part_type_blend(part_type_bubble_pop, true);
part_type_life(part_type_bubble_pop, 30, 30);
part_type_death(part_type_bubble_blast, 1, part_type_bubble_pop);

part_emit_bubble = part_emitter_create(global.spell_ps);

function popBubble() {
	part_emitter_region(global.spell_ps, part_emit_bubble, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
	instance_create_layer(x, y, "Instances", oBubblePop, { strength: strength });
	part_emitter_burst(global.spell_ps, part_emit_bubble, part_type_bubble_blast, 100);
	instance_destroy();
}



