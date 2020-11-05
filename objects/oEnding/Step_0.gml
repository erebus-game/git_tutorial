/// @description 
// move player towards center
layer_x(title_assets_layer_id, min(layer_get_x(title_assets_layer_id)+1, RES_W*0.5-32));

letters += spd;
text = string_copy(endtext[currentline],1, floor(letters));

if (letters >= length && keyboard_check_pressed(vk_anykey)) {
	if (currentline+1 == array_length_1d(endtext)) {
		SlideTransition(TRANS_MODE.RESTART);
	} else {
		currentline++;
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}