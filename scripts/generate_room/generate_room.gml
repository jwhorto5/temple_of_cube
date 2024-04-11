function generate_room(start_prob, prob_diff, iterations) {
	//start the randomness
	randomize();
	
	//step 1: the scanline technique
	var tilemap = layer_tilemap_get_id("foreground");
	var tile_width = tilemap_get_tile_width(tilemap);
	var tile_height = tilemap_get_tile_height(tilemap);
	
	//50% chance to place a tile at a given tile space
	for (var i = 0; i < room_width / tile_width; i++)
	{
		for (var j = 0; j < room_height / tile_height; j++)
		{
			if (random_range(0,1) < start_prob) tilemap_set(tilemap, 1, i, j);
		}
		if (i < (room_width / tile_width) / 2) start_prob -= prob_diff;
		else start_prob += prob_diff;
	}
	
	//step 2: cutting
	repeat (iterations)
	{
		clean_room(tilemap);
	}
}