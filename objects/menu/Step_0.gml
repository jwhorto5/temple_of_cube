function start_game() {
	room_goto(game);
}

strs =
[
	["Start Game", "Customize", "Options", "Quit"],
	["Players: " + string(global.players), "Level: ", "Powerups: ", "Exit"],
	["Volume (N/A): " + string(round(audio_sound_get_gain(bgm_nice)*100)) + "%", "Fullscreen: " + yes_no_string(window_get_fullscreen()), "V-sync: " + yes_no_string(vsync), "Exit"],
	["", "", "Start", "Back"],
];

if (keyboard_check_pressed(vk_enter)) game_end();

//move cursor and keep it valid
current_selection += global.controls[0, ctls.ver_pressed];
current_selection %= array_length(strs[0]);
if (current_selection < 0) current_selection = array_length(strs[0]) - 1;

//keep track of left and right inputs
var lr_keys = [global.controls[0, ctls.hor_pressed],
global.controls[1, ctls.hor_pressed],
global.controls[2, ctls.hor_pressed],
global.controls[3, ctls.hor_pressed]
];

var press = global.controls[0, ctls.jump_pressed];

//selection
switch (current_menu)
{
	case 0:
	{
		switch (current_selection)
		{
			case 0:
			{
				if (press)
				{
					current_menu = 3;
					current_selection = 1;
				}
				break;
			}
			case 1: if (press) current_menu = 1; break;
			case 2: if (press) current_menu = 2; break;
			case 3: if (press) game_end(); break;
		}
		break;
	}
	case 1:
	{
		switch (current_selection)
		{
			case 0:
			{
				global.players += lr_keys[0];
				global.players = clamp(global.players, 2, 4);
				break;
			}
			case 1: break;
			case 2: break;
			case 3: if (press) current_menu = 0; break;
		}
		break;
	}
	case 2:
	{
		switch (current_selection)
		{
			case 0:
			{
				var a = audio_sound_get_gain(bgm_nice);
				audio_sound_gain(bgm_nice, a + (lr_keys[0] * 0.1), 0);
				if (audio_sound_get_gain(bgm_nice) >= 1) audio_sound_gain(bgm_nice, 1, 0);
				break;
			}
			case 1: if (press || lr_keys[0] != 0) window_set_fullscreen(!window_get_fullscreen()); break;
			case 2:
			if (press || lr_keys[0] != 0) {
				vsync = !vsync;
				display_reset(display_aa, vsync);
				break;
			}
			case 3: if (press) current_menu = 0; break;
		}
		break;
	}
	case 3:
	{
		switch (current_selection)
		{
			case 0: current_selection = 2; break;
			case 1: current_selection = 3; break;
			case 2: if (press) start_game(); break;
			case 3: if (press) current_menu = 0; break;
		}
		
		for (var i = 0; i < array_length(current_spr); i++)
		{
			current_spr[i] += lr_keys[i];
			current_spr[i] %= array_length(input.char);
			if (current_spr[i] < 0) current_spr[i] = array_length(input.char) - 1;
			
			input.current_taunt_sound[i] = input.taunt_sounds[current_spr[i]];
			
			for (var j = 0; j < array_length(input.char[0]); j++)
			{
				input.sprite[i,j] = input.char[current_spr[i],j];
			}
		}
		
		
	}
}

flag_speed += 0.01;
layer_background_speed(layer_background_get_id("Background"), (cos(flag_speed) * 2) + 8);