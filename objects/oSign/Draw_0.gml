/// @description draw marker when close

draw_self();
if (!instance_exists(oPlayer)) exit;
if (nearby) draw_sprite_ext(sMarker, 0, x, y - 32, 1, -1, 0, c_white, 1);
