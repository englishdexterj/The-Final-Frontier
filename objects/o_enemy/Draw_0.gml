if sprite_exists(sprite_index) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x + (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, c_white, flash_alpha);
	draw_sprite_ext(sprite_index, image_index, x - (room_width - view_wport[0]), y, image_xscale, image_yscale, image_angle, c_white, flash_alpha);
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

if global.debug_pathing {
	if room = menu draw_set_font(f_score);
	else draw_set_font(f_score_large);
	
	var length = abs((60+(size-1)*5)*(60+(size-1)*5)*global.scale*global.scale) + abs((60+(size-1)*5)*(60+(size-1)*5)*global.scale*global.scale);
	if length != 0 length = sqrt(length);


	if variable_instance_exists(id, "target") and instance_exists(target) {
		var ang_diff = round(sc_angdiff(1, target)/10) * 10 + round(direction/10)*10;
		var target_angle = point_direction(x, y, target.x, target.y);
		target_angle = round(target_angle / 10) * 10;
	
		if target_angle > 180 {
			target_angle -= 360;
		} else if target_angle < -180 {
			target_angle += 360;
		}

		var targ_ang = point_direction(x, y, target.x, target.y);
		draw_line(x + lengthdir_x(30*global.scale, targ_ang + 90), y + lengthdir_y(30*global.scale, targ_ang + 90),
					   target.x + lengthdir_x(30*global.scale, targ_ang + 90), target.y + lengthdir_y(30*global.scale, targ_ang + 90))
		draw_line(x + lengthdir_x(30*global.scale, targ_ang - 90), y + lengthdir_y(30*global.scale, targ_ang - 90),
					   target.x + lengthdir_x(30*global.scale, targ_ang - 90), target.y + lengthdir_y(30*global.scale, targ_ang - 90))
		draw_line(x, y, target.x, target.y);
	} else {
		ang_diff = 0;
		target_angle = 0;
	}


	for (var i = 0; i <= 350; i+= 10) {
		if !col[i/10] draw_set_color(c_white);
		else draw_set_color(c_red);
	
		if i = move_direction and i = target_angle draw_set_color(c_orange);
		else if i = target_angle draw_set_color(c_purple);
		else if i = move_direction draw_set_color(c_green);
	
		draw_line(x, y, x + lengthdir_x(length, i), y + lengthdir_y(length, i));
		draw_text(x + lengthdir_x(length*1.1, i), y + lengthdir_y(length*1.1, i), round(safety[i/10]));
	}
	draw_set_color(c_white);
}
