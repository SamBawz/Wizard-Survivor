depth = 0;

mouse_over = false;
is_clicked = false;

//Compare this element to all global.obtained_elemements
//Then draw relevant sprites on selection_bar_vecs
interaction_preview_sprites = [ "", "", ""]; 
array_foreach(global.obtained_elements, function(_ele, _i){
	//Empty slot
	if(_ele == 0) {
		interaction_preview_sprites[_i] = "";
	}
	//If combination is present
	else if(CheckCombinations(element.id, _ele) != false && IsEleObtainable(CheckCombinations(element.id, _ele))) {
		
		interaction_preview_sprites[_i] = "sQuestionmark";
	}
	//If overwriting element
	else {
		interaction_preview_sprites[_i] = "sRedCross";
	}
});