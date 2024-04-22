for (var i = 0; i < global.players; i++)
{
	if (global.controls[i, ctls.jump_pressed]) room_goto(main_menu);
}