if(IsObjectPaused()) {exit;}

var _distance = 40;
var _middlepoint = {x: oPlayer.x, y: oPlayer.y};
orbit += 1;
if(orbit > 360) { orbit = 0 }

x = _middlepoint.x + lengthdir_x(_distance, orbit);
y = _middlepoint.y + lengthdir_y(_distance, orbit);
