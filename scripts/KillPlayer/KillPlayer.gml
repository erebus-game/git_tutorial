// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function KillPlayer(){
	with (oGun) instance_destroy();
	audio_sound_pitch(snDeath, 1);
	audio_play_sound(snDeath, 11, false);
	instance_change(oPDead, true);

	direction = point_direction(other.x, other.y, x, y);
	hsp = lengthdir_x(6, direction);
	vsp = lengthdir_y(4, direction) - 2;
	if (sign(hsp) != 0) image_xscale = sign(hsp);
	
	global.kills -= global.killsthisroom;
	show_debug_message("Player died"); //SAD
	//Josh's big change
}