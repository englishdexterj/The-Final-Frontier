if enemy {
	part_particles_create(global.particle_sys, x, y, global.pt_bullet_enemy, 50);
} else {
	part_particles_create(global.particle_sys, x, y, global.pt_bullet, 50);
}

if 1=1 {
	#region check for friendlys
	var _col = ds_list_create();
	collision_circle_list(x, y, explosion_range, o_friendly_parent, true, true, _col, false);
	
	for (var i = 0; i < ds_list_size(_col); i++) {
		var _col_instance = ds_list_find_value(_col, i);
		if instance_exists(_col_instance) {
			with _col_instance {
				if flash_alpha = 0 {
					if object_index = o_player {
						if !invincible {
							part_particles_create(global.particle_sys, x, y, global.pt_player, 30);
							flash_alpha = 1;
							if hull_health > 0 {
								if hull_health >= 1 hull_health -= 1;
								else {
									hp -= (1 - hull_health);
									hull_health = 0;
								}
							} else if hp >= 1 hp -= 1;
							else hp = 0;
					
					
							if hp + hull_health <= 1 and flash_alpha = 1 { //only play if health less than 1 and just got hit
								audio_play_sound_at(sfx_lowhealth, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 2);
								audio_play_sound_at(sfx_lowhealth, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
								audio_play_sound_at(sfx_lowhealth, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
							}
					
		
							var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
							audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
							audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
							audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
			
							if global.cheats = false && global.steam_api = true {
								steam_set_stat_int("total_hitby", steam_get_stat_int("total_hitby") + 1);
				
								if other.type = "mine" steam_set_stat_int("hitby_mine", steam_get_stat_int("hitby_mine") + 1);
								else steam_set_stat_int("total_hitby_other", steam_get_stat_int("total_hitby_other") + 1);
				
								sc_stats_enemy_projectile();
							}
						}
					} else {
						part_particles_create(global.particle_sys, x, y, global.pt_player, 30);
						flash_alpha = 1;
						hp -= 1;
		
						var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
			
						audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
					}
				}
			}
		}
	}
	
	ds_list_destroy(_col);
	#endregion
}

if 1=1 {
	#region check for enemies
	var _col = ds_list_create();
	collision_circle_list(x, y, explosion_range, o_enemy_parent, true, true, _col, false);
	
	for (var i = 0; i < ds_list_size(_col); i++) {
		var _col_instance = ds_list_find_value(_col, i);
		if instance_exists(_col_instance) {
			with _col_instance {
				if !invincible {
					hit = true;
					if flash_alpha = 0 or disabled {
						part_particles_create(global.particle_sys, other.x, other.y, enemy_type_particle, 30);
		
						var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
						audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
						if other.type = "mine" and !hurt {
							hit_radius = 0;
							hp -= 1;
			
							hurt = true;
							alarm_set(7, 10);
						}
		
						//shader
						flash_alpha = 1;
					}
				}
			}
		}
	}
	
	ds_list_destroy(_col);
	#endregion
}

#region check for projectiles
var _col = ds_list_create();
collision_circle_list(x, y, explosion_range, o_projectile_parent, true, true, _col, false);
	
for (var i = 0; i < ds_list_size(_col); i++) {
	var _col_instance = ds_list_find_value(_col, i);
	if instance_exists(_col_instance) {
		with _col_instance {
			if object_index = o_asteroid {
				if flash_alpha = 0 {
					part_particles_create(global.particle_sys, x, y, global.pt_player, 30);
					flash_alpha = 1;
					hp -= 1;
					
					if hp <= 0 instance_destroy();
		
					var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
			
					audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
					audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
					audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
				}
			} else {
				instance_destroy();
			}
		}
	}
}
	
ds_list_destroy(_col);
#endregion

if room = game part_particles_create(global.particle_sys, x, y, global.pt_mine_enemy, 1);

var _s = choose(sfx_exp_medium5, sfx_exp_medium6, sfx_exp_medium7);
var snd = audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
var snd2 = audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
var snd3 = audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
audio_sound_gain(snd2, .35, 0);
audio_sound_gain(snd3, .35, 0);
audio_sound_gain(snd, .35, 0);