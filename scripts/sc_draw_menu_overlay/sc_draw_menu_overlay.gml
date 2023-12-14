function sc_draw_menu_overlay() {
	var scale = 8;
	var _x = 2560 - sprite_get_width(s_start_menu_coins)*scale;
	
	#region draw coins
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	
	draw_sprite_stretched(s_start_menu_coins, 0, _x, 0, sprite_get_width(s_start_menu_coins)*scale, sprite_get_height(s_start_menu_coins)*scale);
	draw_text(_x + sprite_get_width(s_start_menu_coins)*scale/4, sprite_get_height(s_start_menu_coins)*scale/2 + scale/2, string(global.coins));
	#endregion
}