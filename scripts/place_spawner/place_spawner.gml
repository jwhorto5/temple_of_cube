function place_spawner() {
	randomize();
	
	instance_create_layer(
		irandom_range(3, (room_width / 16) - 2) * 16 - 8,
		irandom_range(room_height / 24, room_height / 16) * 16 - 8,
		"Instances",
		spawner);
}