// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function auto_tile(tilemap, tile_x, tile_y) {
	var tile, iw, w_left, w_right, w_up, w_down, w_upleft, w_downleft, w_upright, w_downright;
	iw = 1;
	w_upleft = (tilemap_get(tilemap, tile_x-iw, tile_y-iw) && tilemap_get(tilemap, tile_x, tile_y-iw) && tilemap_get(tilemap,  tile_x-iw, tile_y)) ? 1 : 0;
	w_up = tilemap_get(tilemap, tile_x, tile_y-iw) ? 2 : 0;
	w_upright = tilemap_get(tilemap, tile_x+iw, tile_y-iw) && tilemap_get(tilemap, tile_x, tile_y-iw) && tilemap_get(tilemap, tile_x+iw, tile_y) ? 4 : 0;
	w_left = tilemap_get(tilemap,  tile_x-iw, tile_y) ? 8 : 0;
	w_right = tilemap_get(tilemap, tile_x+iw, tile_y) ? 16 : 0;
	w_downleft = tilemap_get(tilemap, tile_x-iw, tile_y+iw) && tilemap_get(tilemap, tile_x, tile_y+iw) && tilemap_get(tilemap,  tile_x-iw, tile_y) ? 32 : 0;
	w_down = tilemap_get(tilemap, tile_x, tile_y+iw) ? 64 : 0;
	w_downright = tilemap_get(tilemap, tile_x+iw, tile_y+iw) && tilemap_get(tilemap, tile_x, tile_y+iw) && tilemap_get(tilemap, tile_x+iw, tile_y) ? 128 : 0;
	
	//if ((tile_x - iw) * 16 < 0) {w_left = 1; w_upleft = 1; w_downleft = 1};
	//if ((tile_x + iw) * 16 > room_width) {w_right = 1; w_upright = 1; w_downright = 1};
	//if ((tile_y - iw) * 16 < 0) {w_up = 1; w_upright= 1; w_upleft = 1};
	//if ((tile_y + iw) * 16 > room_width) {w_down = 1; w_downright = 1; w_downleft = 1};
	
	tile = w_upleft + w_up + w_upright + w_left + w_right + w_downleft + w_down + w_downright;
	
	tile_values = [ 0, 2, 8, 10, 11, 16, 18, 22, 24, 26, 27, 30, 31, 64, 66, 72, 74, 75, 80, 82, 86, 88, 90, 91, 94, 95, 104, 106, 107, 120, 122, 123, 126, 127, 208, 210, 214, 216, 218, 219, 222, 223, 248, 250, 251, 254, 255]
	
	for (var i = 0; i < array_length(tile_values); i++)
	{
		if (tile = tile_values[i]) return i;
	}
	
	return tile;
}