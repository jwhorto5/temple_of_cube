function place_powerup() {
	randomize();
	
	instance_create_layer(
		irandom_range(1, room_width / 16) * 16 - 8,
		irandom_range(room_height / 64, room_height / 32) * 16 - 8,
		"Instances",
		powerup);
}