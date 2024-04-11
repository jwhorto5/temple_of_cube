/// @description Insert description here
// You can write your code in this editor

global.controls[0, ctls.left] = keyboard_check(ord("A"));
global.controls[0, ctls.right] = keyboard_check(ord("D"));
global.controls[0, ctls.up] = keyboard_check(ord("W"));
global.controls[0, ctls.jump] = keyboard_check(ord("H"));
global.controls[0, ctls.jump_pressed] = keyboard_check_pressed(ord("H"));
global.controls[0, ctls.action] = keyboard_check_pressed(ord("J"));