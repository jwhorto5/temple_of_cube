draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text(16, 16, string(global.scores[0]));
draw_text(room_width - 16, 16, string(global.scores[1]));