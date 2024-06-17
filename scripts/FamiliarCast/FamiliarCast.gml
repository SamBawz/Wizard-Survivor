function FamiliarCast(_target_x, _target_y){
	_strength = 0.5;
	var _choices = choose(1, 2);
	var _angle = point_direction(x, y, _target_x, _target_y);
	if (point_distance(x, y, _target_x, _target_y) <= 60) { _choices = choose(1, 2, 3); }
	switch (_choices) {
	
		//Cold
		case 1:
		var _Snowball = instance_create_layer(x, y, "Instances", oSnowball);
		with (_Snowball) {
			direction = _angle;
		}
		break;
		
		//Earth
		case 2:
		var _boulder = instance_create_layer(x, y, "Instances", oBoulder, { strength: 0.3 });
		with (_boulder) { direction = _angle; }
		break;
		
		//Fire
		case 3:
		var _fire_circle = instance_create_layer(x, y, "Instances", oFireCircle, {fire_direction : _angle, fire_duration: 1 * 50 });
		break;
	
		default:
		break;
	}
}