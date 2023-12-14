function sc_draw_menu_gameover() {
	draw_set_color(c_red);
	if variable_instance_exists(id, "new_highscore") and new_highscore { 
		draw_text(width, height - 512 - 64, "NEW HIGH SCORE");
	} else draw_text(width, height - 512 - 64, "GAME OVER");
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_text(width - 256 - 128, height - 512, "SCORE: " + string(final_score));
	draw_text(width - 256 - 128, height - 512 + 64, "WAVE: " + string(final_wave));
	draw_text(width - 256 - 128, height - 512 + 64*2, "LEVEL: " + string(final_level));
	
	//kills
	draw_sprite_stretched(s_menu_gameover_icons, 0, width - 256 - 128, height - 512 + 64*2 + 42, sprite_get_width(s_menu_gameover_icons), sprite_get_height(s_menu_gameover_icons));
	draw_text(width - 256 - 128 + 72, height - 512 + 64*3, string(killed_enemies));
	
	//coins
	draw_sprite_stretched(s_menu_gameover_icons, 1, width + 0 - 128, height - 512 + 64*2 + 42, sprite_get_width(s_menu_gameover_icons), sprite_get_height(s_menu_gameover_icons));
	
	var asc = global.ascension_modifier[global.selected_character];
	if asc > 0 draw_text(width + 0 - 128 + 72, height - 512 + 64*3, string(total_coins) + " x " + string(asc*2/10 + 1) + " = " + string(round(total_coins*(asc*2/10 + 1))));
	else draw_text(width + 0 - 128 + 72, height - 512 + 64*3, string(total_coins));
	
	var _y = 0;
	var _x = 0;
	draw_set_halign(fa_left);
	
	for (var i = 0; i < array_length(killed); i++) {
		for (var j = 0; j < 3; j++) {
			if i >= array_length(killed)-2 j+= 2;
			if killed[i, j] > 0 {
				draw_sprite_stretched_ext(s_bestiary_index, i*3 + j, width - 1280 + (256 + 112)*_x + (sprite_get_width(s_bestiary_index)/4)/2, height - 512 - (sprite_get_width(s_bestiary_index)/4)/2 + (_y+2)*(64+64+32), sprite_get_width(s_bestiary_index)/4, sprite_get_height(s_bestiary_index)/4, c_white, image_alpha);
				
				draw_sprite_stretched_ext(s_menu_gameover_icons, 0, width - 1280 + 256 - 20 + (256 + 112)*_x, height - 512 - 56 + (_y+2)*(64+64+32), sprite_get_width(s_menu_gameover_icons), sprite_get_height(s_menu_gameover_icons), c_white, image_alpha);
				draw_sprite_stretched_ext(s_menu_gameover_icons, 1, width - 1280 + 256 - 20 + (256 + 112)*_x, height - 512 + 16 + (_y+2)*(64+64+32), sprite_get_width(s_menu_gameover_icons), sprite_get_height(s_menu_gameover_icons), c_white, image_alpha);
				
				draw_set_color(c_ltgray);
				draw_text(width - 1280 + 256 + 52 + (256 + 112)*_x, height - 512 - 34 + (_y+2)*(64+64+32), string(killed[i, j]));
				draw_set_color(make_color_rgb(255, 255, 102));
				draw_text(width - 1280 + 256 + 52 + (256 + 112)*_x, height - 512 + 38 + (_y+2)*(64+64+32), string(killed[i, j]*global.info[i, 5]*(j+1))); _y++;
				
				if _y >= 6 { 
					_x++; _y = 0;
				}
			}
		}
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	
	
	/*
	draw_set_halign(fa_middle);
	draw_sprite_stretched_ext(s_menu_gameover_icons, 0, width - 1280 + 256, height - 192 - 96, sprite_get_width(s_menu_gameover_icons), sprite_get_height(s_menu_gameover_icons), c_white, image_alpha);
	draw_sprite_stretched_ext(s_menu_gameover_icons, 1, width - 1280 + 256 + 128, height - 192 - 96, sprite_get_width(s_menu_gameover_icons), sprite_get_height(s_menu_gameover_icons), c_white, image_alpha);
	
	for (var i = 0; i < array_length(killed); i++) {
		for (var j = 0; j < 3; j++) {
			if i >= array_length(killed)-2 j+= 2;
			if killed[i, j] >= 0 {
				draw_sprite_stretched_ext(s_bestiary_index, i*3 + j, width - 1280 + (256 + 128)*_x + (sprite_get_width(s_bestiary_index)/4)/2, height - 512 - (sprite_get_width(s_bestiary_index)/4)/2 + (_y+2)*(64+64+32), sprite_get_width(s_bestiary_index)/4, sprite_get_height(s_bestiary_index)/4, c_white, image_alpha);
				draw_text(width - 1280 + 256 + 20 + (256 + 128)*_x, height - 512 + (_y+2)*(64+64+32), string(killed[i, j]));
				
				draw_text(width - 1280 + 256 + 20 + 128 + (256 + 128)*_x, height - 512 + (_y+2)*(64+64+32), string(killed[i, j]*global.info[i, 5]*(j+1))); _y++;
				
				if _y >= 6 { 
					_x++; _y = 0;
					draw_sprite_stretched_ext(s_menu_gameover_icons, 0, width - 1280 + 256 + (256 + 128)*_x, height - 192 - 96, sprite_get_width(s_menu_gameover_icons), sprite_get_height(s_menu_gameover_icons), c_white, image_alpha);
					draw_sprite_stretched_ext(s_menu_gameover_icons, 1, width - 1280 + 256 + 128 + (256 + 128)*_x, height - 192 - 96, sprite_get_width(s_menu_gameover_icons), sprite_get_height(s_menu_gameover_icons), c_white, image_alpha);
				}
			}
		}
	}
	draw_set_halign(fa_left);
	*/
}