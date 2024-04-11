/// @description Insert description here
// You can write your code in this editor

var tilemap = layer_tilemap_get_id("foreground");

if (place_meeting(x, y-sprite_height, tilemap))
{
	tilemap_set_at_pixel(tilemap, 0, x, y);
	tilemap_set_at_pixel(tilemap, 0, x, y-sprite_height);
}

var p = instance_create_layer(x,y-sprite_height, "Instances", player);
variable_instance_set(p, "player_id", 0);