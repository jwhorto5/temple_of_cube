/// @description Insert description here
// You can write your code in this editor

//inputs
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check(ord("H"));

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

if (key_jump && jumps > 0)
{
	vsp = -jump_speed;
	jumps--;
}

//collision
if (place_meeting(x+hsp, y, tilemap))
{
	while (!place_meeting(x+sign(hsp), y, tilemap))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

if (place_meeting(x, y+vsp, tilemap))
{
	while (!place_meeting(x, y+sign(vsp), tilemap))
	{
		y += sign(vsp);
	}
	vsp = 0;
	jumps = 1;
}

y += vsp;

//var collisions = move_and_collide(hsp,vsp,tilemap); //thank you gamemaker for doing the work for me
//if (array_length(collisions) > 0)
//{
//	vsp = 0; //reset velocity on collision
//	jumps = 1;
//}