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
	{id: 1, description: "Arcane"},
	{id: 2, description: "Heat"},
	{id: 3, description: "Cold"},
	{id: 4, description: "Water"},
	{id: 5, description: "Air"},
	{id: 6, description: "Earth"},

	{id: 12, description: "Heat+Cold"}, 
	{id: 13, description: "Steam"}
]