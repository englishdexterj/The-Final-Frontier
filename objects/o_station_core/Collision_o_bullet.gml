if global.cheats = false && global.steam_api = true and instance_exists(o_player) var _stats = true;
else var _stats = false;

if other.enemy = false && (other.image_alpha = 1 or disabled) and !invincible {
	_x = other.x - x;
	_y = other.y - y;
	
	var _a = image_angle * pi / 180;
	damage_y = _y*cos(_a) + _x*sin(_a);
	damage_x = _x*cos(_a) - _y*sin(_a);
		
	hit = true;
	if flash_alpha = 0 or disabled {
		//if (other.destroy) part_particles_create(global.particle_sys, other.x, other.y, enemy_type_particle, 30);
		//else part_particles_create(global.particle_sys, x, y, enemy_type_particle, 30);
		part_particles_create(global.particle_sys, other.x, other.y, enemy_type_particle, 30);
		
		var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
		audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
		if other.type = "bullet" and !hurt {
			hit_radius = 8;
			hp -= 1;
			
			hurt = true;
			alarm_set(7, 10);
		} else if other.type = "missile" and !hurt {
			hit_radius = 24;
			hp -= 2;
			
			hurt = true;
			alarm_set(7, 10);
		} else if other.type = "sniper" and !hurt {
			hit_radius = 8;
			hp -= 2;
			
			hurt = true;
			alarm_set(7, 10);
		} else if other.type = "laser" and !hurt {
			hit_radius = 4;
			hp -= 1;
			
			hurt = true;
			alarm_set(7, 10);
		} else if other.type = "ion" {
			hit_radius = 0;
			disabled = true;
			alarm_set(6, 120);
		}
		
		image_index = 2 - (hp - (hp mod 2)) / 2;
		
		//shader
		flash_alpha = 1;
	}
	
	if (other.destroy) instance_destroy(other);
}