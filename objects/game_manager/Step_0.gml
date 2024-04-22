var key_restart = keyboard_check_pressed(ord("R"));
var key_quit = keyboard_check_pressed(vk_enter);
var key_fullscreen = keyboard_check_pressed(vk_shift);
var key_menu = keyboard_check_pressed(vk_escape);

//debugging
if (key_quit) game_end();
if (key_menu) room_goto(main_menu);
if (key_restart) room_restart();
if (key_fullscreen) window_set_fullscreen(!window_get_fullscreen());

//track highest player
var highest_y = room_height;

if (instance_exists(camera_focus)) {
	if (instance_number(player) > 0)
	{
		with (player)
		{
			if (self.y < highest_y) highest_y = y;
		}
	}
	camera_focus.y = lerp(camera_focus.y, highest_y, 0.1);
}

if (room == game)
{
	if (instance_number(player) <= 0) room_restart();
}