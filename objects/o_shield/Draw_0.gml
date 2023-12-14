if instance_exists(pt) && index = true {
	if enemy {
		draw_sprite_ext(s_shield_large, image_index, pt.x, pt.y, image_xscale, image_yscale, image_angle, c_white, 1 - (hit_times / (max_hit_times*5/4)));
	} else if !enemy {
		draw_sprite_ext(s_shield_large, image_index, pt.x, pt.y, image_xscale, image_yscale, image_angle, c_white, 1);
	}
}