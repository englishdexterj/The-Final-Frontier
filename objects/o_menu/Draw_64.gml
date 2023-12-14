if setup = true {

draw_set_valign(fa_top);
draw_set_font(f_score);
draw_set_halign(fa_center);
draw_set_color(c_white);

#region draw level bar
if levelup_available {
	draw_sprite_stretched(s_cooldown_bar_piece, 2, 64, 32, (display_get_gui_width()-128), 64);
	draw_sprite_stretched(s_cooldown_bar_piece, 3 + current_second mod 2, 64, 32, (display_get_gui_width()-128), 64);
	draw_text(width, 32 + 8, "Upgrade Available");
	if !gamepad_is_connected(0) draw_text(width, 40 + 64, "Press " + chr(global.key[ctrl.select]));
	else draw_text(width, 40 + 64, "Press (A)");
	draw_set_halign(fa_left);
	//draw_set_color(c_red);
	draw_text(64 + 32, 32 + 8, "Level " + string(global.level));
	//draw_set_color(c_white);
	draw_set_halign(fa_center);
} else {
	draw_sprite_stretched(s_cooldown_bar_piece, 2, 64, 32, (display_get_gui_width()-128), 64);
	draw_sprite_stretched(s_cooldown_bar_piece, 3, 64, 32, ((floor(global.pts)-levelup_points_last)/(levelup_points-levelup_points_last))*(display_get_gui_width()-128), 64);
	draw_text(width, 32 + 8, string(floor(global.pts)) + " / " + string(levelup_points));
	draw_set_halign(fa_left);
	//draw_set_color(c_red);
	draw_text(64 + 32, 32 + 8, "Level " + string(global.level));
	//draw_set_color(c_white);
	draw_set_halign(fa_center);
}
#endregion

if global.spawn_level = 0 {
	draw_set_alpha(start_alpha);
	draw_set_color(c_red);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 256, string(character[global.selected_character][0]));
	draw_set_color(c_white);
	if global.ascension_modifier[global.selected_character] > 0 draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 256 + 64, "Threat " + string(global.ascension_modifier[global.selected_character]));
	draw_set_alpha(1);
}

if global.spawn_level = 1 {
	draw_set_color(c_red);
	draw_set_alpha(wave_alpha);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 128 - 64, "WAVE");
	draw_set_alpha(1);
	draw_set_color(c_white);
} else if global.asteroid_level = global.spawn_level {
	draw_set_color(c_red);
	draw_set_alpha(wave_alpha*4);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 128 - 64, "ASTEROIDS");
	draw_set_alpha(1);
	draw_set_color(c_white);
} else if global.spawn_level = global.next_boss_wave {
	draw_set_color(c_red);
	draw_set_alpha(wave_alpha*4);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 128 - 64, "BOSS");
	draw_set_alpha(1);
	draw_set_color(c_white);
}
draw_text_color(display_get_gui_width()/2, display_get_gui_height()/2 - 128, global.spawn_level, c_white, c_white, c_white, c_white, wave_alpha);

var yp = 16;
#region draw rammer and cloaking
if game_over = false && pause = false {
	if o_player.rammer {
		draw_sprite_ext(s_rammer, o_player.rammer_cooldown, width - 1216 + yp, height*2 - 64, 6, 6, 0, c_white, 1);
		yp += 96;
	}

	if o_player.cloaking {
		draw_sprite_ext(s_cloaking, o_player.cloaking_cooldown, width + min(yp, 72+16) - 1216, height*2 - 64, 6, 6, 0, c_white, 1);
		yp += 96;
	}
}
yp = clamp(yp, 0, 96*2-12);
#endregion

#region draw health
if game_over = false && pause = false {
	draw_sprite_stretched(s_cooldown_icons, 6, width - 1216 + yp + -1 * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
	
	var _yhp = 0;
	
	for (var i = ceil(o_player.hp); i >= 1; i--) {
		if i <= ceil(o_player.hp) {
			if i > o_player.hp sub = 0;
			else var sub = 4;
			
		} else var sub = 1;
		
		if sub = 0 and i = ceil(o_player.hp) {
			if o_player.healers > 0 draw_sprite_stretched(s_heat_bar, 5, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			else draw_sprite_stretched(s_heat_bar, 4, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			draw_sprite_stretched(s_heat_bar_cover, round((hp - floor(hp))*11) + 12, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		} else {
			if o_player.healers > 0 draw_sprite_stretched(s_heat_bar, 5, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			else draw_sprite_stretched(s_heat_bar, sub, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		}
	}
	_yhp += ceil(o_player.hp);

	if o_player.hull_level > 0 {
		for (var i = o_player.hull_level; i >= 1; i--) {
			if i <= o_player.hull_level {
				if i > o_player.hull_health sub = 0;
				else var sub = 9;
			
			} else var sub = 1;
		
			if sub = 0 and i = ceil(o_player.hull_health) {
				draw_sprite_stretched(s_heat_bar, 9, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
				draw_sprite_stretched(s_heat_bar_cover, round((o_player.hull_health - floor(o_player.hull_health))*11) + 12, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			} else {
				draw_sprite_stretched(s_heat_bar, sub, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			}
		}
		_yhp += o_player.hull_level;
	}
	
	if o_player.rammer {
		//draw_sprite_stretched(s_heat_bar_rammer, o_player.rammer_cooldown, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		//draw_sprite_stretched(s_rammer, o_player.rammer_cooldown, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		
	}
	
	var _shield = false;
	with o_shield {
		if !enemy {
			var shield = id;
			_shield = true;
		}
	}
	if _shield {
		var percent = (shield.image_xscale / 1) * (shield.max_hit_times);
		for (var i = shield.max_hit_times; i >= 1; i--) {
			if i <= shield.max_hit_times {
				if i > percent sub = 0;
				else var sub = 2;
			
			} else var sub = 1;
		
			if sub = 0 and i = ceil(percent) {
				draw_sprite_stretched(s_heat_bar, 2, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
				draw_sprite_stretched(s_heat_bar_cover, round((percent - floor(percent))*11) + 12, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			} else {
				draw_sprite_stretched(s_heat_bar, sub, width - 1216 + yp + (i - 1 + _yhp) * sprite_get_width(s_heat_bar)*4, height*2 - 92, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			}
		}
		_yhp += shield.max_hit_times;
	}
}
#endregion

#region draw cooldowns
if game_over = false && pause = false {
	draw_set_halign(fa_left);
	//draw_sprite_ext(s_cooldown_bar, 0, width + 768, height*2 - 64 - 32, 4, 4, 0, c_white, 1);
	var yy = 0;
	var xx = 240;

	if o_player.weapon_bullets > 0 {
		var heat_percent = o_player.heat;
		draw_sprite_stretched(s_cooldown_icons, 0, width + 516 + 9*sprite_get_width(s_heat_bar)*4 + xx - sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		for (var i = 6; i >= 1; i--) {
			if i > heat_percent var sub = 0;
			else var sub = 3;
			
			if sub = 0 and i = ceil(heat_percent) {
				draw_sprite_stretched(s_heat_bar, 3, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
				draw_sprite_stretched(s_heat_bar_cover, round((heat_percent - floor(heat_percent))*11), width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			} else {
				draw_sprite_stretched(s_heat_bar, sub, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			}
			if o_player.disabled draw_sprite_stretched(s_heat_bar, 8, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		}
		yy++;
	}

	if o_player.weapon_missiles > 0 {
		var heat_percent = o_player.missile_heat;
		draw_sprite_stretched(s_cooldown_icons, 3, width + 516 + 9*sprite_get_width(s_heat_bar)*4 + xx - sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		for (var i = 10; i >= 1; i--) {
			if i > heat_percent var sub = 0;
			else var sub = 5;
			
			if sub = 0 and i = ceil(heat_percent) {
				draw_sprite_stretched(s_heat_bar, 5, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
				draw_sprite_stretched(s_heat_bar_cover, round((heat_percent - floor(heat_percent))*11), width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			} else {
				draw_sprite_stretched(s_heat_bar, sub, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			}
			if o_player.disabled draw_sprite_stretched(s_heat_bar, 8, width + 516 + xx + 8*sprite_get_width(s_heat_bar)*4 - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		}
		yy++;
	}

	if o_player.weapon_lasers > 0 {
		var heat_percent = o_player.laser_heat;
		draw_sprite_stretched(s_cooldown_icons, 0, width + 516 + 9*sprite_get_width(s_heat_bar)*4 + xx - sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		for (var i = 10; i >= 1; i--) {
			if i > heat_percent var sub = 0;
			else var sub = 4;
			
			if sub = 0 and i = ceil(heat_percent) {
				draw_sprite_stretched(s_heat_bar, 4, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
				draw_sprite_stretched(s_heat_bar_cover, round((heat_percent - floor(heat_percent))*11), width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			} else {
				draw_sprite_stretched(s_heat_bar, sub, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			}
			if o_player.disabled draw_sprite_stretched(s_heat_bar, 8, width + 516 + xx + 8*sprite_get_width(s_heat_bar)*4 - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		}
		yy++;
	}

	if o_player.weapon_ion > 0 {
		var heat_percent = o_player.ion_heat;
		draw_sprite_stretched(s_cooldown_icons, 1, width + 516 + 9*sprite_get_width(s_heat_bar)*4 + xx - sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		for (var i = 6; i >= 1; i--) {
			if i > heat_percent var sub = 0;
			else var sub = 6;
			
			if sub = 0 and i = ceil(heat_percent) {
				draw_sprite_stretched(s_heat_bar, 6, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
				draw_sprite_stretched(s_heat_bar_cover, round((heat_percent - floor(heat_percent))*11), width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			} else {
				draw_sprite_stretched(s_heat_bar, sub, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
			}
			if o_player.disabled draw_sprite_stretched(s_heat_bar, 8, width + 516 + xx + 8*sprite_get_width(s_heat_bar)*4 - i * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		}
		yy++;
	}
	
	if o_player.drone_ship {
		var heat_percent = (o_player.drone_heat / 50);
		draw_sprite_stretched(s_cooldown_icons, 2, width + 516 + 9*sprite_get_width(s_heat_bar)*4 + xx - sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4, sprite_get_height(s_heat_bar)*4);
		
		var _w = 2;
		for (var i = 1; i <= o_player.drones_max; i++) {
			if i = o_player.drones + 1 sub = 0;
			else if i <= o_player.drones var sub = 9;
			else var sub = 0;
			
			if sub = 0 and i = o_player.drones + 1 {
				draw_sprite_stretched(s_heat_bar, 9, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * _w * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4*_w, sprite_get_height(s_heat_bar)*4);
				draw_sprite_stretched(s_heat_bar_cover, 11 - round((heat_percent - floor(heat_percent))*11), width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * _w * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4*_w, sprite_get_height(s_heat_bar)*4);
			} else {
				draw_sprite_stretched(s_heat_bar, sub, width + 516 + 8*sprite_get_width(s_heat_bar)*4 + xx - i * _w * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4*_w, sprite_get_height(s_heat_bar)*4);
			}
			if o_player.disabled draw_sprite_stretched(s_heat_bar, 8, width + 516 + xx + 8*sprite_get_width(s_heat_bar)*4 - i * _w * sprite_get_width(s_heat_bar)*4, height*2 - 92 - 96*yy, sprite_get_width(s_heat_bar)*4*_w, sprite_get_height(s_heat_bar)*4);
		}
		yy++;
	}
	
	draw_set_halign(fa_center);
	}
#endregion

#region pause menu
if pause {
	draw_set_color(c_black);
	draw_set_alpha(0.25);
	draw_rectangle(0, 0, room_height, room_width, false);
	draw_text(width, height - 256, "PAUSED");
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	sc_draw_menu_overlay();
	
	sc_draw_menu_bestiary(160, 180, 8);
	
	sc_draw_menu_topscores(display_get_gui_width()/16, display_get_gui_height()/16);
	
	sc_draw_menu_stats(display_get_gui_width()/16, display_get_gui_height()/16);
	
	if game_over sc_draw_menu_buttons(100, 120, 10);
	else sc_draw_menu_buttons(240, 180, 10);
	
}
#endregion

if game_over = true {
	sc_draw_menu_gameover();
}

}