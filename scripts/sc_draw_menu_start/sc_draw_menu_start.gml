function sc_draw_menu_start() {
	if sel_menu = 8 {
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_set_font(f_score);
		
		var _yy = view_hport[0]/16;
		var _xx = 60;
		var scale = 8;
		
		#region draw characters and ascension level
		for (var i = 0; i < 5; i++) {
			if i = global.selected_character {
				if selected_character_y = 0 {
					if gamepad_is_connected(0) var sub = 4;
					else var sub = 1;
				}
				else var sub = 0;
				var _a = 1;
			} else {
				var sub = 0;
				var _a = 0.5;
			}
			
			var sub_menu = 0;
			if global.ascension_modifier_max[i] > 0 {
				var sub_menu = 2;
			}
			
			draw_sprite_stretched_ext(s_start_menu, sub + sub_menu, _xx + sprite_get_width(s_start_menu)*scale*i, _yy, sprite_get_width(s_start_menu)*scale, sprite_get_height(s_start_menu)*scale, c_white, _a);
			
			if global.ascension_modifier_max[i] = -1 var _c = c_black;
			else var _c = c_white;
			draw_sprite_stretched_ext(s_menu_characters, i*array_length(global.color_modifier_purchased[global.selected_character]) + global.color_modifier[i], _xx + 8*scale + sprite_get_width(s_start_menu)*scale*i, _yy + 12*scale, sprite_get_width(s_menu_characters)*(scale*3/4), sprite_get_height(s_menu_characters)*(scale*3/4), _c, _a);
			draw_set_color(c_white);
			
			if global.ascension_modifier_max[i] > 0 {
				draw_set_halign(fa_right);
				draw_set_alpha(_a);
				draw_text(_xx + sprite_get_width(s_start_menu)*scale*(i+0.5), _yy + 5*scale, string(global.ascension_modifier_max[i]));
				draw_set_alpha(1);
				draw_set_halign(fa_middle);
			}
		}
		#endregion
		
		#region draw ascension bar
		if global.ascension_modifier_max[global.selected_character] > 0 {
			if selected_character_y	= 1 {
				if pressing_left var sub = 2;
				else if pressing_right var sub = 3;
				else var sub = 1;
			} else var sub = 0;
			draw_set_alpha(1);
		} else {
			var sub = 0;
			draw_set_alpha(0.5);
		}
		
		_yy += 2*scale + sprite_get_height(s_start_menu)*scale;
		draw_sprite_stretched(s_start_menu_ascension_bar, sub, _xx + sprite_get_width(s_start_menu)*scale*3, _yy, sprite_get_width(s_start_menu_ascension_bar)*scale, sprite_get_height(s_start_menu_ascension_bar)*scale);
		
		draw_set_font(f_score_small);
		draw_set_color(c_gray);
		if global.ascension_modifier_max[global.selected_character] > 0 {
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_ascension_bar)*scale/2, _yy - 4*scale + sprite_get_height(s_start_menu_ascension_bar)*scale/2, "Unlocked " + string(global.ascension_modifier_max[global.selected_character]) + "/15");
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_ascension_bar)*scale/2, _yy + 4*scale + sprite_get_height(s_start_menu_ascension_bar)*scale/2, string(ascension_text[global.ascension_modifier[global.selected_character]]));
			draw_set_color(c_white);
			draw_set_font(f_score);
			if global.ascension_modifier[global.selected_character] = 0 draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_ascension_bar)*scale/2, _yy + sprite_get_height(s_start_menu_ascension_bar)*scale/2, "Threat " + string(global.ascension_modifier[global.selected_character]));
			else {
				draw_set_color(make_color_rgb(177,88,84));
				draw_sprite(s_menu_gameover_icons, 0, _xx + sprite_get_width(s_start_menu)*scale*3 + scale*37, _yy + sprite_get_height(s_start_menu_ascension_bar)*scale/2 - 3*scale);
				draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_ascension_bar)*scale/2, _yy + sprite_get_height(s_start_menu_ascension_bar)*scale/2, "Threat " + string(global.ascension_modifier[global.selected_character]));
				draw_set_color(c_white);
			}
			
		} else {
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_ascension_bar)*scale/2, _yy - 4*scale + sprite_get_height(s_start_menu_ascension_bar)*scale/2, "Unlocked " + "0/15");
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_ascension_bar)*scale/2, _yy + 4*scale + sprite_get_height(s_start_menu_ascension_bar)*scale/2, "Beat Wave 50");
			
			draw_set_color(c_white);
			draw_set_font(f_score);
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_ascension_bar)*scale/2, _yy + sprite_get_height(s_start_menu_ascension_bar)*scale/2, "Threat Locked");
		}
		#endregion
		
		#region draw description
		if global.ascension_modifier_max[global.selected_character] >= 0 draw_set_alpha(1);
		else draw_set_alpha(0.5);
		draw_sprite_stretched(s_start_menu_description, 0, _xx, _yy, sprite_get_width(s_start_menu_description)*scale, sprite_get_height(s_start_menu_description)*scale);
		
		var _desc_yy = 1.5;
		draw_text(_xx + sprite_get_width(s_start_menu_description)*scale/2, _yy + _desc_yy*8*scale, character[global.selected_character][0]); _desc_yy++;
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(_xx + 8*scale, _yy + _desc_yy*8*scale, "HP: " + string(character[global.selected_character][1])); _desc_yy++;
		draw_text(_xx + 8*scale, _yy + _desc_yy*8*scale, "Starter Weapon: " + string(character[global.selected_character][2])); _desc_yy++;
		draw_text(_xx + 8*scale, _yy + _desc_yy*8*scale, "Base Speed: " + string(character[global.selected_character][5])); _desc_yy++;
		draw_text(_xx + 8*scale, _yy + _desc_yy*8*scale, character[global.selected_character][3]); _desc_yy++;
		
		draw_set_valign(fa_middle);
		draw_set_halign(fa_middle);
		_yy += 2*scale + sprite_get_height(s_start_menu_ascension_bar)*scale;
		#endregion
		
		#region draw start button
		var _sx = 0;
		draw_set_alpha(1);
		if selected_character_y = 2 {
			if pressing {
				var _sx = 1;
				var sub = 3;
			} else var sub = 2;
		} else {
			var sub = 0;
		}
		
		draw_set_font(f_score_large);
		draw_sprite_stretched(s_start_menu_start_button, sub, _xx + sprite_get_width(s_start_menu)*scale*3, _yy, sprite_get_width(s_start_menu_start_button)*scale, sprite_get_height(s_start_menu_start_button)*scale);
		if global.ascension_modifier_max[global.selected_character] >= 0 and global.color_modifier_purchased[global.selected_character][global.color_modifier[global.selected_character]] = 1 {
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, _yy + _sx*2*scale -4*scale + sprite_get_height(s_start_menu_start_button)*scale/2, "Start");
			
			draw_set_font(f_score);
			draw_set_color(c_gray);
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, 
					  _yy + _sx*2*scale + 4*scale + sprite_get_height(s_start_menu_start_button)*scale/2, string(color[global.color_modifier[global.selected_character]][2]));
		} else if global.color_modifier_purchased[global.selected_character][global.color_modifier[global.selected_character]] = 0 and global.ascension_modifier_max[global.selected_character] >= 0 {
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, _yy + _sx*2*scale - 4*scale + sprite_get_height(s_start_menu_start_button)*scale/2, "Purchase");
			draw_set_font(f_score);
			draw_set_color(c_gray);
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, 
					  _yy + _sx*2*scale - 12*scale + sprite_get_height(s_start_menu_start_button)*scale/2, string(color[global.color_modifier[global.selected_character]][2]));
			
			draw_sprite_stretched(s_menu_gameover_icons, 1, _xx - 8*scale - 2*string_length(string(color[global.color_modifier[global.selected_character]][1]))*scale + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, 
														 _yy + _sx*2*scale + scale + sprite_get_height(s_start_menu_start_button)*scale/2, 
														 sprite_get_width(s_menu_gameover_icons), 
														 sprite_get_height(s_menu_gameover_icons));
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, 
					  _yy + _sx*2*scale + 4*scale + sprite_get_height(s_start_menu_start_button)*scale/2, string(color[global.color_modifier[global.selected_character]][1]));
			draw_set_color(c_white);
		} else {
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, _yy + _sx*2*scale - 4*scale + sprite_get_height(s_start_menu_start_button)*scale/2, "Unlock");
			draw_set_font(f_score);
			draw_set_color(c_gray);
			draw_sprite_stretched(s_menu_gameover_icons, 1, _xx - 8*scale - 2*string_length(string(character[global.selected_character][4]))*scale + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, 
														 _yy + _sx*2*scale + scale + sprite_get_height(s_start_menu_start_button)*scale/2, 
														 sprite_get_width(s_menu_gameover_icons), 
														 sprite_get_height(s_menu_gameover_icons));
			draw_text(_xx + sprite_get_width(s_start_menu)*scale*3 + sprite_get_width(s_start_menu_start_button)*scale/2, 
					  _yy + _sx*2*scale + 4*scale + sprite_get_height(s_start_menu_start_button)*scale/2, string(character[global.selected_character][4]));
			draw_set_color(c_white);
		}
		draw_set_font(f_score);
		
		draw_set_alpha(1);
		#endregion
	}
}