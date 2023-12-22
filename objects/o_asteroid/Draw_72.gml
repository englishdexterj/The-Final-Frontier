if hit {
	if (sprite_get_width(sprite_index) >= sprite_get_height(sprite_index)) var _size = sprite_get_width(sprite_index);
	else var _size = sprite_get_height(sprite_index);

	var _temp_surf = surface_create(_size, _size);

	surface_set_target(_temp_surf);
	draw_clear_alpha(c_black, 0)
	
	draw_sprite_ext(sprite_index, image_index, _size div 2, _size div 2, flip*(image_xscale/global.scale)/mult, flip*(image_yscale/global.scale)/mult, image_angle, c_white, image_alpha);
	
	
	gpu_set_blendmode(bm_subtract);
	
	draw_set_color(c_white);
	
	draw_circle(flip*(damage_x/global.scale)/mult + _size div 2, flip*(damage_y/global.scale)/mult + _size div 2, hit_radius, false);
	hit_radius = 0;
	
	gpu_set_blendmode(bm_normal);
	
	var _old_sprite = sprite_index;
	
	if object_get_sprite(object_index) != sprite_index sprite_delete(_old_sprite);
	
	sprite_index = sprite_create_from_surface(_temp_surf, 0, 0, _size, _size, false, false, _size div 2, _size div 2);
	
	surface_reset_target();
	
	surface_free(_temp_surf);
	
	sprite_collision_mask(sprite_index, false, 0, 0, 0, 0, 0, 0, 0);
	
	hit = false;
}