if sprite_exists(sprite_index) {
	draw_sprite_ext(sprite_index, image_index + index_add, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index + index_add, x + (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, c_white, flash_alpha);
	draw_sprite_ext(sprite_index, image_index + index_add, x - (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, c_white, flash_alpha);
}

if flash_alpha > 0 {
	shader_set(sh_flash);

	if sprite_exists(sprite_index) {
		draw_sprite_ext(sprite_index, image_index + index_add, x, y, image_xscale, image_yscale, image_angle, flash_color, flash_alpha);
		draw_sprite_ext(sprite_index, image_index + index_add, x + (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, flash_color, flash_alpha);
		draw_sprite_ext(sprite_index, image_index + index_add, x - (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, flash_color, flash_alpha);
	}

	shader_reset();
}