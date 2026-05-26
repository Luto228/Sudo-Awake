#region walk
var _right = keyboard_check(ord("D"));
var _left  = keyboard_check(ord("A"));
var _down  = keyboard_check(ord("S"));
var _up    = keyboard_check(ord("W"));

move_x = _right - _left;
move_y = _down - _up;

if (!place_meeting(x + move_x * spd, y, obj_first_lvl_wall) && (!variable_global_exists("terminal_active") || global.terminal_active != true)) {
	x = x + move_x * spd;
}

if (!place_meeting(x, y + move_y * spd, obj_first_lvl_wall) && (!variable_global_exists("terminal_active") || global.terminal_active != true)) {
	y = y + move_y * spd;
}
if (move_x != 0) {
    image_xscale = saved_width * move_x; 
}
#endregion
#region destroy()
if (hp <= 0) {
	instance_destroy()
}
#endregion