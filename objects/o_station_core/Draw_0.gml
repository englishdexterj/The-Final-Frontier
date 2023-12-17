if sprite_exists(sprite_index) {
	shader_set(sh_glisten);
	gpu_set_blendmode(bm_normal);
	shader_set_uniform_f(shader_time, time);
	shader_set_uniform_f(shader_glisten, .6);
	shader_set_uniform_f(shader_alpha, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x + (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, c_white, flash_alpha);
	draw_sprite_ext(sprite_index, image_index, x - (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, c_white, flash_alpha);
	shader_reset();
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