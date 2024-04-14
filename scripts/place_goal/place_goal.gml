function place_goal() {
	randomize();
	
	instance_create_layer(
		irandom_range(0, room_width / 16) * 16 - 8,
		irandom_range(0, room_height / 64) * 16 + 8,
		"Instances",
		goal);
}