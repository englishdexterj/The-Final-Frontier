function sc_draw_menu_bestiary(_xx, _yy, scale){
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_font(f_score);

	if sel_menu = 2 { //bestiary
		draw_set_color(c_white);
		var xx = _xx + 10*scale;
		var yy = _yy + 10*scale;
		
		draw_sprite_stretched(s_bestiary, 0, _xx, _yy, sprite_get_width(s_bestiary)*scale, sprite_get_height(s_bestiary)*scale);
		for (var k = 0; k < array_length(global.enemy); k++) {
			var i = floor(k / 4);
			var j = k mod 4;
			if k = selected_bestiary_y*4 + selected_bestiary_x var sel = c_gray;
			else var sel = c_white;
		
			var icon = 0;
			if global.stats[k, 1] > 0 {
				var t1 = true;
				var _spr = 0;
				if global.stats[k, 2] > 0 {
					var t2 = true;
					var _spr = 1;
					if global.stats[k, 3] > 0 {
						var _spr = 2;
						var t3 = true;
					} else var t3 = false;
				} else var t2 = false;
			
				var ks = global.stats[k, 1];
				var icon = 0;
			
				if ks >= 1000 icon = 10;
				else if ks >= 500 icon = 9;
				else if ks >= 250 icon = 8;
				else if ks >= 100 icon = 7;
				else if ks >= 50 icon = 6;
				else if ks >= 10 icon = 5;
			} else {
				t1 = false;
				var _spr = 0;
			}
		
			draw_sprite_stretched_ext(s_bestiary_icon, icon, xx + j*(sprite_get_width(s_bestiary_icon)+4)*scale, yy + i*(sprite_get_height(s_bestiary_icon)+4)*scale, sprite_get_width(s_bestiary_icon)*scale, sprite_get_height(s_bestiary_icon)*scale, sel, image_alpha);
			if global.stats[k, 1] > 0 var _color = c_white;
			else var _color = c_black;
			draw_sprite_stretched_ext(s_bestiary_index, k*3 + _spr, xx + scale + j*(sprite_get_width(s_bestiary_icon)+4)*scale, yy + scale + i*(sprite_get_height(s_bestiary_icon)+4)*scale, sprite_get_width(s_bestiary_index)*scale/24, sprite_get_height(s_bestiary_index)*scale/24, _color, image_alpha);
		}
		draw_sprite_stretched(s_bestiary_textbox, 0, xx + 137*scale, yy, sprite_get_width(s_bestiary_textbox)*scale, sprite_get_height(s_bestiary_textbox)*scale);
	
		var _y = 0;
		if selected_bestiary_y >= 0 {
			if global.stats[selected_bestiary_y*4 + selected_bestiary_x, 1] > 0 {
				draw_text(xx + 137*scale + 62*scale, yy + 8*scale, string(global.stats[selected_bestiary_y*4 + selected_bestiary_x, 0])); _y++;
				draw_set_halign(fa_left);
				if global.stats[selected_bestiary_y*4 + selected_bestiary_x, 1] > 0 {
					draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "L1 Kills: " + string(global.stats[selected_bestiary_y*4 + selected_bestiary_x, 1])); _y++;
				}
				if global.stats[selected_bestiary_y*4 + selected_bestiary_x, 2] > 0 {
					draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "L2 Kills: " + string(global.stats[selected_bestiary_y*4 + selected_bestiary_x, 2])); _y++;
				}
				if global.stats[selected_bestiary_y*4 + selected_bestiary_x, 3] > 0 {
					draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "L3 Kills: " + string(global.stats[selected_bestiary_y*4 + selected_bestiary_x, 3])); _y++;
				}
			
				draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "Health: " + string(global.info[selected_bestiary_y*4 + selected_bestiary_x, 0])); _y++;
				draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "Projectile: " + string(global.info[selected_bestiary_y*4 + selected_bestiary_x, 1])); _y++;
				draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "Points: " + string(global.info[selected_bestiary_y*4 + selected_bestiary_x, 2])); _y++;
				draw_set_valign(fa_top);
				draw_text(xx + 137*scale + 4*scale, yy + 8*scale + _y*8*scale, "Info: " + string(global.info[selected_bestiary_y*4 + selected_bestiary_x, 3])); _y++;
			} else {
				draw_text(xx + 137*scale + 62*scale, yy + 8*scale, "???");
			}
		}
	}
}