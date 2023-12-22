if other.enemy = true && other.image_alpha = 1 && !cloaking_active && !invincible {
	if other.type = "ion" && disabled = false {
		if global.cheats = false && global.steam_api = true {
			steam_set_stat_int("total_shotby", steam_get_stat_int("total_shotby") + 1);
			steam_set_stat_int("total_shotby_ion", steam_get_stat_int("total_shotby_ion") + 1);
		}
		
		if global.cheats = false {
			if other.enemy_type = "ion" {
				global.stats[enemies.ion, 7]++;
			}
		}

		disabled = true;
		alarm_set(4, 120);
		audio_play_sound_at(sfx_sounds_interaction13, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(sfx_sounds_interaction13, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(sfx_sounds_interaction13, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	} else if other.type != "ion" {
		if flash_alpha = 0 {
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
				steam_set_stat_int("total_shotby", steam_get_stat_int("total_shotby") + 1);
				
				if other.type = "laser" steam_set_stat_int("total_shotby_laser", steam_get_stat_int("total_shotby_laser") + 1);
				else if other.type = "missile" steam_set_stat_int("total_shotby_missile", steam_get_stat_int("total_shotby_missile") + 1);
				else if other.type = "bullet" steam_set_stat_int("total_shotby_bullet", steam_get_stat_int("total_shotby_bullet") + 1);
				else if other.type = "sniper" steam_set_stat_int("total_shotby_sniper", steam_get_stat_int("total_shotby_sniper") + 1);
				else if other.type = "station_bullet" steam_set_stat_int("total_shotby_station_bullet", steam_get_stat_int("total_shotby_station_bullet") + 1);
				else steam_set_stat_int("total_shotby_other", steam_get_stat_int("total_shotby_other") + 1);
				
				sc_stats_enemy_projectile();
			}
		}
	}
			
	if (other.destroy) instance_destroy(other);
}