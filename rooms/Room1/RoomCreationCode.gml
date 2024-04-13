var tilemap = layer_tilemap_get_id("foreground");

generate_room(0.7, 0.02, 3);
place_spawner();
place_powerup();
place_goal();
clean_room(tilemap);