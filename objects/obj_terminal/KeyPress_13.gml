/// @description: not now
if (global.terminal_active == true) {
	var _take_str = terminal_str;
	keyboard_string = "";
	terminal_str = "";
	global.terminal_active = false;
var _trim_take_str = string_trim(string_lower(_take_str));
var _find_colon = string_pos(":", _trim_take_str);
if (_find_colon != 0) {
	var _main_part = string_copy(_trim_take_str, 1, _find_colon-1);
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
					_me.spd = 100
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
	}
}
}