var tilemap = layer_tilemap_get_id("foreground");

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
			if (tile_num != 0) show_debug_message(string(tile_num));
			tilemap_set(tilemap, tile_num, tile_x, tile_y);
		}
	}
}