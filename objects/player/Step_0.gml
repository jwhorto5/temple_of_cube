/// @description Insert description here
// You can write your code in this editor

//inputs
var key_left = global.controls[player_id, ctls.left];
var key_right = global.controls[player_id, ctls.right];
var key_jump = global.controls[player_id, ctls.jump];
var key_jump_pressed = global.controls[player_id, ctls.jump_pressed];
var key_action = global.controls[player_id, ctls.action];

var key_restart = keyboard_check_pressed(ord("R"));

//debugging
if (key_restart) game_restart();

//movement
if (key_left) hsp -= acc;
else if (key_right) hsp += acc;
else hsp -= sign(hsp) * acc;

hsp = clamp(hsp, -max_speed, max_speed);
if (abs(hsp) < 0.1) hsp = 0;

vsp += grav;

x %= room_width + 16;
if (x <= -16) x = room_width;

if (key_jump_pressed && jumps > 0)
{
	vsp = -(jump_speed + abs(hsp/4));
	jumps--;
	jumped = true;
}
if (!key_jump)
{
	if (!upside_down) vsp = max(vsp, -min_jump_speed);
	else vsp = min(vsp, min_jump_speed);
}

if (place_meeting(x+hsp, y, collidable_objects))
{
	while (!place_meeting(x+sign(hsp), y, collidable_objects))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

if (place_meeting(x, y+vsp, collidable_objects))
{
	while (!place_meeting(x, y+sign(vsp), collidable_objects))
	{
		y += sign(vsp);
	}
	if (upside_down)
	{
		if (vsp < 0) jumps = max_jumps;
	}
	else
	{
		if (vsp > 0) jumps = max_jumps;
	}
	vsp = 0;
	if (can_break)
	{
		for (var _x = x-sprite_width/2; _x < x+sprite_width/2; _x++)
		{
			tilemap_set_at_pixel(tilemap, 0, _x, y-sprite_height);
		}
		clean_room(tilemap);
	}
	
	jumped = false;
	alarm[0] = 10;
}

y += vsp;

//powerup code
if (place_meeting(x+hsp, y+vsp, powerup))
{
	switch (powerup.power_index)
	{
		case 0:
		{
			max_jumps = 2;
			jump_speed -= 1;
			break;
		}
		case 1:
		{
			can_break = true;
			image_xscale *= 1.5;
			image_yscale *= 1.5;
			break;	
		}
		case 2: expanding = true; break;
		case 3:
		{
			is_small = true;
			image_xscale *= 0.6;
			image_yscale *= 0.6;
			jump_speed += 2;
			break;
		}
		case 4:
		{
			upside_down = true;
			grav = -grav;
			jump_speed = -jump_speed;
			break;
		}
		case 5: has_block = true; break;
	}
	instance_destroy(powerup);
}

if (expanding)
{
	image_xscale *= 1.01;
	image_yscale *= 1.01;
}
if (has_block && key_action)
{
	instance_create_layer(x,y+sprite_height, "Instances", block)
}