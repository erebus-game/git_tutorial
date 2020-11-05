/// @description GUI/Vars/Menu setup

#macro SAVEFILE "Save.sav"

menu_speed = 25; // lower is faster
menu_font = fMenu;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = floor(gui_width / 42);
ease_in_amount = floor(gui_width / 6);
ease_in_buf = floor(ease_in_amount / 3);

menu_x = gui_width + ease_in_amount;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_itemheight = font_get_size(menu_font);

enum MENU_OPTIONS {
	QUIT = 0,
	CONTINUE = 1,
	NEW_GAME = 2,
	NOT_COMMITTED = 3
}
menu_committed = MENU_OPTIONS.NOT_COMMITTED; // should likely be an enum
menu_control = true;

// look into other ways to declare this
menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;

menu_top = menu_y - ((menu_itemheight *1.5) * menu_items);

