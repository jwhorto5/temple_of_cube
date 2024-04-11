/// @description Insert description here
// You can write your code in this editor

//inputs
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));

//movement
if (key_left) hsp -= acc;
else if (key_right) hsp += acc;
else hsp -= sign(hsp) * acc;

hsp = clamp(hsp, -max_speed, max_speed);
if (abs(hsp) < 0.1) hsp = 0;

vsp += grav;

x += hsp;
y += vsp;