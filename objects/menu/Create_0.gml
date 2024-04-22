mid = { w : room_width/2, h : room_height * 2 / 3 };
font_size = font_get_size(menu_font);
spacing = 1.5;
shadow_offset = 4;

strs =
[
	["Start Game", "Customize", "Options", "Quit"],
	["Players: ", "Level: ", "Powerups: ", "Exit"],
	["Volume: " + string(audio_sound_get_gain(bgm_nice)), "Fullscreen: ", "V-sync: ", "Exit"],
	["","","",""]
];

current_menu = 0;
current_selection = 0;
current_spr = [0,0,0,0];

vsync = false;

flag_speed = 0.5;