function sc_draw_menu_stats(start_x, start_y) {
	if sel_menu = 9 { //stats
		if stats_initialized {
			start_y += 64;
			var _add_y = 0;
			var _add_x = 0;
		
			draw_set_halign(fa_middle);
			draw_text(start_x + 1536/2, start_y + stats_adjust_y - 64, "Stats");
			draw_set_halign(fa_left);
		
			for (var i = 0; i < array_length(stats_menu); i++) {
				if i mod 2 = 1 draw_set_color(make_color_rgb(160, 160, 160));
				else draw_set_color(c_white);
				draw_text(start_x + _add_x, start_y + stats_adjust_y + _add_y, stats_menu[i]); _add_x += 1536	draw_text(start_x + _add_x, start_y + stats_adjust_y + _add_y, stats_value[i]); _add_y += 64; _add_x = 0;
			}
		}
	}
}