event_inherited();
damage_mod = 1.2;
cooldown = false;

starting_speed = 0.5;
speed = starting_speed;

size_curve = animcurve_get_channel(acGrowthBeforeFiringEnemies, "size");
percent = 0;
animation_playing = false;

//with(shadow) {instance_destroy();}
with(shadow) {shadow_offset_y = 3}