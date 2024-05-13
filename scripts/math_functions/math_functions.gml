function Distance(_to, _from){
	var _absx = abs(_from.x - _to.x);
	var _absy = abs(_from.y - _to.y);
	var _vec = vec(_absx,_absy );
	return get_length(_vec);
}