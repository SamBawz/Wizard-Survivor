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
	{id: 1, name: "Heat", description: "Set your foes on fire and deal consistant damage", icon: "sHeatIcon", button: "sHeatButton", obtainable: true},
	{id: 2, name: "Cold", description: "Slow your enemies down or freeze them in their tracks", icon: "sColdIcon", button: "sColdButton", obtainable: true},
	{id: 3, name: "Water", description: "Wet your enemies, making them more prone to other spell attacks", icon: "sWaterIcon", button: "sWaterButton", obtainable: true},
	{id: 4, name: "Air", description: "Ride gusts of wind, knocking back nearby enemies and improving your mobility", icon: "sAirIcon", button: "sAirButton", obtainable: true},
	{id: 5, name: "Earth", description: "Crush your enemies with slow but hard hitting attacks", icon: "sEarthIcon", button: "sEarthButton", obtainable: true},
	{id: 6, name: "Arcane", description: "Add homing to your other spell attacks", icon: "sArcaneIcon", button: "sArcaneButton", obtainable: false},
	

	//I should not have to define spells as cancel, if I don't create a spell in PlayerCast it will automatically cancel
	{id: 12, name: "Cancel", description: "Heat+Cold", obtainable: false}, 
	{id: 13, name: "Steam", description: "Steam", icon: "sSteamIcon", button: "sSteamButton", obtainable: true},
	{id: 14, name: "Pressure", description: "Heat+Air", obtainable: false},
	{id: 15, name: "Magma", description: "Heat+Earth", obtainable: false},
	{id: 23, name: "Ice", description: "Cold+Water", obtainable: false},
	{id: 24, name: "Vacuum", description: "Cold+Air", obtainable: false},
]

//datastructure maps are used to store key and values together in pairs
//global.elements = ds_map_create()