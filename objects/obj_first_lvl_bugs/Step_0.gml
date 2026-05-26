#region died
if (hp <= 0){
	instance_destroy();
}
#endregion
#region AI_walk
if (instance_exists(obj_character)) {
	plr_x = obj_character.x;
	plr_y = obj_character.y;
	if (distance_to_object(obj_character) > 5 && distance_to_object(obj_character) < 175 ) {
		mp_potential_step(plr_x, plr_y, spd, obj_first_lvl_wall);	
		image_angle = point_direction(x, y, plr_x, plr_y) - 90;
	} else {
		speed = 0
	}
}
#endregion
#region bugs_attack
if (distance_to_object(obj_character) <= 5 && can_attack == true) {
	obj_character.hp -= damage;
	can_attack = false;
	alarm[1] = 60;
}
#endregion