if other.enemy != enemy && other.image_alpha = 1 {
	with pt {
		part_particles_create(global.particle_sys, x, y, enemy_type_particle, 30);
	
		_x = other.x - x;
		_y = other.y - y;
	
		var _a = image_angle * pi / 180;
		damage_y = _y*cos(_a) + _x*sin(_a);
		damage_x = _x*cos(_a) - _y*sin(_a);

		reactor_active[other.reactor_number] = false;
		
		var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
		audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
		if other.type = "battlecruiser" hit_radius = 48;
		else if other.type = "heavy_cruiser" hit_radius = 24;
	
		if (sprite_get_width(sprite_index) >= sprite_get_height(sprite_index)) var _size = sprite_get_width(sprite_index);
		else var _size = sprite_get_height(sprite_index);
		
		var _temp_surf = surface_create(_size, _size);

		surface_set_target(_temp_surf);
		draw_clear_alpha(c_black, 0)
	
		draw_sprite_ext(sprite_index, 0, _size div 2, _size div 2, image_xscale/global.scale, image_yscale/global.scale, 0, c_white, image_alpha);
	
	
		gpu_set_blendmode(bm_subtract);
	
		draw_set_color(c_white);
		
		for (var i = 0; i < 8; i++) {
			var _xr = damage_x/global.scale + _size div 2 + irandom_range(-hit_radius, hit_radius);
			var _yr = damage_y/global.scale + _size div 2 + irandom_range(-hit_radius, hit_radius)
			draw_circle(_xr, _yr, hit_radius - i*hit_radius/12, false);
			
			part_particles_create(global.particle_sys, _xr, _yr, enemy_type_particle, 30*size);
		}
		var _s = choose(sfx_exp_short_soft1,sfx_exp_short_soft2,sfx_exp_short_soft3,sfx_exp_short_soft4,sfx_exp_short_soft5,sfx_exp_short_soft6,sfx_exp_short_soft7,sfx_exp_short_soft8,sfx_exp_short_soft9,sfx_exp_short_soft10,sfx_exp_short_soft11,sfx_exp_short_soft12);
		audio_play_sound_at(_s, other.x, other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, other.x - (room_width - view_hport[0]), other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, other.x + (room_width - view_hport[0]), other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
		hit_radius = 0;
	
		gpu_set_blendmode(bm_normal);
	
		var _old_sprite = sprite_index;
	
		sprite_index = sprite_create_from_surface(_temp_surf, 0, 0, _size, _size, false, false, _size div 2, _size div 2);
		
		if hp < max_hp-1 sprite_delete(_old_sprite);
		
		surface_reset_target();
	
		surface_free(_temp_surf);
	
		sprite_collision_mask(sprite_index, false, 0, 0, 0, 0, 0, 0, 0);
		
	}
	instance_destroy();
}