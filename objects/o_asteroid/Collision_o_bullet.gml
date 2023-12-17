if image_alpha = 1 {
	_x = other.x - x;
	_y = other.y - y;
	
	var _a = image_angle * pi / 180;
	damage_y = _y*cos(_a) + _x*sin(_a);
	damage_x = _x*cos(_a) - _y*sin(_a);
		
	hit = true;
	if 1=1 or flash_alpha = 0 {
		part_particles_create(global.particle_sys, other.x, other.y, global.pt_basic, 30);
		
		var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
		audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
		if other.type = "bullet" {
			hit_radius = 4;
			hp -= 1;
		} else if other.type = "missile" {
			hit_radius = 8;
			hp -= 2;
		} else if other.type = "laser" {
			hit_radius = 2;
			hp -= 1;
		} else if other.type = "sniper" {
			hit_radius = 4;
			hp -= 2;
		}
		
		//shader
		flash_alpha = 1;
	}
	
	if (other.destroy) instance_destroy(other);
}
