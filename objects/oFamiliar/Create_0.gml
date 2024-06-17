image_speed = 0;
cooldown = false;

size_curve = animcurve_get_channel(acGrowthBeforeFiringFamiliars, "size");
percent = 0;
animation_playing = false;
flash = 0;

starting_orbit = instance_number(oFamiliar) * 90;
orbit = 0;
function resetOrbit() {
	orbit = starting_orbit;
}
resetOrbit();
