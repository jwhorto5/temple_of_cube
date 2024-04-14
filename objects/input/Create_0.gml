/// @description Insert description here
// You can write your code in this editor

players = instance_number(player);

with (player)
{
	other.player_index[player_id] = id;
}

sprite[0,0] = amogus_idle;
sprite[0,1] = amogus_walk;
sprite[0,2] = amogus_jump;
sprite[0,3] = amogus_squat;

sprite[1,0] = amogus_idle;
sprite[1,1] = amogus_walk;
sprite[1,2] = amogus_jump;
sprite[1,3] = amogus_squat;

sprite[2,0] = amogus_idle;
sprite[2,1] = amogus_walk;
sprite[2,2] = amogus_jump;
sprite[2,3] = amogus_squat;

sprite[3,0] = amogus_idle;
sprite[3,1] = amogus_walk;
sprite[3,2] = amogus_jump;
sprite[3,3] = amogus_squat;

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