function sc_draw_menu_buttons(pause_x, pause_y, scale) {
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(f_score);
	
	if sel_menu = 3 { //controls
		draw_text(8*scale, 8*scale, "Hold Tab to Reset Controls");
	} else if sel_menu = 8 exit;
	
	draw_set_halign(fa_middle);
	
	var _x = 0;
	if sel_menu = 2 var _y = -16*scale;
	else if sel_menu = 8 {
		var _y = (64+24)*scale;
		var _x = (128+16)*scale;
	} else var _y = 0;
	
	for (var i = 0; i < array_length(selection[sel_menu]); i++) {
		var yy = 0;
	
		if selection[sel_menu, i] = "Volume" {
			draw_sprite_stretched(s_button_volume, global.volume/10, pause_x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
			if selected = i {
				draw_set_color(c_white);
				if keyboard_check(global.key[ctrl.left]) {
					draw_sprite_stretched(s_button_volume_arrows, 1, pause_x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
				} else if keyboard_check(global.key[ctrl.right]) {
					draw_sprite_stretched(s_button_volume_arrows, 2, pause_x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
				} else {
					draw_sprite_stretched(s_button_volume_arrows, 0, pause_x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
				}
			} else {
				draw_set_color(c_gray);
				draw_sprite_stretched(s_button_volume_arrows, 3, pause_x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
			}
			draw_text(pause_x + sprite_get_width(s_button_volume)*scale/2, pause_y + i*16*scale + yy + _y + sprite_get_height(s_button_volume)*scale/2, "Volume");
		} else if selection[sel_menu, i] = "Key" {
				if selected = i {
					if (sel_menu = 2 and selected_bestiary_y = -1) or sel_menu != 2 draw_set_color(c_white);
					else draw_set_color(c_gray);
					if pressing = selected {
						yy += scale/2;
						draw_sprite_stretched(s_button, 1, pause_x, pause_y + i*16*scale/2 + _y + 8*scale, sprite_get_width(s_button)*scale, sprite_get_height(s_button)*scale/2);
					} else {
						draw_sprite_stretched(s_button, 0, pause_x, pause_y + i*16*scale/2 + _y + 8*scale, sprite_get_width(s_button)*scale, sprite_get_height(s_button)*scale/2);
					}
				} else {
					draw_set_color(c_gray);
					draw_sprite_stretched(s_button, 2, pause_x, pause_y + i*16*scale/2 + _y + 8*scale, sprite_get_width(s_button)*scale, sprite_get_height(s_button)*scale/2);
				}
				
				var letter = global.key[i-1];
				if letter = vk_escape letter = "Escape";
				else if letter = vk_space letter = "Space";
				else if letter = vk_up letter = "Up";
				else if letter = vk_down letter = "Down";
				else if letter = vk_left letter = "Left";
				else if letter = vk_right letter = "Right";
				else letter = chr(letter);
				
				if selected_assign = i-1 letter = "...";
				
				draw_set_halign(fa_left);
				draw_text(pause_x + 4*scale, pause_y + i*16*scale/2 + yy + _y + 5*scale + sprite_get_height(s_button)*scale/2, string(key_word[i-1]) + string(letter));
				draw_set_halign(fa_middle);
				
		} else if selection[sel_menu, i] = "Ascension" {
			draw_sprite_stretched(s_button_volume, global.volume/10, pause_x + _x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
			if selected = i {
				draw_set_color(c_white);
				if keyboard_check(global.key[ctrl.left]) {
					draw_sprite_stretched(s_button_volume_arrows, 1, pause_x + _x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
				} else if keyboard_check(global.key[ctrl.right]) {
					draw_sprite_stretched(s_button_volume_arrows, 2, pause_x + _x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
				} else {
					draw_sprite_stretched(s_button_volume_arrows, 0, pause_x + _x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
				}
			} else {
				draw_set_color(c_gray);
				draw_sprite_stretched(s_button_volume_arrows, 3, pause_x + _x, pause_y + i*16*scale + _y, sprite_get_width(s_button_volume)*scale, sprite_get_height(s_button_volume)*scale);
			}
			draw_text(pause_x + sprite_get_width(s_button_volume)*scale/2 + _x, pause_y + i*16*scale + yy + _y + sprite_get_height(s_button_volume)*scale/2, "Volume");
		} else {
			if selected = i {
				if (sel_menu = 2 and selected_bestiary_y = -1) or sel_menu != 2 draw_set_color(c_white);
				else draw_set_color(c_gray);
				if pressing = selected {
					yy += scale;
					draw_sprite_stretched(s_button, 1, pause_x + _x, pause_y + i*16*scale + _y, sprite_get_width(s_button)*scale, sprite_get_height(s_button)*scale);
				} else {
					draw_sprite_stretched(s_button, 0, pause_x + _x, pause_y + i*16*scale + _y, sprite_get_width(s_button)*scale, sprite_get_height(s_button)*scale);
				}
			} else {
				draw_set_color(c_gray);
				draw_sprite_stretched(s_button, 2, pause_x + _x, pause_y + i*16*scale + _y, sprite_get_width(s_button)*scale, sprite_get_height(s_button)*scale);
			}
	
			draw_text(pause_x + sprite_get_width(s_button)*scale/2 + _x, pause_y + i*16*scale + yy + _y + sprite_get_height(s_button)*scale/2, selection[sel_menu, i]);
			draw_set_color(c_white);
		}
	}
}