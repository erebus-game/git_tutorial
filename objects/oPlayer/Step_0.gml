/// @description Every time a frame is drawn, player object should do...
if (hascontrol) {
	// keyboard_check is built-in fn to check if we are *pressing/holding* vk_left (constant for virtual-keyboard left-arrow key)
	// keyboard_check returns boolean
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));

	// don't check if we are holding down on jump, check if this is the exact step during which we hit this key
	// this is b/c we don't want jump to change position every frame for which it is held, only for the frame that the key hit 
	key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));

	if (key_left || key_right || key_jump) controller = false;
	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2 ) {
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = true;
	}

	if (gamepad_button_check_pressed(0, gp_face1)) {
		key_jump = true;
		controller = true;
	}
} else {
	key_right = false;
	key_left = false;
	key_jump = false;
}

// variables so far have been declared globally. using "var" declares a variable as temporary
// it will only last for this frame
var move = key_right - key_left;
var grounded = place_meeting(x, y+1, oWall);

hsp = (move * walksp) + gunkickx;
gunkickx = 0;
vsp = (vsp + grv) + gunkicky;
gunkicky = 0;

if (canjump > 0) canjump--;
if (canjump > 0 && key_jump) {
	vsp = -jumpheight;
	canjump = 0;
}

// Horizontal Collision
// place_meeting is a built-in function! sign() is a built-in that returns +1 or -1 
if (place_meeting(x+hsp, y, oWall)) {
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
// x is a built-in property of the Object. represents horizontal coordinate
// y is vertical coordinate
x = x + hsp;

// Vertical Collision
if (place_meeting(x, y+vsp, oWall)) {
	while (!place_meeting(x, y+sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
// y is vertical coordinate
y = y + vsp;

// Animation
if (!grounded) {
	sprite_index = sPlayerA;
	image_speed = 0;
	if (vsp > 0) {
		image_index = 1;
	} else {
		image_index = 0;
	}
} else {
	canjump = 10;
	if (sprite_index == sPlayerA) {
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2));
		audio_play_sound(snLanding, 4, false);
		repeat(5) {
			with (instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = sPlayerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);