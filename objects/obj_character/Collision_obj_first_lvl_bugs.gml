/// @description: attack
if (sprite_index == spr_character_attack_sword && other.can_be_hit = true) {
	other.hp -= 3;
	other.can_be_hit = false;
	other.alarm[0] = 30;
}