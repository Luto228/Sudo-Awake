#region walk
var _right = keyboard_check(ord("D"));
var _left  = keyboard_check(ord("A"));
var _down  = keyboard_check(ord("S"));
var _up    = keyboard_check(ord("W"));

move_x = _right - _left;
move_y = _down - _up;
var _can_move = (!variable_global_exists("terminal_active") || global.terminal_active != true);

if (_can_move) {
    
    repeat(spd) {
        if (!place_meeting(x + move_x, y, obj_first_lvl_wall)) {
            x += move_x;
        } else {
            break;
        }
    }

    repeat(spd) {
        if (!place_meeting(x, y + move_y, obj_first_lvl_wall)) {
            y += move_y;
        } else {
            break;
        }
    }
}

if (move_x != 0) {
    image_xscale = saved_width * move_x; 
}
#endregion
#region destroy()
if (hp <= 0) {
    instance_destroy();
}
#endregion