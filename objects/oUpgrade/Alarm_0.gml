/// @description Process click event and destroy upgrade screen

//The game controller paused in the first place so it still holds all saved variables for unpausing
//Do this before potentially creating a new familiar object
with(oGameController) {
	UnpauseGame();
}
			
//If a familiar was selected
if(element.id = 6) {
	var _count = instance_number(oFamiliar);
	//Space familiars every 90 degrees
	instance_create_layer(x, y, "Instances", oFamiliar);
	with(oFamiliar) {resetOrbit()};
	with(oGameController) {
		announce("You obtained a familiar!");
	}	
}
			
//Else if there is a valid combination and its obtainable, set it
else if(CheckCombinations(element.id, global.obtained_elements[oLevelUpScreen.selection_index]) != false && IsEleObtainable(CheckCombinations(element.id, global.obtained_elements[oLevelUpScreen.selection_index]))) {
	var _combination =  CheckCombinations(element.id, global.obtained_elements[oLevelUpScreen.selection_index]);
	global.obtained_elements[oLevelUpScreen.selection_index] =_combination;
	with(oGameController) {
		announce("You obtained " + string(getElementName(_combination)) + "!");
	}	
}

//Otherwise set this element
else {
	global.obtained_elements[oLevelUpScreen.selection_index] = element.id;
	with(oGameController) {
		announce("You obtained " + string(other.element.name) + "!");
	}	
}
			
with(oLevelUpScreen) {
	instance_destroy();
}