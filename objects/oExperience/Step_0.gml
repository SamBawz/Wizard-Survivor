if(global.paused) {
	exit;
}

depth = -y;
if(instance_exists(oPlayer)) {
	var _distance = distance_to_object(oPlayer);
	if(_distance < magnetism) {
		//var _pos = vec(x, y);
		//var _pPos = vec(global._player.x,global._player.y);
		
	
		//var _dir = get_direction(_pos,_pPos);
		
			var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
			show_debug_message(_dir)
			direction = _dir;
			speed =  (magnetism-_distance)*0.1;

		//x += _dir.x * (magnetism-_distance)*0.5;
		//y += _dir.y* (magnetism-_distance)*0.5;
	}
}
