/// @description After death xp
instance_create_layer(x, y, "Instances", oExperience);
//Data structure lists dont clean themselves
ds_list_destroy(debuff_list);
ds_list_destroy(invincibility_list);