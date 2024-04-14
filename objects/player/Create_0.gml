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
layer_speed = 0;
dir = 1;
current_spr = 0;
collided = true;
base_scale = 1;

//get the tilemap
tilemap = layer_tilemap_get_id("foreground");

//any object put in this array becomes collidable
collidable_objects = [ tilemap, block, spawner ];