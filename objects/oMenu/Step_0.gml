/// @description Control Menu

// item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

if (menu_control) {
	var up = keyboard_check_pressed(vk_up);
	var down = keyboard_check_pressed(vk_down);
	if (up || down) {
		menu_cursor = (menu_cursor + up - down + menu_items) % menu_items;
	}
	
	if (keyboard_check_pressed(vk_enter) && !up && !down) {
		menu_x_target = gui_width + ease_in_amount;
		menu_committed = menu_cursor;
		ScreenShake(4, 30);
		menu_control = false;
		audio_play_sound(snDeath, 10, false);
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y && mouse_y_gui > menu_top && menu_control) {
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		if (mouse_check_button_pressed(mb_left)) {
			menu_x_target = gui_width + ease_in_amount;
			menu_committed = menu_cursor;
			ScreenShake(4, 30);
			menu_control = false;
			audio_play_sound(snDeath, 10, false);
		}
	}
}

if (menu_x > gui_width + ease_in_buf && menu_committed != MENU_OPTIONS.NOT_COMMITTED) {
	switch (menu_committed) {
		case MENU_OPTIONS.QUIT:
			game_end();
			break;
		case MENU_OPTIONS.CONTINUE:
			if (!file_exists(SAVEFILE)) {
				SlideTransition(TRANS_MODE.NEXT);
			} else {
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				global.kills = file_text_read_real(file);
				global.hasgun = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO, target);
			}
			break;
		case MENU_OPTIONS.NEW_GAME:
		default:
			SlideTransition(TRANS_MODE.NEXT);
			break;
	}
}