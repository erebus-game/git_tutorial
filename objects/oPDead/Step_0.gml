if (!done) {
	vsp = vsp + grv;
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
		if (vsp > 0) {
			done = true;
			image_index = 1;
			alarm[0] = 60;
		}
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	// y is vertical coordinate
	y = y + vsp;
}