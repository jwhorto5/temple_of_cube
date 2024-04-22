/// @description Insert description here
// You can write your code in this editor

var tilemap = layer_tilemap_get_id("foreground");

clear_blocks(tilemap, 16, 16, -1, 1, 0, 2);

for (var j = 0; j < global.players; j++)
{
	var p = instance_create_layer(x,y-sprite_height, "Instances", player);
	variable_instance_set(p, "player_id", j);
	show_debug_message(string(p.x));
}

image_speed = 0;