var key_restart = keyboard_check_pressed(ord("R"));
var key_quit = keyboard_check_pressed(vk_enter);
var key_fullscreen = keyboard_check_pressed(vk_shift);

//debugging
if (key_quit) game_end();
if (key_restart) room_restart();
if (key_fullscreen) window_set_fullscreen(!window_get_fullscreen());

//track highest player
var highest_y = room_height;

if (instance_number(player) > 0)
{
	with (player)
	{
		if (self.y < highest_y) highest_y = y;
		camera_focus.y = highest_y;
	}
}