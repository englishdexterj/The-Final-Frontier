if instance_exists(pt) && index = true {
	if station {
		if enemy {
			shader_set(sh_glisten);
			gpu_set_blendmode(bm_normal);
			shader_set_uniform_f(shader_time, time);
			shader_set_uniform_f(shader_glisten, .1);
			shader_set_uniform_f(shader_alpha, .5);
			draw_sprite_ext(sprite_index, image_index, pt.x, pt.y, image_xscale, image_yscale, image_angle, c_white, 1);
			shader_reset();
			
			/*
			shader_set(sh_ring);
			gpu_set_blendmode(bm_normal);
			shader_set_uniform_f(shader_color, c_white);
			shader_set_uniform_f(shader_inner, .1);
			shader_set_uniform_f(shader_outer, .6);
			shader_set_uniform_f(shader_time2, time2);
			shader_set_uniform_f(shader_frequency, 5);
			shader_set_uniform_f(shader_amplitude, .2);
			shader_set_uniform_f(shader_alpha2, .5);
			shader_set_uniform_f(shader_s_width, sprite_get_width(sprite_index));
			shader_set_uniform_f(shader_s_height, sprite_get_height(sprite_index));
			draw_sprite_ext(sprite_index, image_index, pt.x, pt.y, image_xscale, image_yscale, image_angle, c_white, 1);
			shader_reset();
			*/
		}
	} else {
		if enemy {
			shader_set(sh_glisten);
			gpu_set_blendmode(bm_normal);
			shader_set_uniform_f(shader_time, time);
			shader_set_uniform_f(shader_glisten, .25);
			shader_set_uniform_f(shader_alpha, clamp(1 - (hit_times / (max_hit_times*5/4)), 0, 1));
			draw_sprite_ext(s_shield_large, image_index, pt.x, pt.y, image_xscale, image_yscale, image_angle, c_white, 1);
			shader_reset();
		} else if !enemy {
			shader_set(sh_glisten);
			gpu_set_blendmode(bm_normal);
			shader_set_uniform_f(shader_time, time);
			shader_set_uniform_f(shader_glisten, .25);
			shader_set_uniform_f(shader_alpha, .5);
			draw_sprite_ext(s_shield_large, image_index, pt.x, pt.y, image_xscale, image_yscale, image_angle, c_white, 1);
			shader_reset();
		}
	}
}