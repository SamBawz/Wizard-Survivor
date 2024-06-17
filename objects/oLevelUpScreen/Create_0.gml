animation_playing = false;

selection_bar_pos = {x: display_get_gui_width() / 2, y: 194}
selection_bar_index = 0;
selection_bar_vecs = [
	{x: selection_bar_pos.x - 21 ,y: selection_bar_pos.y},
	{x: selection_bar_pos.x ,y: selection_bar_pos.y},
	{x: selection_bar_pos.x + 21 ,y: selection_bar_pos.y},
]
selection_index = 1; 

upgrade_list = ds_list_create();

//Get the first 6 obtainable elements. These are the basic elements. Get one less if there's too many familiars so players can't get more than 4.
//Arcane is temporarily removed, so right now there's 5 elements
obtained = 1;
if(instance_number(oFamiliar) >= 4) {obtained = 2}
array_foreach(global.elements, function(_element, _index) {
	if(obtained > 6) { exit; }
	else if(_element.obtainable) {
		obtained++;
		ds_list_add(upgrade_list, _element);
	}
});

//Shuffle all upgrades
ds_list_shuffle(upgrade_list);

var _x = 46;
var _card_width = 66;

var _x_interval = -112;

//Add three upgrades to the card
for (var _index = 0; _index < 3; _index += 1) {
	
	var _element_data = ds_list_find_value(upgrade_list, _index);
	var _upgrade = instance_create_layer(display_get_gui_width() / 2 + _x_interval, display_get_gui_height() / 2.5, "Menus", oUpgrade, { element: _element_data});
	
	_x_interval += 112;
}

