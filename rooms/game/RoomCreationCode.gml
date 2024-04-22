var tilemap = layer_tilemap_get_id("foreground");

//show_debug_message(string(global.stage));

//global.stage = irandom_range(0,1);

if (global.stage == 0)
{
	layer_background_sprite(layer_background_get_id("background_1"), bg_sky_1);
	layer_background_sprite(layer_background_get_id("background_2"), bg_sky_2);
	layer_background_sprite(layer_background_get_id("background_3"), bg_sky_3);
	tilemap_tileset(tilemap, ts_cloud);
}
else if (global.stage == 1)
{
	layer_background_sprite(layer_background_get_id("background_1"), nothing);
	layer_background_sprite(layer_background_get_id("background_2"), nothing);
	layer_background_sprite(layer_background_get_id("background_3"), pear_tech);
	tilemap_tileset(tilemap, ts_circuit);
}

layer_background_speed(layer_background_get_id("background_1"), sprite_get_speed(layer_background_get_sprite(layer_background_get_id("background_1"))));
layer_background_speed(layer_background_get_id("background_2"), sprite_get_speed(layer_background_get_sprite(layer_background_get_id("background_2"))));
layer_background_speed(layer_background_get_id("background_3"), sprite_get_speed(layer_background_get_sprite(layer_background_get_id("background_3"))));

generate_room(0.7, 0.02, 3);
place_spawner();
place_powerup();
place_goal();

instance_create_layer(room_width / 2, room_height, "foreground", camera_focus);

clean_room(tilemap);

for (var tile_x = 0; tile_x < room_width / 16; tile_x++)
{
	for (var tile_y = 0; tile_y < room_height / 16; tile_y++)
	{
		if (tilemap_get(tilemap, tile_x, tile_y))
		{
			var tile_num = auto_tile(tilemap, tile_x, tile_y);
			//if (tile_num != 0) show_debug_message(string(tile_num));
			tilemap_set(tilemap, tile_num, tile_x, tile_y);
		}
	}
}