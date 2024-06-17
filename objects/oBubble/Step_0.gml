if(IsObjectPaused() || !instance_exists(oPlayer)) {exit;}

var _t = current_time * 0.01;
x = oPlayer.x;
y = oPlayer.y + sin(_t);

