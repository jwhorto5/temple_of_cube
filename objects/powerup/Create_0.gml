/// @description Insert description here
// You can write your code in this editor

randomize();

var tilemap = layer_tilemap_get_id("foreground");

clear_blocks(tilemap, sprite_width, sprite_height, -1, 1, -1, 1);

power_index = irandom(5);