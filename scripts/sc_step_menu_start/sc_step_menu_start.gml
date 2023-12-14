function sc_step_menu_start() {
	if sel_menu = 8 {
		if keyboard_check_pressed(global.key[ctrl.left]) || gamepad_button_check_pressed(0, gp_padl) || -gamepad_button_check_pressed(0, gp_axislh) > .9 {
			if selected_character_y = 0 {
				audio_play_sound(sfx_menu_select3, 10, false);
				global.selected_character--;
				if global.selected_character < 0 global.selected_character = array_length(character)-1;
			} else if selected_character_y = 1 {
				pressing_left = true;
			}
		} else if keyboard_check_released(global.key[ctrl.left]) || gamepad_button_check_released(0, gp_padl) || -gamepad_button_check_released(0, gp_axislh) > .9 {
			if selected_character_y = 1 and pressing_left {
				audio_play_sound(sfx_menu_select3, 10, false);
				global.ascension_modifier[global.selected_character]--;
				if global.ascension_modifier[global.selected_character] < 0 global.ascension_modifier[global.selected_character] = global.ascension_modifier_max[global.selected_character];
			}
			pressing_left = false;
		} else if keyboard_check_pressed(global.key[ctrl.right]) || gamepad_button_check_pressed(0, gp_padr) || -gamepad_button_check_pressed(0, gp_axislh) < -.9 {
			if selected_character_y = 0 {
				audio_play_sound(sfx_menu_select3, 10, false);
				global.selected_character++;
				if global.selected_character >= array_length(character) global.selected_character = 0;
			} else if selected_character_y = 1 {
				pressing_right = true;
			}
		} else if keyboard_check_released(global.key[ctrl.right]) || gamepad_button_check_released(0, gp_padr) || -gamepad_button_check_released(0, gp_axislh) < -.9 {
			if pressing_right and selected_character_y = 1 {
				audio_play_sound(sfx_menu_select3, 10, false);
				global.ascension_modifier[global.selected_character]++;
				if global.ascension_modifier[global.selected_character] > global.ascension_modifier_max[global.selected_character] global.ascension_modifier[global.selected_character] = 0;
			}
			pressing_right = false;
		} else if keyboard_check_pressed(ord("Q")) || gamepad_button_check_pressed(0, gp_shoulderl) {
			if selected_character_y = 0 {
				global.color_modifier[global.selected_character]--;
				if global.color_modifier[global.selected_character] < 0 global.color_modifier[global.selected_character] = array_length(global.color_modifier_purchased[global.selected_character])-1;
			}
		} else if keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0, gp_shoulderr) {
			if selected_character_y = 0 {
				global.color_modifier[global.selected_character]++;
				if global.color_modifier[global.selected_character] > array_length(global.color_modifier_purchased[global.selected_character])-1 global.color_modifier[global.selected_character] = 0;
			}
		}
		
		if keyboard_check_pressed(global.key[ctrl.forward]) || gamepad_button_check_pressed(0, gp_padu) {
			selected_character_y--;
			if selected_character_y < 0 selected_character_y = 2;
			else if selected_character_y = 1 and global.ascension_modifier_max[global.selected_character] <= 0 selected_character_y--;
		} else if keyboard_check_pressed(global.key[ctrl.backward]) || gamepad_button_check_pressed(0, gp_padd) {
			selected_character_y++;
			if selected_character_y > 2 selected_character_y = 0;
			else if selected_character_y = 1 and global.ascension_modifier_max[global.selected_character] <= 0 selected_character_y++;
		} else if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.key[ctrl.shoot]) or keyboard_check_pressed(global.key[ctrl.select]) or gamepad_button_check_pressed(0, gp_face1) {
			pressing = true;
		} else if keyboard_check_released(vk_enter) or keyboard_check_released(global.key[ctrl.shoot]) or keyboard_check_released(global.key[ctrl.select]) or gamepad_button_check_released(0, gp_face1) {
			if selected_character_y = 2 and pressing {
				if global.ascension_modifier_max[global.selected_character] >= 0 and global.color_modifier_purchased[global.selected_character][global.color_modifier[global.selected_character]] = 1 {
					room_goto(game);
					var snd = audio_play_sound(sfx_menu_select2, 1, false);
					audio_sound_gain(snd, 1, 0);
				} else if global.coins >= character[global.selected_character][4] and global.ascension_modifier_max[global.selected_character] = -1 {
					audio_play_sound(sfx_menu_select3, 10, false);
					global.coins -= character[global.selected_character][4];
					global.ascension_modifier_max[global.selected_character] = 0;
					ini_open("data.ini");
					ini_write_real("coins", "coins", global.coins);
					ini_write_real("ascensions", string(global.selected_character), 0);
					ini_close();
				} else if global.coins >= color[global.color_modifier[global.selected_character]][1] and global.color_modifier_purchased[global.selected_character][global.color_modifier[global.selected_character]] = 0 {
					audio_play_sound(sfx_menu_select3, 10, false);
					global.coins -= color[global.color_modifier[global.selected_character]][1];
					global.color_modifier_purchased[global.selected_character][global.color_modifier[global.selected_character]] = 1;
					ini_open("data.ini");
					ini_write_real("coins", "coins", global.coins);
					ini_write_real("colors", string(global.selected_character) + ":" + string(global.color_modifier[global.selected_character]), 1);
					ini_close();
				} else {
					audio_play_sound(sfx_sounds_error1, 10, false);
				}
			}
			pressing = false
		} else if (keyboard_check_pressed(global.key[ctrl.back]) or gamepad_button_check_pressed(0, gp_face2)) {
			sel_menu = 0;
			selected = 0;
		}
	}
}