/// @description Insert description here
// You can write your code in this editor

var tilemap = layer_tilemap_get_id("foreground");

clear_blocks(tilemap, sprite_width, sprite_height, -1, 1, -1, -1);

for (var i = 0; i <= 3; i++)
{
	var p = instance_create_layer(x,y-sprite_height, "Instances", player);
	variable_instance_set(p, "player_id", i);
}