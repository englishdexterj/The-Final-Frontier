if !pause && os_is_paused() {
	instance_deactivate_all(true);
	pause = true;
}

if steam_initialised() {
	if steam_stats_ready() && steam_is_overlay_enabled() {
		global.steam_api = true;
	}
}

#region wave alpha
if !pause {
	if wave_alpha > 0 wave_alpha -= (1/120);
	if global.spawn_level = 0 start_alpha -= 1/180;
}
#endregion

if game_over = false && pause = false {
	hp = o_player.hp;
	round_intermission = o_controller.round_intermission;
}
if game_over = false && pause = false && hp + o_player.hull_health <= 0  {
	var _s = choose(sfx_sound_shutdown1, sfx_sound_shutdown2);
	var snd = audio_play_sound(_s, 10, false);
	audio_sound_gain(snd, 1, 0);
	
	instance_deactivate_all(true);
	
	game_over = true;
	
	menu_active = false;
	alarm_set(3, 60);
	
	pause = true;
	sel_menu = 5;
	
	sc_save_score(false);
} else {
	if pause and menu_active {
		sc_step_menu_control();
		sc_step_menu_topscores();
		sc_step_menu_stats();
		
		if (keyboard_check_pressed(global.key[ctrl.back]) || gamepad_button_check_pressed(0, gp_start)) {
			instance_activate_all();
			pause = false;
		}
		
	} else if (keyboard_check_pressed(global.key[ctrl.back]) || gamepad_button_check_pressed(0, gp_start)) {
		instance_deactivate_all(true);
		pause = true;
	}
}

#region levelup
if global.pts >= levelup_points && levelup_available = false && game_over = false {
	levelup_available = true;
	
	var _s = choose(sfx_coin_cluster1, sfx_coin_cluster2, sfx_coin_cluster3, sfx_coin_cluster4, sfx_coin_cluster5, sfx_coin_cluster6, sfx_coin_cluster7, sfx_coin_cluster8, sfx_coin_cluster9);
	var snd = audio_play_sound(_s, 10, false);
	audio_sound_gain(snd, 1, 0);
}

if levelup_available = true && game_over = false && pause = false && (keyboard_check_pressed(global.key[ctrl.select]) || gamepad_button_check_pressed(0, gp_face1)) {
	instance_destroy(o_bullet);
	instance_destroy(o_flak);
	
	with o_upgrade_tree { 
		selected = 40;
		levelup_menu = true;
		instance_deactivate_all(true);
	}
	levelup_points_last = levelup_points;
	levelup_points += 250*global.level
	levelup_available = false;
	global.level += 1;
}
#endregion
