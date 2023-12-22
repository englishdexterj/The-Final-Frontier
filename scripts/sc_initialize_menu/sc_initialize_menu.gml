function sc_initialize_menu() {
	selected = 0;
	sel_menu = 0;
	
	enum ingame_settings {
		s_continue,
		s_restart,
		s_bestiary,
		s_achievements,
		s_topscores,
		s_options,
		s_main_menu
	}
	
	enum menu_settings {
		s_start,
		s_bestiary,
		s_achievements,
		s_topscores,
		s_options,
		s_exit
	}
	
	if room = game {
		selection[0, 0] = "Continue";
		selection[0, 1] = "Restart";
		selection[0, 2] = "Bestiary";
		selection[0, 3] = "Achievements";
		selection[0, 4] = "Top Scores";
		selection[0, 5] = "Options";
		selection[0, 6] = "Main Menu";
	} else if room = menu {
		selection[0, 0] = "Start";
		selection[0, 1] = "Bestiary";
		selection[0, 2] = "Achievements";
		selection[0, 3] = "Top Scores";
		selection[0, 4] = "Stats";
		selection[0, 5] = "Options";
		selection[0, 6] = "Exit";
	}

	selection[1, 0] = "Back"; //options
	selection[1, 1] = "Volume";
	selection[1, 2] = "Music";
	selection[1, 3] = "Menu Volume";
	selection[1, 4] = "Background Objects";
	selection[1, 5] = "Fullscreen";
	selection[1, 6] = "Controls";

	selection[2, 0] = "Back"; //bestiary
	
	selection[7, 0] = "Back"; //achievements

	selection[3, 0] = "Back"; //controls
	selection[3, 1] = "Key";
	selection[3, 2] = "Key";
	selection[3, 3] = "Key";
	selection[3, 4] = "Key";
	selection[3, 5] = "Key";
	selection[3, 6] = "Key";
	selection[3, 7] = "Key";
	selection[3, 8] = "Key";
	selection[3, 9] = "Key";
	
	selection[5, 0] = "Restart";
	selection[5, 1] = "Main Menu";
	
	selection[10, 0] = ""; //blank

	selected_bestiary_x = 0;
	selected_bestiary_y = -1;
	
	selected_achievement_x = 0;
	selected_achievement_y = -1;
	
	selected_assign = -1;

	pressed = noone;
	pressing = noone;
	
	key_word[0] = "Back: ";
	key_word[1] = "Forward: ";
	key_word[2] = "Backward: ";
	key_word[3] = "Left: ";
	key_word[4] = "Right: ";
	key_word[5] = "Select: ";
	key_word[6] = "Shoot: ";
	key_word[7] = "Special: ";
	key_word[8] = "Cloak: ";
	_control_reset = -1
	
	ini_open("data.ini");
	for (var i = 0; i < 9; i++) {
		if !ini_key_exists("controls", i) {
			switch i {
				case 0:
					ini_write_real("controls", i, vk_escape);
					global.key[i] = vk_escape;
					break;
				case 1:
					ini_write_real("controls", i, ord("W"));
					global.key[i] = ord("W");
					break;
				case 2:
					ini_write_real("controls", i, ord("S"));
					global.key[i] = ord("S");
					break;
				case 3:
					ini_write_real("controls", i, ord("A"));
					global.key[i] = ord("A");
					break;
				case 4:
					ini_write_real("controls", i, ord("D"));
					global.key[i] = ord("D");
					break;
				case 5:
					ini_write_real("controls", i, ord("E"));
					global.key[i] = ord("E");
					break;
				case 6:
					ini_write_real("controls", i, vk_space);
					global.key[i] = vk_space;
					break;
				case 7:
					ini_write_real("controls", i, ord("F"));
					global.key[i] = ord("F");
					break;
				case 8:
					ini_write_real("controls", i, ord("Q"));
					global.key[i] = ord("Q");
					break;
			}
			
			
		} else {
			global.key[i] = ini_read_real("controls", i, 0);
		}
	}
	ini_close();
	
	control_wait = 0;
	
	enum ctrl {
		back,
		forward,
		backward,
		left,
		right,
		select,
		shoot,
		special,
		cloak
	}
}
