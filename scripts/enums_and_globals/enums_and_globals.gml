enum CHARACTER_STATE {
	DAMAGED = 1,
	IDLE = 0,
	MOVING = 2,
	DEAD = 3
}

/*
enum ELEMENTS {
	ARCANE = 0,
	HEAT = 1,
	COLD = 2,
	WATER = 3,
	AIR = 4,
	EARTH = 5,
}
*/

selection_bar_vecs = [];

//Array of element structures
global.elements = [ 
	{id: 0, name: "Void", description: "Void", button: "sIconVoid",  obtainable: false},
	{id: 1, name: "Arcane", description: "Add homing to your other spell attacks", icon: "sArcaneIcon", button: "sArcaneButton", obtainable: true},
	{id: 2, name: "Heat", description: "Set your foes on fire and deal consistant damage", icon: "sHeatIcon", button: "sHeatButton", obtainable: true},
	{id: 3, name: "Cold", description: "Slow your enemies down or freeze them in their tracks", icon: "sColdIcon", button: "sColdButton", obtainable: true},
	{id: 4, name: "Water", description: "Wet your enemies, making them more prone to other spell attacks", icon: "sWaterIcon", button: "sWaterButton", obtainable: true},
	{id: 5, name: "Air", description: "Ride gusts of wind, knocking back nearby enemies and improving your mobility", icon: "sAirIcon", button: "sAirButton", obtainable: true},
	{id: 6, name: "Earth", description: "Crush your enemies with slow but hard hitting attacks", icon: "sEarthIcon", button: "sEarthButton", obtainable: true},
	

	{id: 23, name: "Heat+Cold", description: "Heat+Cold", obtainable: false}, 
	{id: 24, name: "Steam", description: "Steam", icon: "sSteamIcon", button: "sSteamButton", obtainable: true}
]

//datastructure maps are used to store key and values together in pairs
//global.elements = ds_map_create()