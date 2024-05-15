/// @description Insert description here
// You can write your code in this editor

with(other) {
	instance_destroy();
}

switch(level) {
	case 0:
	experience+=20;
	break;
	case 1:
	experience+=10;
	break;
	default:
	experience++;
	break;
}

if(experience >= 100) {
	experience = 0;
	level++;
}



