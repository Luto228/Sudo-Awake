/// @description: damage
if (debounce == true) {
	other.hp -= damage;
	debounce = false;
	alarm[0] = 60;
}