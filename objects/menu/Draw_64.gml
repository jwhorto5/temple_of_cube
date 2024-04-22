draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(strs[0]); i++)
{
	draw_set_color(c_black);
	draw_text(mid.w - shadow_offset, mid.h + (font_size * spacing * i) + shadow_offset,
	(i == current_selection) ? "▶   " + strs[current_menu, i] : strs[current_menu, i]);
	draw_set_color(c_white);
	draw_text(mid.w, mid.h + font_size * spacing * i, (i == current_selection) ? "▶   " + strs[current_menu, i]: strs[current_menu, i]);
}

if (current_menu == 3)
{
	draw_set_color(c_black);
	draw_text(mid.w - shadow_offset, mid.h + shadow_offset,
	"Select a Character");
	draw_set_color(c_white);
	draw_text(mid.w, mid.h, "Select a Character");
	
	for (var i = 0; i < array_length(current_spr); i++)
	{
		draw_sprite(input.sprite[i, 0], 0, mid.w - 88 + (i * 64), mid.h + 36);
		//draw_text(room_width / 2 + i * 32, room_height / 2 + 32, current_spr[i]);
		draw_set_color(c_black);
		draw_text(mid.w - 88 + (i * 64) - shadow_offset, mid.h + 54 + shadow_offset, "P" + string(i+1));
		draw_set_color(c_white);
		draw_text(mid.w - 88 + (i * 64), mid.h + 54, "P" + string(i+1));
	}
}