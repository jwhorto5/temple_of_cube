/// @description Insert description here
// You can write your code in this editor

//players = instance_number(player);

with (player)
{
	player.player_index[player_id] = id;
}

char_sprites = [0,0,0,0];

char = 
[
	[red_idle, red_walk, red_jump, red_squat, red_taunt, red_shove],
	[blue_idle, blue_walk, blue_jump, blue_squat, blue_taunt, blue_shove],
	[yellow_idle, yellow_walk, yellow_jump, yellow_squat, yellow_taunt, yellow_shove],
	[orange_idle, orange_walk, orange_jump, orange_squat, orange_taunt, orange_shove],
	[green_idle, green_walk, green_jump, green_squat, green_taunt, green_shove],
	[purple_idle, purple_walk, purple_jump, purple_squat, purple_taunt, purple_shove],
	[amogus_idle, amogus_walk_alt, amogus_jump, amogus_squat, amogus_taunt, amogus_shove],
	[bob_idle, bob_walk, bob_jump, bob_squat, bob_taunt, bob_shove],
	[jd_idle, jd_walk, jd_jump, jd_squat, jd_taunt, jd_shove],
	[pear_idle, pear_walk, pear_jump, pear_squat, pear_taunt, pear_shove],
	[randall_idle, randall_walk, randall_jump, randall_squat,  randall_taunt, randall_shove],
	[blob_idle, blob_walk, blob_jump, blob_squat, blob_taunt, blob_shove],
	[death_idle, death_walk, death_jump, death_squat, death_taunt, death_shove],
];

sprite[0,0] = char[0,0];
sprite[0,1] = char[0,1];
sprite[0,2] = char[0,2];
sprite[0,3] = char[0,3];
sprite[0,4] = char[0,4];
sprite[0,5] = char[0,5];

sprite[1,0] = char[0,0];
sprite[1,1] = char[0,1];
sprite[1,2] = char[0,2];
sprite[1,3] = char[0,3];
sprite[1,4] = char[0,4];
sprite[1,5] = char[0,5];

sprite[2,0] = char[0,0];
sprite[2,1] = char[0,1];
sprite[2,2] = char[0,2];
sprite[2,3] = char[0,3];
sprite[2,4] = char[0,4];
sprite[2,5] = char[0,5];

sprite[3,0] = char[0,0];
sprite[3,1] = char[0,1];
sprite[3,2] = char[0,2];
sprite[3,3] = char[0,3];
sprite[3,4] = char[0,4];
sprite[3,5] = char[0,5];

taunt_sounds = [
	snd_generic_laugh,
	snd_generic_laugh,
	snd_generic_laugh,
	snd_generic_laugh,
	snd_generic_laugh,
	snd_generic_laugh,
	snd_amogus_twerk,
	snd_bob_moan,
	snd_milk,
	snd_pear_master,
	snd_awesome_sound,
	snd_blob_yapping,
	snd_death_scream,
];

current_taunt_sound = [
	snd_generic_laugh,
	snd_generic_laugh,
	snd_generic_laugh,
	snd_generic_laugh,
];

gamepads = ds_list_create();

enum ctls
{
	left,
	right,
	up,
	down,
	hor_pressed,
	ver_pressed,
	jump,
	jump_pressed,
	action,
	shove,
}