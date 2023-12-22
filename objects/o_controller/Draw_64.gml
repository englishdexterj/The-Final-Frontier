if debug = 1 {
	draw_set_halign(fa_left);
	draw_set_font(f_score);
	draw_set_alpha(.5);
	var _add = 0;
	draw_text(64, 96, "Steam:" + string(steam_initialised()) + 
					  " Spawn (+):" + string(spawn) + 
					  " Level (-):" + string(spawn_level) +
					  " Total Enemies:" + string(global.active_enemies) +
					  " Idle Enemies:" + string(global.idle_enemies)); _add += 64;
	draw_text(64, 96+_add, "O: Close Menu"); _add += 64;
	draw_text(64, 96+_add, "R: Enemy Spawn %"); _add += 64;
	draw_text(64, 96+_add, "P: Round +12"); _add += 64;
	draw_text(64, 96+_add, "L: 1000 Pts"); _add += 64;
	draw_text(64, 96+_add, "K: Pathing"); _add += 64;
	draw_text(64, 96+_add, "M: Invincibility"); _add += 64;
	draw_text(64, 96+_add, "0: HP"); _add += 64;
	draw_text(64, 96+_add, "Y + H: Reset Stats"); _add += 64;
	draw_set_alpha(1);
}
