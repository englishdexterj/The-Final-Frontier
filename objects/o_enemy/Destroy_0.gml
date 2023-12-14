part_particles_create(global.particle_sys, x, y, enemy_type_particle, 30*size);

if instance_exists(o_player) {
if global.cheats = false and global.steam_api = true {
	steam_set_stat_int("total_kills", steam_get_stat_int("total_kills") + 1);
	
	if variable_instance_exists(id, "upgrades") var add = upgrades;
	else var add = 0;
	if enemy_type = "basic" {
		steam_set_stat_int("kills_basic", steam_get_stat_int("kills_basic") + 1);
		global.stats[enemies.fighter, add+1]++;
	} else if enemy_type = "suicider" {
		steam_set_stat_int("kills_suicider", steam_get_stat_int("kills_suicider") + 1);
		global.stats[enemies.suicider, add+1]++;
	} else if enemy_type = "marauder" {
		steam_set_stat_int("kills_marauder", steam_get_stat_int("kills_marauder") + 1);
		global.stats[enemies.marauder, add+1]++;
	} else if enemy_type = "ion" {
		steam_set_stat_int("kills_ion", steam_get_stat_int("kills_ion") + 1);
		global.stats[enemies.ion, add+1]++;
	} else if enemy_type = "bomber" {
		steam_set_stat_int("kills_bomber", steam_get_stat_int("kills_bomber") + 1);
		global.stats[enemies.bomber, add+1]++;
	} else if enemy_type = "rusher" {
		steam_set_stat_int("kills_rusher", steam_get_stat_int("kills_rusher") + 1);
		global.stats[enemies.rusher, add+1]++;
	} else if enemy_type = "sniper" {
		steam_set_stat_int("kills_sniper", steam_get_stat_int("kills_sniper") + 1);
		global.stats[enemies.ranger, add+1]++;
	} else if enemy_type = "gunship" {
		steam_set_stat_int("kills_gunship", steam_get_stat_int("kills_gunship") + 1);
		global.stats[enemies.gunship, add+1]++;
	} else if enemy_type = "shotgunner" {
		steam_set_stat_int("kills_shotgunner", steam_get_stat_int("kills_shotgunner") + 1);
		global.stats[enemies.shotgunner, add+1]++;
	} else if enemy_type = "destroyer" {
		steam_set_stat_int("kills_destroyer", steam_get_stat_int("kills_destroyer") + 1);
		global.stats[enemies.destroyer, add+1]++;
	} else if enemy_type = "swarmer" {
		steam_set_stat_int("kills_swarmer", steam_get_stat_int("kills_swarmer") + 1);
		global.stats[enemies.swarmer, add+1]++;
	} else if enemy_type = "heavy_cruiser" {
		steam_set_stat_int("kills_heavy_cruiser", steam_get_stat_int("kills_heavy_cruiser") + 1);
		global.stats[enemies.heavy_cruiser, add+1]++;
	} else if enemy_type = "battlecruiser" {
		steam_set_stat_int("kills_battlecruiser", steam_get_stat_int("kills_battlecruiser") + 1);
		global.stats[enemies.battlecruiser, add+1]++;
	}
}

switch enemy_type {
	case "basic":
		var _e_type = 0;
		break;
	case "suicider":
		var _e_type = 1;
		break;
	case "marauder":
		var _e_type = 2;
		break;
	case "ion":
		var _e_type = 3;
		break;
	case "bomber":
		var _e_type = 4;
		break;
	case "rusher":
		var _e_type = 5;
		break;
	case "sniper":
		var _e_type = 6;
		break;
	case "gunship":
		var _e_type = 7;
		break;
	case "shotgunner":
		var _e_type = 8;
		break;
	case "destroyer":
		var _e_type = 9;
		break;
	case "swarmer":
		var _e_type = 10;
		break;
	case "heavy_cruiser":
		var _e_type = 11;
		break;
	case "battlecruiser":
		var _e_type = 12;
		break;
	default:
		show_debug_message("ERR: o_enemy Destroy");
		var _e_type = -1;
		break;
}

if _e_type != -1 {
	with o_menu {
		killed[_e_type, other.upgrades]++;
	}
}

if enemy_type = "heavy_cruiser" {
	audio_play_sound_at(sfx_sound_shutdown192, x, y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(sfx_sound_shutdown192, x - (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(sfx_sound_shutdown192, x + (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
} else if enemy_type = "battlecruiser" {
	audio_play_sound_at(sfx_sound_shutdown293, x, y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(sfx_sound_shutdown293, x - (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(sfx_sound_shutdown293, x + (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
} else {
	var _s = choose(sfx_exp_short_soft1,sfx_exp_short_soft2,sfx_exp_short_soft3,sfx_exp_short_soft4,sfx_exp_short_soft5,sfx_exp_short_soft6,sfx_exp_short_soft7,sfx_exp_short_soft8,sfx_exp_short_soft9,sfx_exp_short_soft10,sfx_exp_short_soft11,sfx_exp_short_soft12);
	audio_play_sound_at(_s, x, y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
}

global.ships_destroyed += 1;
global.pts += points*global.xp_gain;

var _point_indicator = instance_create_layer(x, y, "Instances", o_point_indicator);
_point_indicator.points = points;

if instance_exists(followed) && instance_exists(following) {
	followed.following = following;
}
} else if object_index != o_enemy_swarmer o_main_menu.menu_enemies--;
