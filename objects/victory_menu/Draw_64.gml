draw_set_font(menu_font);

draw_set_color(c_black);
draw_text(room_width / 2 - shadow_offset, room_height / 2 + shadow_offset, "Player " + string(game_manager.winner) + " wins!");
draw_set_color(c_white);
draw_text(room_width / 2, room_height / 2, "Player " + string(game_manager.winner) + " wins!");
