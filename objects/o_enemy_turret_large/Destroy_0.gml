var _s = choose(sfx_exp_short_soft1,sfx_exp_short_soft2,sfx_exp_short_soft3,sfx_exp_short_soft4,sfx_exp_short_soft5,sfx_exp_short_soft6,sfx_exp_short_soft7,sfx_exp_short_soft8,sfx_exp_short_soft9,sfx_exp_short_soft10,sfx_exp_short_soft11,sfx_exp_short_soft12);
audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);

if global.cheats = false and variable_global_exists("steam_api") and global.steam_api = true and instance_exists(o_player) {
	steam_set_stat_int("total_kills", steam_get_stat_int("total_kills") + 1);
	
	if enemy_type = "turret_large" {
		global.stats[enemies.turret_large, 1]++;
		steam_set_stat_int("kills_turret_large", steam_get_stat_int("kills_turret_large") + 1);
	} else if enemy_type = "turret_laser" {
		global.stats[enemies.turret_laser, 1]++;
		steam_set_stat_int("kills_turret_laser", steam_get_stat_int("kills_turret_laser") + 1);
	} else if enemy_type = "turret_missile" {
		global.stats[enemies.turret_missile, 1]++;
		steam_set_stat_int("kills_turret_missile", steam_get_stat_int("kills_turret_missile") + 1);
	} else if enemy_type = "turret_ion" {
		global.stats[enemies.turret_ion, 1]++;
		steam_set_stat_int("kills_turret_ion", steam_get_stat_int("kills_turret_ion") + 1);
	}
}