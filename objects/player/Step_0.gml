if (alarm[3] > 0) exit;

//inputs

var key_left = global.controls[player_id, ctls.left];
var key_right = global.controls[player_id, ctls.right];
var key_up = global.controls[player_id, ctls.up];
var ud_keys = global.controls[player_id, ctls.ver_pressed];
var key_jump = global.controls[player_id, ctls.jump];
var key_jump_pressed = global.controls[player_id, ctls.jump_pressed];
var key_action = global.controls[player_id, ctls.action];
var key_shove = global.controls[player_id, ctls.shove];

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
else
{
	if (grounded) hsp -= sign(hsp) * dec;
	else hsp -= sign(hsp) * (dec / 2);
	if (abs(hsp) < dec) hsp = 0;
}

if (key_left || key_right) hsp = clamp(hsp, -max_speed, max_speed);

vsp += grav;

//screen wrapping
x %= room_width + 16;
if (x <= -16) x = room_width;

//dying when you fall into the pit
if (upside_down && y < 0) instance_destroy(); 
else if (y > room_height) instance_destroy(); 

if (key_jump_pressed && jumps > 0)
{
	jumps--;
	alarm[1] = 3;
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
			grounded = true;
			if (just_collided) alarm[2] = 2;
		}
	}
	else
	{
		if (vsp > 0)
		{
			if (alarm[1] <= 0) jumps = max_jumps;
			grounded = true;
			if (just_collided) alarm[2] = 2;
		}
	}
	vsp = 0;
	if (can_break)
	{
		for (var _x = x-round(4*base_scale); _x < x+round(4*base_scale); _x++)
		{
			tilemap_set_at_pixel(tilemap, 0, _x, y-round(8*base_scale));
		}
		clean_room(tilemap);
	}
	jumped = false;
	alarm[0] = 6; //too lenient?
	
	just_collided = false;
}
else
{
	grounded = false;
	just_collided = true;
}

y += vsp;

//shoving
var p = instance_place(x+hsp, y+vsp, player);
if (p != noone && key_shove)
{
	alarm[4] = 10;
	p.hsp = shove_speed * dir;
}

//powerup code
if (place_meeting(x+hsp, y+vsp, powerup))
{
	switch (powerup.power_index)
	{
		//double jump
		case 0:
		{
			max_jumps = 2;
			jump_speed -= 1;
			break;
		}
		//big
		case 1:
		{
			can_break = true;
			base_scale *= 1.5;
			break;	
		}
		//expand
		case 2: expanding = true; break;
		//small
		case 3:
		{
			is_small = true;
			base_scale *= 0.6;
			jump_speed += 2;
			break;
		}
		//gravity flip
		case 4:
		{
			upside_down = true;
			grav = -grav;
			jump_speed = -jump_speed;
			break;
		}
		//the block
		case 5: has_block = true; break;
	}
	instance_destroy(powerup);
}

//hitting the goal
if (place_meeting(x+hsp, y+vsp, goal))
{
	global.scores[player_id]++;
	if (global.scores[player_id] >= game_manager.max_score)
	{
		room_goto(victory_screen);
		game_manager.winner = player_id + 1;
	}
	else room_restart();
}

if (expanding)
{
	base_scale *= 1.01;
}
if (has_block && key_action)
{
	instance_create_layer(x,y+sprite_height, "Instances", block)
}

//animation states

image_speed = 1;

if (alarm[4] > 0) current_spr = 5;
else if (alarm[1] > 0 || alarm[2] > 0) current_spr = 3;
else if (!grounded && jumped)
{
	current_spr = 2;
	if (image_index >= image_number - 1) image_speed = 0;
}
else if (grounded && hsp != 0)
{
	current_spr = 1;
	image_speed = hsp / max_speed;
}
else if (key_up)
{
	current_spr = 4;
	if (sprite_index != randall_taunt)
	{
		if (round(image_index) >= sprite_get_number(sprite_index)) image_index = 2;
	}
	
	if (ud_keys == -1) audio_play_sound(input.current_taunt_sound[player_id], 0, false, audio_get_master_gain(0), 0, 1 / clamp(base_scale, 0.1, 5));
}
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