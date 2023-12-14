if other.enemy = true && other.image_alpha = 1 && !cloaking_active {
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
				
				if other.enemy_type ="basic" {
					if hp = 0 steam_set_stat_int("killedby_basic", steam_get_stat_int("killedby_basic") + 1);
					steam_set_stat_int("shotby_basic", steam_get_stat_int("shotby_basic") + 1);
				} else if other.enemy_type ="suicider" {
					if hp = 0 steam_set_stat_int("killedby_suicider", steam_get_stat_int("killedby_suicider") + 1);
					steam_set_stat_int("shotby_suicider", steam_get_stat_int("shotby_suicider") + 1);
				} else if other.enemy_type ="marauder" {
					if hp = 0 steam_set_stat_int("killedby_marauder", steam_get_stat_int("killedby_marauder") + 1);
					steam_set_stat_int("shotby_marauder", steam_get_stat_int("shotby_marauder") + 1);
				} else if other.enemy_type ="ion" {
					if hp = 0 steam_set_stat_int("killedby_ion", steam_get_stat_int("killedby_ion") + 1);
					steam_set_stat_int("shotby_ion", steam_get_stat_int("shotby_ion") + 1);
				} else if other.enemy_type ="bomber" {
					if hp = 0 steam_set_stat_int("killedby_bomber", steam_get_stat_int("killedby_bomber") + 1);
					steam_set_stat_int("shotby_bomber", steam_get_stat_int("shotby_bomber") + 1);
				} else if other.enemy_type ="rusher" {
					if hp = 0 steam_set_stat_int("killedby_rusher", steam_get_stat_int("killedby_rusher") + 1);
					steam_set_stat_int("shotby_rusher", steam_get_stat_int("shotby_rusher") + 1);
				} else if other.enemy_type ="sniper" {
					if hp = 0 steam_set_stat_int("killedby_ranger", steam_get_stat_int("killedby_ranger") + 1);
					steam_set_stat_int("shotby_ranger", steam_get_stat_int("shotby_ranger") + 1);
				} else if other.enemy_type ="gunship" {
					if hp = 0 steam_set_stat_int("killedby_gunship", steam_get_stat_int("killedby_gunship") + 1);
					steam_set_stat_int("shotby_gunship", steam_get_stat_int("shotby_gunship") + 1);
				} else if other.enemy_type ="shotgunner" {
					if hp = 0 steam_set_stat_int("killedby_shotgunner", steam_get_stat_int("killedby_shotgunner") + 1);
					steam_set_stat_int("shotby_shotgunner", steam_get_stat_int("shotby_shotgunner") + 1);
				} else if other.enemy_type ="destroyer" {
					if hp = 0 steam_set_stat_int("killedby_destroyer", steam_get_stat_int("killedby_destroyer") + 1);
					steam_set_stat_int("shotby_destroyer", steam_get_stat_int("shotby_destroyer") + 1);
				} else if other.enemy_type ="swarmer" {
					if hp = 0 steam_set_stat_int("killedby_swarmer", steam_get_stat_int("killedby_swarmer") + 1);
					steam_set_stat_int("shotby_swarmer", steam_get_stat_int("shotby_swarmer") + 1);
				} else if other.enemy_type ="heavy_cruiser" {
					if hp = 0 steam_set_stat_int("killedby_heavy_cruiser", steam_get_stat_int("killedby_heavy_cruiser") + 1);
					steam_set_stat_int("shotby_heavy_cruiser", steam_get_stat_int("shotby_heavy_cruiser") + 1);
				} else if other.enemy_type ="battlecruiser" {
					if hp = 0 steam_set_stat_int("killedby_battlecruiser", steam_get_stat_int("killedby_battlecruiser") + 1);
					steam_set_stat_int("shotby_battlecruiser", steam_get_stat_int("shotby_battlecruiser") + 1);
				} else if other.enemy_type ="turret_large" {
					if hp = 0 steam_set_stat_int("killedby_turret_large", steam_get_stat_int("killedby_turret_large") + 1);
					steam_set_stat_int("shotby_turret_large", steam_get_stat_int("shotby_turret_large") + 1);
				} else if other.enemy_type ="turret_laser" {
					if hp = 0 steam_set_stat_int("killedby_turret_laser", steam_get_stat_int("killedby_turret_laser") + 1);
					steam_set_stat_int("shotby_turret_laser", steam_get_stat_int("shotby_turret_laser") + 1);
				} else if other.enemy_type ="turret_missile" {
					if hp = 0 steam_set_stat_int("killedby_turret_missile", steam_get_stat_int("killedby_turret_missile") + 1);
					steam_set_stat_int("shotby_turret_missile", steam_get_stat_int("shotby_turret_missile") + 1);
				} else if other.enemy_type ="turret_ion" {
					if hp = 0 steam_set_stat_int("killedby_turret_ion", steam_get_stat_int("killedby_turret_ion") + 1);
					steam_set_stat_int("shotby_turret_ion", steam_get_stat_int("shotby_turret_ion") + 1);
				}
			}
		}
	}
	
	if hp + hull_health <= 1 {
		audio_play_sound_at(sfx_lowhealth, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 2);
		audio_play_sound_at(sfx_lowhealth, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(sfx_lowhealth, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	}
			
	if (other.destroy) instance_destroy(other);
}