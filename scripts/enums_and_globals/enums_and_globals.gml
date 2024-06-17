#macro ANIMATION_FRAMES 120

enum CHARACTER_STATE {
	DAMAGED = 1,
	IDLE = 0,
	MOVING = 2,
	DEAD = 3,
	DASHING = 4,
	KNOCKED = 5
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
	{id: 1, name: "Heat", description: "Create a flamethrower, setting your foes on fire and dealing consistant damage", icon: "sHeatIcon", button: "sHeatButton", obtainable: true},
	{id: 2, name: "Cold", description: "Freeze your enemies with icicles and then shatter them to create chain reactions", icon: "sColdIcon", button: "sColdButton", obtainable: true},
	{id: 3, name: "Water", description: "Block incoming attacks with a bubble shield and then retaliate with a violent 'pop'", icon: "sWaterIcon", button: "sWaterButton", obtainable: true},
	{id: 4, name: "Air", description: "Ride gusts of wind, becoming invulnerable and damaging nearby enemies", icon: "sAirIcon", button: "sAirButton", obtainable: true},
	{id: 5, name: "Earth", description: "Crush your enemies with slow but hard hitting piercing attacks", icon: "sEarthIcon", button: "sEarthButton", obtainable: true},
	{id: 6, name: "Familiar", description: "Obtain a familiar that will occasionally attack enemies - this does not replace an element", icon: "sArcaneIcon", button: "sArcaneButton", obtainable: true},
	{id: 7, name: "Arcane", description: "Add homing to your other spell attacks", icon: "sArcaneIcon", button: "sArcaneButton", obtainable: false},
	

	{id: 12, name: "Cancel", description: "Heat+Cold", obtainable: false}, 
	{id: 13, name: "Steam", description: "Steam", icon: "sSteamIcon", button: "sSteamButton", obtainable: true},
	//{id: 14, name: "Pressure", description: "Heat+Air", obtainable: false},
	{id: 15, name: "Magma", description: "Heat+Earth", icon:"sMagmaIcon", button: "sMagmaButton", obtainable: true},
	{id: 23, name: "Ice", description: "Cold+Water", icon:"sIceIcon", button: "sIceButton", obtainable: true},
	//{id: 24, name: "Vacuum", description: "Cold+Air", obtainable: false},
]

//datastructure maps are used to store key and values together in pairs
//global.elements = ds_map_create()