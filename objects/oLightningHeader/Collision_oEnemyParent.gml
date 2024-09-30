if(ds_list_find_index(target_list, other) = -1) {	
	ds_list_add(target_list, other);
	var _nth_enemy = 2;
	//check if next target has been hit before, if so, check for again for new target - up to 10 times
	while( ds_list_find_index(target_list, instance_nth_nearest(x, y, oEnemyParent, _nth_enemy))  = -1  && _nth_enemy < 10) {
		_nth_enemy++;
	}
	var _target = instance_nth_nearest(x, y, oEnemyParent, _nth_enemy);
	if(_target = noone || ds_list_find_index(target_list, _target)) {
		instance_destroy();
	}
	else {
		var _direction = point_direction(x, y, _target.x, _target.y);
		direction = _direction;
		bounces++;
		if(bounces > 3) {instance_destroy();}
	}
}
