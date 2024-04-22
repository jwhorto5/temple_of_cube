global.controls[0, ctls.left] = keyboard_check(ord("A"));
global.controls[0, ctls.right] = keyboard_check(ord("D"));
global.controls[0, ctls.hor_pressed] = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
global.controls[0, ctls.ver_pressed] = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
global.controls[0, ctls.up] = keyboard_check(ord("W"));
global.controls[0, ctls.down] = keyboard_check(ord("S"));
global.controls[0, ctls.jump] = keyboard_check(ord("H"));
global.controls[0, ctls.jump_pressed] = keyboard_check_pressed(ord("H"));
global.controls[0, ctls.action] = keyboard_check_pressed(ord("J"));
global.controls[0, ctls.shove] = keyboard_check_pressed(ord("K"));

global.controls[1, ctls.left] = keyboard_check(vk_left);
global.controls[1, ctls.right] = keyboard_check(vk_right);
global.controls[1, ctls.up] = keyboard_check(vk_up);
global.controls[1, ctls.down] = keyboard_check(vk_down);
global.controls[1, ctls.hor_pressed] = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
global.controls[1, ctls.ver_pressed] = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
global.controls[1, ctls.jump] = keyboard_check(vk_numpad1);
global.controls[1, ctls.jump_pressed] = keyboard_check_pressed(vk_numpad1);
global.controls[1, ctls.action] = keyboard_check_pressed(vk_numpad2);
global.controls[1, ctls.shove] = keyboard_check_pressed(vk_numpad3);

global.controls[2, ctls.left] = keyboard_check(vk_left);
global.controls[2, ctls.right] = keyboard_check(vk_right);
global.controls[2, ctls.up] = keyboard_check(vk_up);
global.controls[2, ctls.down] = keyboard_check(vk_down);
global.controls[2, ctls.hor_pressed] = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
global.controls[2, ctls.ver_pressed] = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
global.controls[2, ctls.jump] = keyboard_check(vk_numpad1);
global.controls[2, ctls.jump_pressed] = keyboard_check_pressed(vk_numpad1);
global.controls[2, ctls.action] = keyboard_check_pressed(vk_numpad2);
global.controls[2, ctls.shove] = keyboard_check_pressed(vk_numpad3);

global.controls[3, ctls.left] = keyboard_check(vk_left);
global.controls[3, ctls.right] = keyboard_check(vk_right);
global.controls[3, ctls.up] = keyboard_check(vk_up);
global.controls[3, ctls.down] = keyboard_check(vk_down);
global.controls[3, ctls.hor_pressed] = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
global.controls[3, ctls.ver_pressed] = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
global.controls[3, ctls.jump] = keyboard_check(vk_numpad1);
global.controls[3, ctls.jump_pressed] = keyboard_check_pressed(vk_numpad1);
global.controls[3, ctls.action] = keyboard_check_pressed(vk_numpad2);
global.controls[3, ctls.shove] = keyboard_check_pressed(vk_numpad3);

for (var p = 0; p < ds_list_size(gamepads); p++)
{
	var pad = gamepads[| p];
	
	if (gamepad_is_connected(pad))
	{
		global.controls[p, ctls.left] += gamepad_button_check(pad, gp_padl);
		global.controls[p, ctls.right] += gamepad_button_check(pad, gp_padr);
		global.controls[p, ctls.up] += gamepad_button_check(pad, gp_padu);
		global.controls[p, ctls.down] += gamepad_button_check(pad, gp_padd);
		global.controls[p, ctls.hor_pressed] += gamepad_button_check_pressed(pad, gp_padr) - gamepad_button_check_pressed(pad, gp_padl);
		global.controls[p, ctls.ver_pressed] += gamepad_button_check_pressed(pad, gp_padd) - gamepad_button_check_pressed(pad, gp_padu);
		global.controls[p, ctls.jump] += gamepad_button_check(pad, gp_face1);
		global.controls[p, ctls.jump_pressed] += gamepad_button_check_pressed(pad, gp_face1);
		global.controls[p, ctls.action] += gamepad_button_check_pressed(pad, gp_face2);
		global.controls[p, ctls.shove] += gamepad_button_check_pressed(pad, gp_face3);
		
		//clamp
		global.controls[p, ctls.left] = clamp(global.controls[p, ctls.left], 0, 1);
		global.controls[p, ctls.right] = clamp(global.controls[p, ctls.right], 0, 1);
		global.controls[p, ctls.up] = clamp(global.controls[p, ctls.up], 0, 1);
		global.controls[p, ctls.down] = clamp(global.controls[p, ctls.down], 0, 1);
		global.controls[p, ctls.hor_pressed] = clamp(global.controls[p, ctls.hor_pressed], -1, 1);
		global.controls[p, ctls.ver_pressed] = clamp(global.controls[p, ctls.ver_pressed], -1, 1);
		global.controls[p, ctls.jump] = clamp(global.controls[p, ctls.jump], 0, 1);
		global.controls[p, ctls.jump_pressed] = clamp(global.controls[p, ctls.jump_pressed], 0, 1);
		global.controls[p, ctls.action] = clamp(global.controls[p, ctls.action], 0, 1);
		global.controls[p, ctls.shove] = clamp(global.controls[p, ctls.shove], 0, 1);
	}
}