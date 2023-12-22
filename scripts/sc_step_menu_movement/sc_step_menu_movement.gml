function sc_step_menu_movement() {
	if control_wait > 0 control_wait--;
	
	if _control_reset > 0 and keyboard_check(vk_tab) {
		_control_reset--;
	} else if _control_reset = 0 and keyboard_check(vk_tab) {
		_control_reset = -1;
		ini_open("data.ini");
		ini_write_real("controls", 0, vk_escape);
		global.key[0] = vk_escape;
		ini_write_real("controls", 1, ord("W"));
		global.key[1] = ord("W");
		ini_write_real("controls", 2, ord("S"));
		global.key[2] = ord("S");
		ini_write_real("controls", 3, ord("A"));
		global.key[3] = ord("A");
		ini_write_real("controls", 4, ord("D"));
		global.key[4] = ord("D");
		ini_write_real("controls", 5, ord("E"));
		global.key[5] = ord("E");
		ini_write_real("controls", 6, vk_space);
		global.key[6] = vk_space;
		ini_write_real("controls", 7, ord("F"));
		global.key[7] = ord("F");
		ini_write_real("controls", 8, ord("Q"));
		global.key[8] = ord("Q");
		ini_close();
	} else if keyboard_check_pressed(vk_tab) {
		_control_reset = 60;
	} else if _control_reset > 0 _control_reset = -1;
	
	if selected_assign != -1 {
		if keyboard_key != 0 {
			global.key[selected_assign] = keyboard_key;
			
			ini_open("data.ini");
			ini_write_real("controls", selected_assign, global.key[selected_assign]);
			ini_close();
			
			selected_assign = -1;
			control_wait = 60;
		}
	} else {
		if keyboard_check_pressed(global.key[ctrl.backward]) || gamepad_button_check_pressed(0, gp_padd) {
			pressing = noone;
			pressed = noone;
			selected++;
			if selected >= array_length(selection[sel_menu]) selected = 0;
	
			if sel_menu = 2 {
				selected_bestiary_y += 1;
				if selected_bestiary_y*4 + selected_bestiary_x >= array_length(global.stats) selected_bestiary_y = -1;
			} else if sel_menu = 7 {
				selected_achievement_y += 1;
				if selected_achievement_y*4 + selected_achievement_x >= array_length(achievements) selected_achievement_y = -1;
			}
		} else if keyboard_check_pressed(global.key[ctrl.forward]) || gamepad_button_check_pressed(0, gp_padu) {
			pressing = noone;
			pressed = noone;
			selected--;
			if selected < 0 selected = array_length(selection[sel_menu])-1;
	
			if sel_menu = 2 {
				selected_bestiary_y -= 1;
				if selected_bestiary_y < 0 {
					selected_bestiary_y = -1;
				}
			} else if sel_menu = 7 {
				selected_achievement_y -= 1;
				if selected_achievement_y < 0 {
					selected_achievement_y = -1;
				}
			}
		} else if keyboard_check_pressed(global.key[ctrl.left]) || gamepad_button_check_pressed(0, gp_padl) || -gamepad_button_check_pressed(0, gp_axislh) > .9 {
			if sel_menu = 2 { //bestiary
				selected_bestiary_x -= 1;
				if selected_bestiary_x < 0 {
					selected_bestiary_x = 3;
					if selected_bestiary_y*4 + selected_bestiary_x >= array_length(global.stats) selected_bestiary_x = array_length(global.stats) mod 4 - 1;
				}
			} else if sel_menu = 7 { //achievements
				selected_achievement_x -= 1;
				if selected_achievement_x < 0 {
					selected_achievement_x = 7;
					if selected_achievement_y*8 + selected_achievement_x >= array_length(achievements) selected_achievement_y = array_length(global.stats) mod 8 - 1;
				}
			} else if sel_menu = 1 and selection[sel_menu, selected] = "Volume" {
				global.volume = clamp(global.volume - 10, 0, 100);
				audio_group_set_gain(ag_game_sounds, 0.1 * global.volume / 100, 0);
				audio_group_set_gain(ag_menu_sounds, global.volume / 100, 0);
				audio_play_sound(sfx_menu_select3, 10, false);
				ini_open("data.ini");
				ini_write_real("settings", "volume", global.volume);
				ini_close();
			} else if sel_menu = 1 and selection[sel_menu, selected] = "Music" {
				global.music = clamp(global.music - 10, 0, 100);
				audio_group_set_gain(ag_game_music, global.music / 100, 0);
				audio_play_sound(sfx_menu_select3, 10, false, global.music / 100);
				ini_open("data.ini");
				ini_write_real("settings", "music_volume", global.music);
				ini_close();
			} else if sel_menu = 1 and selection[sel_menu, selected] = "Menu Volume" {
				global.menu_sound = clamp(global.menu_sound - 10, 0, 100);
				if room = menu {
					audio_group_set_gain(ag_game_sounds, (global.menu_sound / 100) * 0.1 * global.volume / 100, 0);
					audio_group_set_gain(ag_menu_sounds, (global.menu_sound / 100) * global.volume / 100, 0);
					audio_group_set_gain(ag_game_music, (global.menu_sound / 100) * global.music / 100, 0);
				}
				audio_play_sound(sfx_menu_select3, 10, false, global.menu_sound / 100);
				ini_open("data.ini");
				ini_write_real("settings", "main_menu_volume", global.menu_sound);
				ini_close();
			} else if sel_menu = 1 and selection[sel_menu, selected] = "Background Objects" {
				global.background_objects = clamp(global.background_objects - 1, 0, 2);
				ini_open("data.ini");
				ini_write_real("settings", "background_objects", global.background_objects);
				ini_close();
			}
		} else if keyboard_check_pressed(global.key[ctrl.right]) || gamepad_button_check_pressed(0, gp_padr) || -gamepad_button_check_pressed(0, gp_axislh) < -.9 {
			if sel_menu = 2 { //bestiary
				selected_bestiary_x += 1;
				if selected_bestiary_x >= 4 or selected_bestiary_y*4 + selected_bestiary_x >= array_length(global.stats) selected_bestiary_x = 0;
			} else if sel_menu = 7 { //achievements
				selected_achievement_x += 1;
				if selected_achievement_x >= 8 or selected_achievement_y*8 + selected_achievement_x >= array_length(achievements) selected_achievement_x = 0;
			} else if sel_menu = 1 and selection[sel_menu, selected] = "Volume" {
				global.volume = clamp(global.volume + 10, 0, 100);
				audio_group_set_gain(ag_game_sounds, 0.1 * global.volume / 100, 0);
				audio_group_set_gain(ag_menu_sounds, global.volume / 100, 0);
				audio_play_sound(sfx_menu_select3, 10, false);
				ini_open("data.ini");
				ini_write_real("settings", "volume", global.volume);
				ini_close();
			} else if sel_menu = 1 and selection[sel_menu, selected] = "Music" {
				global.music = clamp(global.music + 10, 0, 100);
				audio_group_set_gain(ag_game_music, global.music / 100, 0);
				audio_play_sound(sfx_menu_select3, 10, false, global.music / 100);
				ini_open("data.ini");
				ini_write_real("settings", "music_volume", global.music);
				ini_close();
			} else if sel_menu = 1 and selection[sel_menu, selected] = "Menu Volume" {
				global.menu_sound = clamp(global.menu_sound + 10, 0, 100);
				if room = menu {
					audio_group_set_gain(ag_game_sounds, (global.menu_sound / 100) * 0.1 * global.volume / 100, 0);
					audio_group_set_gain(ag_menu_sounds, (global.menu_sound / 100) * global.volume / 100, 0);
					audio_group_set_gain(ag_game_music, (global.menu_sound / 100) * global.music / 100, 0);
				}
				audio_play_sound(sfx_menu_select3, 10, false, global.menu_sound / 100);
				ini_open("data.ini");
				ini_write_real("settings", "main_menu_volume", global.menu_sound);
				ini_close();
			} else if sel_menu = 1 and selection[sel_menu, selected] = "Background Objects" {
				global.background_objects = clamp(global.background_objects + 1, 0, 2);
				ini_open("data.ini");
				ini_write_real("settings", "background_objects", global.background_objects);
				ini_close();
			}
		}

		if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.key[ctrl.shoot]) or keyboard_check_pressed(global.key[ctrl.select]) or gamepad_button_check_pressed(0, gp_face1) {
			if sel_menu = 2 {
				if selected_bestiary_y = -1 {
					pressed = selected;
				}
			} else if sel_menu = 7 {
				if selected_achievement_y = -1 {
					pressed = selected;
				}
			} else {
				pressed = selected;
			}
		} else if (keyboard_check(vk_enter) or keyboard_check(global.key[ctrl.shoot]) or keyboard_check(global.key[ctrl.select])) or gamepad_button_check(0, gp_face1) and pressed = selected {
			if sel_menu = 2 {
				if selected_bestiary_y = -1 {
					pressing = selected;
				}
			} else if sel_menu = 7 {
				if selected_achievement_y = -1 {
					pressing = selected;
				}
			} else {
				pressing = selected;
			}
		} else if (sel_menu != 4 and sel_menu != 9) and (keyboard_check_released(vk_enter) or keyboard_check_released(global.key[ctrl.shoot]) or keyboard_check_released(global.key[ctrl.select]) or gamepad_button_check_released(0, gp_face1)) and pressing != noone {
			pressed = noone;
			pressing = noone;
			
			show_debug_message(selection[sel_menu, selected]);
			if selection[sel_menu, selected] = "Continue" {
				audio_play_sound(sfx_menu_select3, 10, false);
				instance_activate_all();
				pause = false;
			} else if selection[sel_menu, selected] = "Main Menu" {
				audio_play_sound(sfx_menu_select3, 10, false);
				if global.pts = 0 sc_save_score(true);
				else sc_save_score(true);
				room_goto(menu);
			} else if selection[sel_menu, selected] = "Restart" {
				audio_play_sound(sfx_menu_select3, 10, false);
				if global.pts = 0 sc_save_score(true);
				else sc_save_score(true);
				room_restart();
			} else if selection[sel_menu, selected] = "Quit" {
				audio_play_sound(sfx_menu_select3, 10, false);
				room_goto(menu);
			} else if selection[sel_menu, selected] = "Start" {
				audio_play_sound(sfx_menu_select3, 10, false);
				sel_menu = 8;
				selected = 0;
			} else if selection[sel_menu, selected] = "Bestiary" {
				audio_play_sound(sfx_menu_select3, 10, false);
				sel_menu = 2;
				selected = 0;
			} else if selection[sel_menu, selected] = "Achievements" {
				audio_play_sound(sfx_menu_select3, 10, false);
				sel_menu = 7;
				selected = 0;
			} else if selection[sel_menu, selected] = "Top Scores" {
				audio_play_sound(sfx_menu_select3, 10, false);
				sel_menu = 4;
				selected = 0;
			} else if selection[sel_menu, selected] = "Stats" {
				audio_play_sound(sfx_menu_select3, 10, false);
				sel_menu = 9;
				selected = 0;
			} else if selection[sel_menu, selected] = "Options" {
				audio_play_sound(sfx_menu_select3, 10, false);
				sel_menu = 1;
				selected = 0;
			} else if selection[sel_menu, selected] = "Controls" {
				audio_play_sound(sfx_menu_select3, 10, false);
				sel_menu = 3;
				selected = 0;
			
			} else if selection[sel_menu, selected] = "Key" {
				audio_play_sound(sfx_menu_select3, 10, false);
				if selected_assign = -1 and control_wait = 0 selected_assign = selected-1;
			
			} else if selection[sel_menu, selected] = "Fullscreen" {
				audio_play_sound(sfx_menu_select3, 10, false);
				if window_get_fullscreen() = 0 window_set_fullscreen(1);
				else window_set_fullscreen(0);
				ini_open("data.ini");
				ini_write_real("settings", "fullscreen", window_get_fullscreen());
				ini_close();
			} else if selection[sel_menu, selected] = "Exit" {
				audio_play_sound(sfx_menu_select3, 10, false);
				game_end();
			} else if selection[sel_menu, selected] = "Back" {
				audio_play_sound(sfx_menu_select3, 10, false);
				if sel_menu = 2 {
					if selected_bestiary_y = -1 {
						sel_menu = 0;
						selected = 0;
					}
				} else if sel_menu = 7 {
					if selected_achievement_y = -1 {
						sel_menu = 0;
						selected = 0;
					}
				} else {
					sel_menu = 0;
					selected = 0;
				}
			}
		} else if (keyboard_check_pressed(global.key[ctrl.back]) or gamepad_button_check_pressed(0, gp_face2)) and sel_menu != 0 {
			sel_menu = 0;
			selected = 0;
		}
	}
}