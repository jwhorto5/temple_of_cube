/// @description Insert description here
// You can write your code in this editor

players = instance_number(player);

with (player)
{
	other.player_index[player_id] = id;
}

sprite[0] = placeholder;
//sprite[1] = placeholder;
//sprite[2] = placeholder;
//sprite[3] = placeholder;

gamepads = ds_list_create();

enum ctls
{
	left,
	right,
	up,
	jump,
	jump_pressed,
	action
}