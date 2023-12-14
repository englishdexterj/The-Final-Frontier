function sc_draw_menu_controls(scale) {
	
	for (var i = 0; i < 5; i++) {
		for (var j = 0; j < 10; j++) {
			if i*10 + j = selected_controls_y*10 + selected_controls_x {
				var _c = c_white;
			} else var _c = c_gray;
			
			draw_sprite_stretched_ext(s_controls_keyboard, i*10 + j, 256 + j*16*scale, 256 + 128 + i*16*scale, 16*scale, 16*scale, _c, 1);
		}
	}
	
	for (var i = 0; i < array_length(global.key); i++) {
		var letter = global.key[i];
		if letter = vk_escape letter = "Escape";
		else if letter = vk_space letter = "Space";
		else letter = chr(letter);
		draw_text(256, 256 + i*64, string(letter));
	}
}