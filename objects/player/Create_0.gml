//physics variables

hsp = 0;
vsp = 0;
acc = 0.5;
dec = 0.3;
grav = 0.3;
max_speed = 3;
jump_speed = 8;
min_jump_speed = 4;
shove_speed = 4;

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
just_collided = true;
grounded = true;
base_scale = 1;

//shader
pixel_w = shader_get_uniform(sh_player_1, "pixelW");
pixel_h = shader_get_uniform(sh_player_1, "pixelH");
texel_w = texture_get_texel_width(sprite_get_texture(sprite_index, image_index));
texel_h = texture_get_texel_height(sprite_get_texture(sprite_index, image_index));

//get the tilemap
tilemap = layer_tilemap_get_id("foreground");

//any object put in this array becomes collidable
collidable_objects = [ tilemap, block, spawner ];

sprite_index = input.sprite[player_id, current_spr];
looping_taunts = [randall_taunt, bob_taunt];

alarm[3] = 20;