//player scores
if (instance_number(game_manager) <= 1) global.scores = [0, 0, 0, 0];
else instance_destroy(self);
max_score = 5;
winner = 1;

//number of players
global.players = 4;

//current stage
global.stage = 0;

//shader for each player
shaders = [sh_player_1, sh_player_2, sh_player_3, sh_player_4];

audio_play_sound(bgm_nice, 0, true);