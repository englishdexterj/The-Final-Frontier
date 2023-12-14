if ready {
	/*
	draw_set_color(color);
	switch points {
		case 25:
			draw_set_font(f_score_popup_italic);
			break;
		case 50:
			draw_set_font(f_score_popup);
			break;
		case 100:
			draw_set_font(f_score_popup);
			break;
		case 200:
			draw_set_font(f_score_popup_bold);
			break;
		case 400:
			draw_set_font(f_score_popup_bold_italic);
			break;
		case 800:
			draw_set_font(f_score_popup_bold_italic);
			break;
		case 1600:
			draw_set_font(f_score_popup_bold_italic);
			break;
		case 6400:
			draw_set_font(f_score_popup_bold_italic);
			break;
		default:
			draw_set_font(f_score_popup);
			break;
	}
	//draw_text_transformed(x, y, string(points), scale, scale, image_angle);
	*/
	
	if points >= 800 {
		shader_set(sh_glisten_background);
		gpu_set_blendmode(bm_normal);
		shader_set_uniform_f(shader_time, time);
		shader_set_uniform_f(shader_alpha, clamp(alpha, 0, 1));
		draw_sprite_ext(s_points, subimage, x, y, scale, scale, image_angle, c_white, 1);
		shader_reset();
	} else if points >= 200 {
		shader_set(sh_glisten);
		gpu_set_blendmode(bm_normal);
		shader_set_uniform_f(shader_time, time);
		shader_set_uniform_f(shader_alpha, clamp(alpha, 0, 1));
		draw_sprite_ext(s_points, subimage, x, y, scale, scale, image_angle, c_white, 1);
		shader_reset();
	} else {
		draw_sprite_ext(s_points, subimage, x, y, scale, scale, image_angle, c_white, clamp(alpha, 0, 1));
	}
}