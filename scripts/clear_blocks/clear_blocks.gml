function clear_blocks(tilemap, spr_width, spr_height, left, right, top, bottom) {
	for (var i = left; i <= right; i++)
	{
		for (var j = top; j <= bottom; j++)
		{
			tilemap_set_at_pixel(tilemap, 0, x + i * spr_width, y - j * spr_height);
		}
	}
}