function sc_draw_menu_achievements(_xx, _yy, scale) {
	if sel_menu = 7 and global.steam_api { //achievements
		draw_set_valign(fa_middle);
		draw_set_font(f_score);
		
		var _sprite_size = 256;
		
		draw_set_color(c_white);
		var xx = _xx;
		var yy = _yy + achievements_adjust_y;
		
		//draw_sprite_stretched(s_bestiary, 0, _xx, _yy, sprite_get_width(s_bestiary)*scale, sprite_get_height(s_bestiary)*scale);
		for (var k = 0; k < array_length(achievements); k++) {
			var i = floor(k / 8)+1;
			var j = k mod 8;
			
			//if achievements[k, 0] >= achievements[k, 6] {
			var _sx = xx + j*(_sprite_size+4)*scale;
			var _sy = yy + i*(_sprite_size+24)*scale;
			var _sy2 = yy + (i+1)*(_sprite_size+24)*scale;
			if achievements[k, 7] {
				draw_sprite_stretched_ext(achievements[k, 3], achievements[k, 4], _sx, _sy, (_sprite_size)*scale, (_sprite_size)*scale, c_white, image_alpha);
			} else {
				draw_sprite_stretched_ext(achievements[k, 3], achievements[k, 5], _sx, _sy, (_sprite_size)*scale, (_sprite_size)*scale, c_white, image_alpha);
				draw_sprite_stretched_ext(s_ach_progress, 0, _sx, _sy2 - 20*scale, (_sprite_size)*scale, (16)*scale, c_white, image_alpha);
				draw_sprite_stretched_ext(s_ach_progress_bar, 0, _sx + 4*scale, _sy2 - 16*scale, ((_sprite_size)*scale - 8*scale) * (achievements[k, 0]/achievements[k, 6]), (8)*scale, c_white, image_alpha);
			}
			
			if k = selected_achievement_y*8 + selected_achievement_x {
				draw_sprite_stretched_ext(s_ach_selector, 0, _sx, _sy, (_sprite_size)*scale, (_sprite_size)*scale, c_white, image_alpha);
				
				//draw_sprite_stretched_ext(s_ach_textbox, 0, _sx - 512*scale, _sy - 64*scale, 1024*scale, 64*scale, c_white, image_alpha);
				draw_set_halign(fa_center);
				draw_set_color(c_white);
				draw_text(_sx + (_sprite_size) * scale/2, _sy - 32*scale, string(achievements[k, 1]));
			}
		}
		//draw_sprite_stretched(s_bestiary_textbox, 0, xx + 137*scale, yy, sprite_get_width(s_bestiary_textbox)*scale, sprite_get_height(s_bestiary_textbox)*scale);
	
		var _y = 0;
		if selected_achievement_y >= 0 {
			/*
			if global.stats[selected_achievement_y*4 + selected_achievement_x, 1] > 0 {
				draw_text(xx + 137*scale + 62*scale, yy + 8*scale, string(global.stats[selected_achievement_y*4 + selected_achievement_x, 0])); _y++;
				draw_set_halign(fa_left);
				if global.stats[selected_achievement_y*4 + selected_achievement_x, 1] > 0 {
					draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "L1 Kills: " + string(global.stats[selected_achievement_y*4 + selected_achievement_x, 1])); _y++;
				}
				if global.stats[selected_achievement_y*4 + selected_achievement_x, 2] > 0 {
					draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "L2 Kills: " + string(global.stats[selected_achievement_y*4 + selected_achievement_x, 2])); _y++;
				}
				if global.stats[selected_achievement_y*4 + selected_achievement_x, 3] > 0 {
					draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "L3 Kills: " + string(global.stats[selected_achievement_y*4 + selected_achievement_x, 3])); _y++;
				}
			
				draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "Health: " + string(global.info[selected_achievement_y*4 + selected_achievement_x, 0])); _y++;
				draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "Projectile: " + string(global.info[selected_achievement_y*4 + selected_achievement_x, 1])); _y++;
				draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "Points: " + string(global.info[selected_achievement_y*4 + selected_achievement_x, 2])); _y++;
				draw_set_valign(fa_top);
				draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "Info: " + string(global.info[selected_achievement_y*4 + selected_achievement_x, 3])); _y++;
			} else {
				draw_text(xx + 137*scale + 62*scale, yy + 8*scale, "???");
			}
			*/
		}
	}
}