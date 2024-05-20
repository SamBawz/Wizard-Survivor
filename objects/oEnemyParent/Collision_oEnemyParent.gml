///@description Push back other enemies

var _direction = point_direction(x, y, other.x, other.y);
x += lengthdir_x(-1, _direction);
y += lengthdir_y(-1, _direction);