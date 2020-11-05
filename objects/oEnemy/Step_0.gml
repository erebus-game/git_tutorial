/// @description Every time a frame is drawn, player object should do...

// don't walk off edges
if (grounded && afraidofheights && !place_meeting(x+hsp, y+1, oWall)) {
	hsp = -hsp;
}

grounded = place_meeting(x, y+1, oWall);

vsp = vsp + grv;

// Horizontal Collision
// place_meeting is a built-in function! sign() is a built-in that returns +1 or -1 
if (place_meeting(x+hsp, y, oWall)) {
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = -hsp;
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
	sprite_index = sEnemyA;
	image_speed = 0;
	if (vsp > 0) {
		image_index = 1;
	} else {
		image_index = 0;
	}
} else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sEnemy;
	} else {
		sprite_index = sEnemyR;
	}
}

if (hsp != 0) image_xscale = sign(hsp)*size;
image_yscale = size;
