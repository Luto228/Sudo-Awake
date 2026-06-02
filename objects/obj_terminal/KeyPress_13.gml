/// @description: not now
if (global.terminal_active == true) {
	var _take_str = terminal_str;
	keyboard_string = "";
	terminal_str = "";
	global.terminal_active = false;
var _trim_take_str = string_trim(string_lower(_take_str));
var _main_split = string_split(_trim_take_str, ":");
var _limit = 100;

if (array_length(_main_split) == 2) {
	var _plr = obj_character;
	if _main_split[0] == "me" {
		var _me_action_split = string_split(string_trim(_main_split[1]), " ");
		if (array_length(_me_action_split) != 2) {
			exit;
		}
		var _me_action = _me_action_split[0];
		var _me_action_count = _me_action_split[1];
		scr_command_me(_plr, _me_action, _me_action_count);
	} else if (string_starts_with(_main_split[0], "evil")) {
		
		var _evil_where = string_split(_main_split[0], " ");
		if (array_length(_evil_where) == 2) {
			_evil_where = _evil_where[1];
		}
		switch _evil_where {
			case "near":
			var _evil = instance_nearest(_plr.x, _plr.y, obj_enemy_parent);
			var _distance = point_distance(_plr.x, _plr.y, _evil.x, _evil.y);
			if (_distance > 150) {
				exit;
			}
			var _evil_after_main = string_split(string_trim(_main_split[1]), " ");
			if (array_length(_evil_after_main) == 1 && _evil_after_main[0] == "kill") {
				_evil.hp = 0;
				exit;
			}
			if (array_length(_evil_after_main) != 2) {
				exit;
			}
			var _evil_action = _evil_after_main[0];
			var _evil_action_count = string_digits(_evil_after_main[1]);
			if (_evil_action_count != "") {
				_evil_action_count = real(_evil_action_count)
			}
			if (_evil_action_count > 100) {
				_evil_action_count = 100;
			} else if (_evil_action_count <= 0) {
				_evil_action_count = 1;
			}
			switch _evil_action {
				case "health":
				case "hp":
					_evil.hp = _evil_action_count;
					break;
				case "speed":
				case "spd":
				case "sp":
					_evil.spd = _evil_action_count;
					break;
			}
			break;
		}
	} else if (_main_split[0] == "bridge") {
		
		
		var _bridge = obj_bridge;
		var _bridge_split = string_split(string_trim(_main_split[1]), " ");
		if (array_length(_bridge_split) == 1 && _bridge_split[0] == "create") {
			instance_create_depth(_plr.x, _plr.y, -1, obj_bridge);
			exit;
		} else if (array_length(_bridge_split) > 2){
			exit;
		}
		
		var _bridge_what = _bridge_split[0];
		switch _bridge_what {
			case "create":
				var _bridge_where = string_trim(_bridge_split[1]);
				var _bridge_coords = string_split(_bridge_where, ",");
				if (array_length(_bridge_coords) != 2) {
					exit;
				}
				try {
					var _bridge_x = real(_bridge_coords[0]);
					var _bridge_y = real(_bridge_coords[1]);
					instance_create_depth(_plr.x + _bridge_x, _plr.y + _bridge_y, -1, _bridge);
				} 
				catch (_exception) {
					exit;
				}
				break;
		}
	}
}
}