var space_from_borders = 16;

draw_set_font(menu_font);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

if (room_get_name(room) == "game")
{
	draw_text(space_from_borders, space_from_borders, string(global.scores[0]));
	draw_text(camera_get_view_width(view_camera[0]) - space_from_borders, space_from_borders, string(global.scores[1]));
	if (global.players > 2) draw_text(space_from_borders, camera_get_view_height(view_camera[0]) - space_from_borders, string(global.scores[2]));
	if (global.players > 3) draw_text(camera_get_view_width(view_camera[0]) - space_from_borders, camera_get_view_height(view_camera[0]) - space_from_borders, string(global.scores[3]));
}