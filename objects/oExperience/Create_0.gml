magnetism = 40;

var _shadow = instance_create_layer(x, y, "Shadows", oShadow);
_shadow.image_yscale = 0.3;
_shadow.image_xscale = 0.3;
_shadow.shadow_offset_y = 2;
_shadow.owner_object = self;