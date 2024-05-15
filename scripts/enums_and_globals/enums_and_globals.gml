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

global.elements = [ 
	{id: 0, description: "Void"},
	{id: 1, description: "Arcane", icon: "sArcaneIcon", button: "sArcaneButton"},
	{id: 2, description: "Heat", icon: "sHeatIcon", button: "sHeatButton"},
	{id: 3, description: "Cold", icon: "sColdIcon", button: "sColdButton"},
	{id: 4, description: "Water", icon: "sWaterIcon", button: "sWaterButton"},
	{id: 5, description: "Air", icon: "sAirIcon", button: "sAirButton"},
	{id: 6, description: "Earth", icon: "sEarthIcon", button: "sEartButton"},

	{id: 12, description: "Heat+Cold", obtainable: false}, 
	{id: 13, description: "Steam", obtainable: true}
]