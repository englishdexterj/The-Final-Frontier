with other {
	part_particles_create(global.particle_sys, other.x, other.y, enemy_type_particle, 3);
	
	_x = other.x - x;
	_y = other.y - y;
	
	var _a = image_angle * pi / 180;
	damage_y = _y*cos(_a) + _x*sin(_a);
	damage_x = _x*cos(_a) - _y*sin(_a);
	
	hit_radius = 4;
			
	hurt = true;
	alarm_set(7, 10);
	
	hit = true;
	hp -= 1;
		
	var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
	audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
	//shader
	flash_alpha = 1;
}
instance_destroy();