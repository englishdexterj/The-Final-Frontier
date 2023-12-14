if levelup_menu = true {
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
	
draw_set_halign(fa_middle);
draw_set_color(c_red);
draw_text(xx/2, yy/12, "Level Up");
draw_set_color(c_white);
draw_text(xx/2, yy/12 + 64, string(global.level));
	
for (var i = -4; i < 5; i++) {
	for (var j = -4; j < 5; j++) {
		//if (i+4)*9 + (j+4) = selected draw_rectangle(xx/2 + j*16*scale - 8*scale, yy/2 + i*16*scale - 8*scale, xx/2 + (j+1)*16*scale - 8*scale, yy/2 + (i+1)*16*scale - 8*scale, true);
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		if upgrade[(i+4)*9 + (j+4), up.name] != ""
		&& (upgrade[(i+4)*9 + (j+4), up.req1] = -4 or upgrade[upgrade[(i+4)*9 + (j+4), up.req1], up.active] >= 1)
		&& (upgrade[(i+4)*9 + (j+4), up.req2] = -4 or upgrade[upgrade[(i+4)*9 + (j+4), up.req2], up.active] >= 1) {
			if (i+4)*9 + (j+4) = selected {
				if upgrade[(i+4)*9 + (j+4), up.active] = 0 {
					draw_set_color(c_dkgray);
					draw_text(xx/2 + j*16*scale, yy/2 + i*16*scale + 10*scale, string(upgrade[(i+4)*9 + (j+4), up.name]));
					draw_sprite_stretched_ext(s_upgrades, upgrade[(i+4)*9 + (j+4), up.sprite]+1, xx/2 + j*16*scale - 4*scale, yy/2 + i*16*scale - 4*scale, 8*scale, 8*scale, c_dkgray, image_alpha);
				} else {
					draw_set_color(c_white);
					draw_text(xx/2 + j*16*scale, yy/2 + i*16*scale + 10*scale, string(upgrade[(i+4)*9 + (j+4), up.name]));
					draw_sprite_stretched(s_upgrades, upgrade[(i+4)*9 + (j+4), up.sprite]+1, xx/2 + j*16*scale - 4*scale, yy/2 + i*16*scale - 4*scale, 8*scale, 8*scale);
				}
				
				if upgrade[(i+4)*9 + (j+4), up.active_max] > 1 {
					draw_set_font(f_score_small);
					draw_text(xx/2 + j*16*scale, yy/2 + i*16*scale + 6*scale, string(upgrade[(i+4)*9 + (j+4), up.active]) + "/" + string(upgrade[(i+4)*9 + (j+4), up.active_max]));
					draw_set_font(f_score);
				}
				draw_set_color(c_white);
			} else {
				
				if upgrade[(i+4)*9 + (j+4), up.active] = 0 {
					draw_set_color(c_dkgray);
					draw_sprite_stretched_ext(s_upgrades, upgrade[(i+4)*9 + (j+4), up.sprite], xx/2 + j*16*scale - 4*scale, yy/2 + i*16*scale - 4*scale, 8*scale, 8*scale, c_dkgray, image_alpha);
				} else {
					draw_sprite_stretched(s_upgrades, upgrade[(i+4)*9 + (j+4), up.sprite], xx/2 + j*16*scale - 4*scale, yy/2 + i*16*scale - 4*scale, 8*scale, 8*scale);
				}
				
				if upgrade[(i+4)*9 + (j+4), up.active_max] > 1 {
					draw_set_font(f_score_small);
					draw_text(xx/2 + j*16*scale, yy/2 + i*16*scale + 6*scale, string(upgrade[(i+4)*9 + (j+4), up.active]) + "/" + string(upgrade[(i+4)*9 + (j+4), up.active_max]));
					draw_set_font(f_score);
				}
				draw_set_color(c_white);
			}
		}
		
		
	}
}
}
