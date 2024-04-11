/// @description Insert description here
// You can write your code in this editor

if (async_load[? "event_type"] == "gamepad discovered")
{
	ds_list_add(gamepads, async_load[? "pad_index"]);
}

if (async_load[? "event_type"] == "gamepad lost")
{
	var gamepad_id = ds_list_find_index(gamepads, async_load[? "pad_index"]);
	ds_list_delete(gamepads, gamepad_id);
}