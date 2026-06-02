function scr_command_me(_plr, _action, _count){
	var _count_digits = string_digits(_count);
	if (_count_digits == "") {
		exit;
	}
	_count = real(_count);
	if(_count > 100) {
		_count = 100;
	}
	if (_count <= 0) {
		_count = 1;
	}
	switch _action {
		case "health":
		case "hp":
			_plr.hp = _count
			break;
		case "speed":
		case "spd":
			_plr.spd = _count;
			break;
	}
}