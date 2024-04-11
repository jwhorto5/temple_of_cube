// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_room() {
	//start the randomness
	randomize();
	
	//step 1: the scanline technique
	var tilemap = layer_tilemap_get_id("foreground");
	var tile_width = tilemap_get_tile_width(tilemap);
	
	//50% chance to place a tile at a given tile space
	for (var i = 0; i < room_width / tile_width; i++)
	{
		for (var j = 0; j < room_width / tile_width; j ++)
		{
			if (random_range(0,1) < 0.5) tilemap_set(tilemap, 1, i, j);
		}
	}
	
	//step 2: 
}