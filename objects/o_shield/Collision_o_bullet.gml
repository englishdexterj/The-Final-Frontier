if global.cheats = false && global.steam_api = true and instance_exists(o_player) var _stats = true;
else var _stats = false;

if enemy and enemy != other.enemy && other.image_alpha = 1 {
	
	hit_reduce += .5+(1/max_hit_times*2)*hit_times;
	hit_times += 1;
	
	if _stats steam_set_stat_int("total_enemy_shields_hit", steam_get_stat_int("total_enemy_shields_hit") + 1);
	
	if other.type = "missile" {
		if _stats steam_set_stat_int("enemy_shields_hitby_missile", steam_get_stat_int("enemy_shields_hitby_missile") + 1);
		hit_times += 1;
		hit_reduce += .5+(1/max_hit_times*2)*hit_times;
	} else if other.type = "ion" {
		if _stats steam_set_stat_int("enemy_shields_hitby_ion", steam_get_stat_int("enemy_shields_hitby_ion") + 1);
		hit_times += 1;
		hit_reduce += .5+(1/max_hit_times*2)*hit_times;
		hit_times += 1;
		hit_reduce += .5+(1/max_hit_times*2)*hit_times;
	} else if other.type = "sniper" {
		if _stats steam_set_stat_int("enemy_shields_hitby_sniper", steam_get_stat_int("enemy_shields_hitby_sniper") + 1);
		hit_times += 1;
		hit_reduce += .5+(1/max_hit_times*2)*hit_times;
		hit_times += 1;
		hit_reduce += .5+(1/max_hit_times*2)*hit_times;
	} else {
		if _stats steam_set_stat_int("enemy_shields_hitby_bullet", steam_get_stat_int("enemy_shields_hitby_bullet") + 1);
	}
	
	if hit_times >= max_hit_times {
		if _stats steam_set_stat_int("total_enemy_shields_destroyed", steam_get_stat_int("total_enemy_shields_destroyed") + 1);
		
		var _s = choose(sfx_sounds_interaction23);
		audio_play_sound_at(_s, other.x, other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, other.x - (room_width - view_hport[0]), other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, other.x + (room_width - view_hport[0]), other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
		if enemy part_particles_create(global.particle_sys, other.x, other.y, global.pt_shield_enemy, 60);
		else part_particles_create(global.particle_sys, other.x, other.y, global.pt_shield, 60);
		instance_destroy();
	} else {
		var _s = choose(sfx_sounds_interaction5, sfx_sounds_interaction18, sfx_sounds_interaction21, sfx_sounds_interaction22);
		audio_play_sound_at(_s, other.x, other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, other.x - (room_width - view_hport[0]), other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(_s, other.x + (room_width - view_hport[0]), other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
		if enemy part_particles_create(global.particle_sys, other.x, other.y, global.pt_shield_enemy, 30);
		else part_particles_create(global.particle_sys, other.x, other.y, global.pt_shield, 30);
	}
	
	instance_destroy(other);
} else if !enemy and enemy != other.enemy and other.image_alpha = 1 {
	hit_reduce += 1/max_hit_times;
	
	if _stats steam_set_stat_int("total_player_shields_hit", steam_get_stat_int("total_player_shields_hit") + 1);
	
	if other.type = "missile" {
		if _stats steam_set_stat_int("player_shields_hitby_missile", steam_get_stat_int("player_shields_hitby_missile") + 1);
		hit_reduce += 2/max_hit_times;
	} else if other.type = "ion" {
		if _stats steam_set_stat_int("player_shields_hitby_ion", steam_get_stat_int("player_shields_hitby_ion") + 1);
		hit_reduce += 4/max_hit_times;
	} else if other.type = "sniper" {
		if _stats steam_set_stat_int("player_shields_hitby_sniper", steam_get_stat_int("player_shields_hitby_sniper") + 1);
		hit_reduce += 4/max_hit_times;
	} else {
		if _stats steam_set_stat_int("player_shields_hitby_bullet", steam_get_stat_int("player_shields_hitby_bullet") + 1);
	}
	
	var _s = choose(sfx_sounds_interaction5, sfx_sounds_interaction18, sfx_sounds_interaction21, sfx_sounds_interaction22);
	audio_play_sound_at(_s, other.x, other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, other.x - (room_width - view_hport[0]), other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, other.x + (room_width - view_hport[0]), other.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
	part_particles_create(global.particle_sys, other.x, other.y, global.pt_shield, 30);
	
	instance_destroy(other);
}
