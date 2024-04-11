/// @description Insert description here
// You can write your code in this editor

//physics variables
hsp = 0;
vsp = 0;
acc = 0.3;
grav = 0.3;
max_speed = 6;
jump_speed = 8;

//powerup variables
max_jumps = 1;
can_break = false;
is_small = false;
expanding = false;
upside_down = false;
has_block = false;

//other variables
jumps = 0;

//get the tilemap
tilemap = layer_tilemap_get_id("foreground");

//objects that have normal collisions
collidable_objects = [ tilemap, player, block, spawner ];