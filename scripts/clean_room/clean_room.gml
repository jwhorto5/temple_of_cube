// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clean_room(tilemap) {
	var tile_width = tilemap_get_tile_width(tilemap);
	var tile_height = tilemap_get_tile_height(tilemap);
	for (var tile_x = 0; tile_x < room_width / tile_width; tile_x++)
	{
		for (var tile_y = 0; tile_y < room_height / tile_height; tile_y++)
		{
			if ((!tilemap_get(tilemap, tile_x - 1, tile_y)
			&& !tilemap_get(tilemap, tile_x + 1, tile_y))
			|| (!tilemap_get(tilemap, tile_x, tile_y - 1)
			&& !tilemap_get(tilemap, tile_x, tile_y + 1)))
			{
				tilemap_set(tilemap, 0, tile_x, tile_y);
			}
		}
	}
	
	//code below is too well made
	
	//for (var _x = -1; _x <= 1; _x++)
	//{
	//	for (var _y = -1; _y <= 1; _y++)
	//	{
	//		if ((_x == 0 && _y == 0)) continue;
	//		if (tilemap_get(tilemap, tile_x + _x, tile_y + _y) == 1)
	//			num_adjacent_tiles++;
	//	}
	//}
	
	//if (num_adjacent_tiles <= 3) tilemap_set(tilemap, 0, tile_x, tile_y);
}