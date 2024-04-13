//player scores
if (instance_number(game_manager) <= 1) global.scores = [0, 0, 0, 0];
else instance_destroy(self);