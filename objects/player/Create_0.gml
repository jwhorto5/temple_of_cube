/// @description Insert description here
// You can write your code in this editor

//physics variables
hsp = 0;
vsp = 0;
acc = 0.2;
grav = 0.1;
max_speed = 4;
jump_speed = 4;

//other variables
jumps = 0;

//get the tilemap
tilemap = layer_tilemap_get_id("foreground");