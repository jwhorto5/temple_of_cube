var tilemap = layer_tilemap_get_id("Tiles_1");

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