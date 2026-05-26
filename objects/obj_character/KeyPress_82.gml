/// @description: attack anim 
if (debounce == true && (!variable_global_exists("terminal_active") || global.terminal_active != true)) {
	debounce = false;
	sprite_index = spr_character_attack_sword;
	alarm[0] = 30;
}