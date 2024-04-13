//player scores
if (instance_number(game_manager) <= 1) global.scores = [0, 0, 0, 0];
else instance_destroy(self);

//shader for each player
shaders = [sh_player_1, sh_player_2, sh_player_3, sh_player_4];