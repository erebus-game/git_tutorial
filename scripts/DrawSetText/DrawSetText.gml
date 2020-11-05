// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @desc DrawSetText(color,font,halign,valign)
/// @arg color
/// @arg font
/// @arg halign
/// @arg valign
/// Allows one line set up of major text drawing variables.
function DrawSetText(color, font, halign, valign){
	draw_set_color(color);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
}