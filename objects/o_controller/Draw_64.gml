if debug = 1 {
	draw_set_halign(fa_left);
	draw_text(display_get_width()/2 + 1024 - 128, 16, string(steam_initialised()));
	draw_text(display_get_width()/2 + 1024, 16, "S:" + string(spawn) + " L:" + string(spawn_level));
}
