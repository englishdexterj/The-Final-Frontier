if (flash_alpha = 0 or (rammer and !rammer_cooldown)) and !cloaking_active {
	if !rammer or rammer_cooldown {
		if hull_health > 0 {
			if hull_health >= 1 hull_health -= 1;
			else {
				hp -= (1 - hull_health);
				hull_health = 0;
			}
		} else if hp >= 1 hp -= 1;
		else hp = 0;
	}
	if rammer and rammer_cooldown = 0 {
		rammer_cooldown = 9;
		alarm_set(9, rammer_cooldown_speed*2);
	}
	
	if global.cheats = false && global.steam_api = true {
		steam_set_stat_int("total_hitby", steam_get_stat_int("total_hitby") + 1);
		steam_set_stat_int("hitby_asteroid", steam_get_stat_int("hitby_asteroid") + 1);
		if hp = 0 steam_set_stat_int("killedby_asteroid", steam_get_stat_int("killedby_asteroid") + 1);
	}
	
	var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
	audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	
	if hp = 1 {
		audio_play_sound_at(sfx_lowhealth, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 2);
		audio_play_sound_at(sfx_lowhealth, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(sfx_lowhealth, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	}
	
	flash_alpha = 1;
	part_particles_create(global.particle_sys, x, y, global.pt_player, 30);

	with other {
		instance_destroy();
	}
}
