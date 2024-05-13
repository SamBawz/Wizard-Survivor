//This script is run by the oPlayer when created
function GameStart(){
	if (!layer_exists("Controllers")) {
		layer_create(0, "Controllers");
	}
	
	//Create all relevant controllers
	if(!instance_exists(oGameController)) {
		instance_create_layer(0,0, "Controllers", oGameController);
	}
}