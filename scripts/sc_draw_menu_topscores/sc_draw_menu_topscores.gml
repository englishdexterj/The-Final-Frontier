function sc_draw_menu_topscores(start_x, start_y) {
	if sel_menu = 4 { //top scores
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_font(f_score);
		
		draw_sprite_stretched_ext(s_start_menu_description, 0, start_x - 128, start_y - 64, (display_get_gui_width() - start_x + 64) - (start_x) + 192, (display_get_gui_height() - start_y) + 64, c_white, 1);
	
		var _vadd = 64;
		var _add = 0;
		draw_text(start_x + _add, start_y - 16, "Place");
		_add += 512;
		draw_set_halign(fa_right);
		draw_text(start_x + _add, start_y - 16, "Score");
		_add += 256;
		_add += 128;
		draw_set_halign(fa_center);
		draw_text(start_x + _add, start_y - 16, "Character");
		_add += 256;
		_add += 128;
		draw_set_halign(fa_left);
		draw_text(start_x + _add, start_y - 16, "Threat");
		_add += 256;
		draw_text(start_x + _add, start_y - 16, "Upgrades");
		
		var _add_row = 0;
		
		var _current_selection = selected_leaderboard;
		
		var _upgrade_x = -999;
		var _upgrade_y = -999;
		var _selected_upgrade_number = 0;
		
		for (var i = 0; i < 10; i++) {
			var _add = 0;
			draw_text(start_x, start_y + _add_row + _vadd + 64*i, i+1);
			_add += 512;
			draw_set_halign(fa_right);
			if top10_scores[0][i] != -1 {
				draw_text(start_x + _add, start_y + _add_row + _vadd + 64*i, top10_scores[0][i]);
			}
			_add += 256;
			_add += 128;
			draw_set_halign(fa_center);
			if top10_scores[1][i] != -1 {
				if top10_scores[3][i] != -1 and color[top10_scores[3][i]][0] != "Blue" draw_text(start_x + _add, start_y + _add_row + _vadd + 64*i, string(color[top10_scores[3][i]][0]) + " " + string(character[top10_scores[1][i]][0]));
				else draw_text(start_x + _add, start_y + _add_row + _vadd + 64*i, character[top10_scores[1][i]][0]);
			}
			_add += 256;
			_add += 128;
			draw_set_halign(fa_left);
			if top10_scores[2][i] != -1 draw_text(start_x + _add, start_y + _add_row + _vadd + 64*i, top10_scores[2][i]);
			_add += 256;
			//if top10_scores[4][i] != -1 draw_text(start_x + _add, start_y + _vadd + 64*i, top10_scores[4][i]);
			
			if top10_scores[4][i] != "" {
				var _upgrade_string = top10_scores[4][i];
				var _upgrade_number = 0;
				var _total_upgrade_number = 0;
				var _current_upgrade = "";
				var _add2 = 0;
				var _start_add_row = _add_row;
				
				for (var k = 1; k < string_length(_upgrade_string)+1; k++) {
					if string_char_at(_upgrade_string, k) != ":" {
						_current_upgrade = _current_upgrade + string_char_at(_upgrade_string, k);
					} else if _current_upgrade != "" {
						_upgrade_number++;
						_total_upgrade_number++;
						if _upgrade_number = 11 {
							_upgrade_number = 1;
							_add_row += 64;
							_add2 -= 16*4 * 10;
						}
						
						if selected_leaderboard = i and selected_column = _total_upgrade_number-1 {
							draw_sprite_stretched_ext(s_upgrades, real(_current_upgrade)+1, start_x + _add + _add2, start_y + _add_row + _vadd + 64*i - 7*4, 14*4, 14*4, c_white, 1);
							var _upgrade_x = start_x + _add + _add2 + 7*4;
							var _upgrade_y = start_y + _add_row + 64 + _vadd + 64*i;
							var _selected_upgrade_number = real(_current_upgrade);
						} else {
							draw_sprite_stretched_ext(s_upgrades, real(_current_upgrade), start_x + _add + _add2, start_y + _add_row + _vadd + 64*i - 7*4, 14*4, 14*4, c_white, 1);
						}
						
						_add2 += 16*4;
						_current_upgrade = "";
					}
				}
				
				#region column movement
				if _current_selection = selected_leaderboard {
					if selected_leaderboard = i and selected_leaderboard != -1 {
						if selected_column >= _total_upgrade_number {
							selected_column = 0;
						}
					
						//draw_sprite_stretched_ext(s_button_switch, 0, start_x + _add + (selected_column mod 11) * 64, start_y + (_add_row) - (_add_row - _start_add_row) + ((selected_column div 11)) * 64 + _vadd + 64*i - 7*4, 14*4, 14*4, c_white, 1);
						
						if keyboard_check_pressed(global.key[ctrl.right]) || gamepad_button_check_pressed(0, gp_padr) {
							selected_column++;
							if selected_column >= _total_upgrade_number {
								selected_column = 0;
							}
						} else if keyboard_check_pressed(global.key[ctrl.left]) || gamepad_button_check_pressed(0, gp_padl) {
							selected_column--;
							if selected_column < 0 selected_column = _total_upgrade_number-1;
						} else if keyboard_check_pressed(global.key[ctrl.forward]) || gamepad_button_check_pressed(0, gp_padu) {
							selected_column -= 10;
							if selected_column < 0 {
								selected_column = 0;
								selected_leaderboard--;
								if selected_leaderboard < 0 selected_leaderboard = 9;
							}
						} else if keyboard_check_pressed(global.key[ctrl.backward]) || gamepad_button_check_pressed(0, gp_padd) {
							selected_column += 10;
							if selected_column >= _total_upgrade_number {
								selected_column = selected_column mod 10;
								selected_leaderboard++;
								if selected_leaderboard > 9 selected_leaderboard = 0;
							}
						}
					}
				}
				#endregion
			} else if selected_leaderboard = i {
				if keyboard_check_pressed(global.key[ctrl.forward]) {
					selected_column = 0;
					selected_leaderboard--;
					if selected_leaderboard < 0 selected_leaderboard = 9;
				} else if keyboard_check_pressed(global.key[ctrl.backward]) {
					selected_column = 0;
					selected_leaderboard++;
					if selected_leaderboard > 9 selected_leaderboard = 0;
				}
			}
		}
		
		draw_set_halign(fa_middle);
		draw_text(_upgrade_x, _upgrade_y, upgrade_name[_selected_upgrade_number]);
		draw_set_halign(fa_left);
	}
}