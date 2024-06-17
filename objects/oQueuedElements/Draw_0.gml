floating_icon_vec = {x: oPlayer.x - 16, y: oPlayer.y - 15};
array_foreach(queued_elements, function(_element, _i) {
	floating_icon_vec.x += 8;
	queued_element = _element;
	array_foreach(global.elements, function(_element) {
		if(queued_element = _element.id) {
			draw_sprite(asset_get_index(_element.icon), 0, floating_icon_vec.x, floating_icon_vec.y);
		}
	});
});