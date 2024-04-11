/// @description Insert description here
// You can write your code in this editor

randomize();

var tilemap = layer_tilemap_get_id("foreground");

if (place_meeting(x, y-sprite_height, tilemap))
{
	tilemap_set_at_pixel(tilemap, 0, x, y);
	tilemap_set_at_pixel(tilemap, 0, x, y-sprite_height);
}

power_index = irandom(5);
power_index = 1;