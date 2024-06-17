/// @description After death xp and frozen shatter
instance_create_layer(x, y, "Instances", oExperience);
//Data structure lists dont clean themselves
ds_list_destroy(debuff_list);
ds_list_destroy(invincibility_list);

if(frozen) {
	for(var _i = 0; _i < 7; _i++) {
		//Make them a lil stronger too
		var _Snowball = instance_create_layer(x, y, "Instances", oSnowball, { strength: 1.3 });
		with (_Snowball) {
			direction = random_range(0, 360);
		}
	}
}