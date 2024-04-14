//inputs
var key_left = global.controls[player_id, ctls.left];
var key_right = global.controls[player_id, ctls.right];
var key_jump = global.controls[player_id, ctls.jump];
var key_jump_pressed = global.controls[player_id, ctls.jump_pressed];
var key_action = global.controls[player_id, ctls.action];

//movement
if (key_left)
{
	hsp -= acc;
	dir = -1;
}
else if (key_right)
{
	hsp += acc;
	dir = 1;
}
else hsp -= sign(hsp) * acc;

hsp = clamp(hsp, -max_speed, max_speed);
if (abs(hsp) < 0.1) hsp = 0;

vsp += grav;

x %= room_width + 16;
if (x <= -16) x = room_width;

if (key_jump_pressed && jumps > 0)
{
	jumps--;
	alarm[1] = 3;
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
		if (vsp < 0)
		{
			if (alarm[1] <= 0) jumps = max_jumps;
			collided = true;
		}
	}
	else
	{
		if (vsp > 0)
		{
			if (alarm[1] <= 0) jumps = max_jumps;
			collided = true;
		}
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
	alarm[0] = 10; //too lenient?
}
else collided = false;

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
			base_scale *= 1.5;
			break;	
		}
		case 2: expanding = true; break;
		case 3:
		{
			is_small = true;
			base_scale *= 0.6;
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

//hitting the goal
if (place_meeting(x+hsp, y+vsp, goal))
{
	global.scores[player_id]++;
	room_restart();
}

if (expanding)
{
	base_scale *= 1.01;
}
if (has_block && key_action)
{
	instance_create_layer(x,y+sprite_height, "Instances", block)
}

image_speed = 1;

if (alarm[1] > 0) current_spr = 3;
else if (!collided)
{
	current_spr = 2;
	if (image_index >= image_number - 1) image_speed = 0;
}
else if (hsp != 0) current_spr = 1;
else current_spr = 0;

sprite_index = input.sprite[player_id, current_spr];
image_xscale = base_scale * dir;
image_yscale = upside_down ? -base_scale : base_scale;

//for later :)
//if (player_id = 0)
//{
//	layer_hspeed("foreground", cos(layer_speed))
//	layer_speed += 0.01;
//}