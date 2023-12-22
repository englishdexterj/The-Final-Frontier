if sprite_exists(sprite_index) {
	if laser_heat > 0 var _col = make_color_rgb(255, 255 - (laser_heat / max_hp)*255, 255 - (laser_heat / max_hp)*255);
	else var _col = c_white;
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _col, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x + (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, _col, flash_alpha);
	draw_sprite_ext(sprite_index, image_index, x - (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, _col, flash_alpha);
}

if flash_alpha > 0 {
	shader_set(sh_flash);

	if sprite_exists(sprite_index) {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flash_color, flash_alpha);
		draw_sprite_ext(sprite_index, image_index, x + (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, flash_color, flash_alpha);
		draw_sprite_ext(sprite_index, image_index, x - (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, flash_color, flash_alpha);
	}

	shader_reset();
}
