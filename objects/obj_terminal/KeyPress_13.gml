/// @description: not now
if (global.terminal_active == true) {
	var _take_str = terminal_str;
	keyboard_string = "";
	terminal_str = "";
	global.terminal_active = false;
var _trim_take_str = string_trim(string_lower(_take_str));
var _find_colon = string_pos(":", _trim_take_str);
var _main_part = string_trim(string_copy(_trim_take_str, 1, _find_colon-1));
var _after_main = string_trim(string_copy(_trim_take_str, _find_colon +1, 100));

if (_find_colon != 0) {
	if _main_part == "me" {
		var _me = obj_character;
		var _me_action = string_trim(string_copy(_trim_take_str, _find_colon+1, 100)); 
		var _action_count = string_pos(" ", _me_action);
		var _final_action = string_copy(_me_action, 1, _action_count - 1);
		var _final_count = string_copy(_me_action, _action_count +1, 100);
		if (_final_action == "speed") {
			if (string_digits(_final_count) == _final_count && _final_count != "") {
				if real(_final_count) <= 100 {
					_me.spd = real(_final_count);
				} else {
					_me.spd = 100;
				}
			} else {
				show_message("Error: write number, not string!");
			}
		} else if (_final_action == "health") {
			if (string_digits(_final_count) == _final_count && _final_count != "") {
				if real(_final_count) <= 100 {
					_me.hp = real(_final_count);
				} else {
					_me.hp = 100
				}
			} else {
				show_message("Error: write number, not string!");
			}
		}
	} else if _main_part == "evil" {
		var _evil = obj_first_lvl_bugs;
	} else if _main_part == "bridge" {
		var _bridge = obj_bridge;
		var _plr_x = obj_character.x;
		var _plr_y = obj_character.y;
		var _space_action = string_pos(" ", _after_main);
		if (_space_action != 0) {
			var _bridge_action = string_trim(string_copy(_after_main, 1, _space_action - 1));
			if (_bridge_action == "create") {
				var _bridge_coord = string_trim(string_copy(_after_main, _space_action+1, 100));
				var _bridge_x_y = string_pos(",", _bridge_coord);
				if (_bridge_x_y != 0) {
					var _bridge_x = string_trim(string_copy(_bridge_coord, 1, _bridge_x_y - 1));
					var _bridge_y = string_trim(string_copy(_bridge_coord, _bridge_x_y + 1, 100));
					var _x_coord = string_digits(_bridge_x);
					var _y_coord = string_digits(_bridge_y);
					var _multiple_x = string_char_at(_bridge_x, 1);
					var _multiple_y = string_char_at(_bridge_y, 1);
					var _final_multiple_x = (_multiple_x == "-") ? -1: 1;
					var _final_multiple_y = (_multiple_y == "-") ? -1: 1;
					if (_x_coord != "" && _y_coord != "") {
						var _final_bridge_coord_x = real(_x_coord) * _final_multiple_x;
						var _final_bridge_coord_y = real(_y_coord) * _final_multiple_y;
						var _bridge_spawn_x = _plr_x + _final_bridge_coord_x;
						var _bridge_spawn_y = _plr_y + _final_bridge_coord_y;
						instance_create_depth(_bridge_spawn_x, _bridge_spawn_y, bridge_depth, _bridge);
					}
				} else {
					instance_create_depth(_plr_x, _plr_y, bridge_depth, obj_bridge);
				}
			}
		}  else {
				if (_after_main == "create") {
					instance_create_depth(_plr_x, _plr_y, bridge_depth, obj_bridge)
				}
		}
	}
}
}
