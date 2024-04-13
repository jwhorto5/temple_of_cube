/// @description Insert description here
// You can write your code in this editor

//physics variables
hsp = 0;
vsp = 0;
acc = 0.3;
grav = 0.3;
max_speed = 6;
jump_speed = 8;
min_jump_speed = 4;

//powerup variables
max_jumps = 1;
can_break = false;
is_small = false;
expanding = false;
upside_down = false;
has_block = false;

//other variables
jumps = 0;
jumped = false;

//get the tilemap
tilemap = layer_tilemap_get_id("foreground");

//any object put in this array becomes collidable
collidable_objects = [ tilemap, block, spawner ];

//shader for each player
shaders = [sh_player_1, sh_player_2, sh_player_3, sh_player_4];