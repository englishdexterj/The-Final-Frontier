randomize();

global.steam_api = false;

ini_open("data.ini");
if ini_section_exists("fighter_score") or ini_section_exists("character") {
	file_delete("data.ini");
}
ini_close();

global.debug_pathing = false;

global.scale = 2;
global.spd = .1;
global.drag = .98;
global.fric = .98;

global.xp_gain = 1;

//particles
global.particle_sys = part_system_create();
part_system_depth(global.particle_sys, -100);

sc_init_part();
//

audio_group_load(ag_game_sounds);
audio_group_load(ag_menu_sounds);

audio_listener_orientation(0, -1, 0, 0, 0, -1);
audio_falloff_set_model(audio_falloff_linear_distance);
audio_listener_position(960, 540, 1024);

menu_enemies = 0;
menu_enemies_max = 2;
menu_friendlies = 0;
menu_friendlies_max = 2;
menu_asteroids = 0;
menu_asteroids_max = 4;

global.enemy[0] = "Fighter";
global.enemy[1] = "Suicider";
global.enemy[2] = "Marauder";
global.enemy[3] = "Ion";
global.enemy[4] = "Bomber";
global.enemy[5] = "Sentinel";
global.enemy[6] = "Rusher";
global.enemy[7] = "Ranger";
global.enemy[8] = "Gunship";
global.enemy[9] = "Destroyer";
global.enemy[10] = "Shotgunner";
global.enemy[11] = "Swarmer";
global.enemy[12] = "Heavy Cruiser";
global.enemy[13] = "Battlecruiser";

enum enemies {
	fighter,
	suicider,
	marauder,
	ion,
	bomber,
	sentinel,
	rusher,
	ranger,
	gunship,
	destroyer,
	shotgunner,
	swarmer,
	heavy_cruiser,
	battlecruiser,
	turret_large,
	turret_laser,
	turret_missile,
	turret_ion
}

global.info[enemies.fighter, 0] = 1; //health
global.info[enemies.suicider, 0] = 1; //health
global.info[enemies.marauder, 0] = 2; //health
global.info[enemies.ion, 0] = 1; //health
global.info[enemies.bomber, 0] = 1; //health
global.info[enemies.sentinel, 0] = 2; //health
global.info[enemies.rusher, 0] = 1; //health
global.info[enemies.ranger, 0] = 2; //health
global.info[enemies.gunship, 0] = 3; //health
global.info[enemies.shotgunner, 0] = 3; //health
global.info[enemies.destroyer, 0] = 10; //health
global.info[enemies.swarmer, 0] = 1; //health
global.info[enemies.heavy_cruiser, 0] = 50; //health
global.info[enemies.battlecruiser, 0] = 1000; //health

global.info[enemies.fighter, 1] = "Bullet"; //projectile
global.info[enemies.suicider, 1] = "None";
global.info[enemies.marauder, 1] = "Bullet";
global.info[enemies.ion, 1] = "Ion Beam";
global.info[enemies.bomber, 1] = "Missile";
global.info[enemies.sentinel, 1] = "Mines";
global.info[enemies.rusher, 1] = "None";
global.info[enemies.ranger, 1] = "Bullet";
global.info[enemies.gunship, 1] = "Dual Missile";
global.info[enemies.shotgunner, 1] = "Bullet";
global.info[enemies.destroyer, 1] = "Turrets";
global.info[enemies.swarmer, 1] = "Bullet";
global.info[enemies.heavy_cruiser, 1] = "Many";
global.info[enemies.battlecruiser, 1] = "Many";

global.info[enemies.fighter, 2] = 50; //points
global.info[enemies.suicider, 2] = 100;
global.info[enemies.marauder, 2] = 100;
global.info[enemies.ion, 2] = 50;
global.info[enemies.bomber, 2] = 200;
global.info[enemies.sentinel, 2] = 200;
global.info[enemies.rusher, 2] = 200;
global.info[enemies.ranger, 2] = 200;
global.info[enemies.gunship, 2] = 400;
global.info[enemies.shotgunner, 2] = 400;
global.info[enemies.destroyer, 2] = 800;
global.info[enemies.swarmer, 2] = 25;
global.info[enemies.heavy_cruiser, 2] = 1600;
global.info[enemies.battlecruiser, 2] = 6400;

global.info[enemies.fighter, 3] = "Small and\nmaneuverable\nshooting bullets"; //info
global.info[enemies.suicider, 3] = "Fast and pushes\nthe player";
global.info[enemies.marauder, 3] = "Stays close and\nshoots";
global.info[enemies.ion, 3] = "Shoots ion beams that\ndisable the player";
global.info[enemies.bomber, 3] = "Small and\nmaneuverable\nshooting missiles";
global.info[enemies.sentinel, 3] = "Stays away and\nplants mines";
global.info[enemies.rusher, 3] = "Enters a rush mode\nand is very fast";
global.info[enemies.ranger, 3] = "Stays far away\nand leads powerful shots";
global.info[enemies.gunship, 3] = "Strong and slow\nshooting missiles";
global.info[enemies.shotgunner, 3] = "Pushes shooting\nvolleys of bullets";
global.info[enemies.destroyer, 3] = "Very slow with\nturrets and lasers";
global.info[enemies.swarmer, 3] = "Weak unit that moves\nin groups";
global.info[enemies.heavy_cruiser, 3] = "Strong with many\nweapons. Two weak\nreactors";
global.info[enemies.battlecruiser, 3] = "Very strong with many\nweapons. Four weak\nreactors";

global.info[enemies.fighter, 4] = o_enemy_basic; //object
global.info[enemies.suicider, 4] = o_enemy_suicider;
global.info[enemies.marauder, 4] = o_enemy_marauder;
global.info[enemies.ion, 4] = o_enemy_ion;
global.info[enemies.bomber, 4] = o_enemy_bomber;
global.info[enemies.sentinel, 4] = o_enemy_sentinel;
global.info[enemies.rusher, 4] = o_enemy_rusher;
global.info[enemies.ranger, 4] = o_enemy_sniper;
global.info[enemies.gunship, 4] = o_enemy_gunship;
global.info[enemies.shotgunner, 4] = o_enemy_shotgunner;
global.info[enemies.destroyer, 4] = o_enemy_destroyer;
global.info[enemies.swarmer, 4] = o_enemy_swarmer_controller;
global.info[enemies.heavy_cruiser, 4] = o_enemy_heavy_cruiser;
global.info[enemies.battlecruiser, 4] = o_enemy_battlecruiser;

global.info[enemies.fighter, 5] = 1; //currency
global.info[enemies.suicider, 5] = 1;
global.info[enemies.marauder, 5] = 2;
global.info[enemies.ion, 5] = 1;
global.info[enemies.bomber, 5] = 2;
global.info[enemies.sentinel, 5] = 3;
global.info[enemies.rusher, 5] = 3;
global.info[enemies.ranger, 5] = 3;
global.info[enemies.gunship, 5] = 5;
global.info[enemies.shotgunner, 5] = 5;
global.info[enemies.destroyer, 5] = 25;
global.info[enemies.swarmer, 5] = 1;
global.info[enemies.heavy_cruiser, 5] = 100;
global.info[enemies.battlecruiser, 5] = 500;

/*
global.info[enemies.fighter, 4] = ; //points
global.info[enemies.suicider, 4] = ;
global.info[enemies.marauder, 4] = ;
global.info[enemies.ion, 4] = ;
global.info[enemies.bomber, 4] = ;
global.info[enemies.rusher, 4] = ;
global.info[enemies.ranger, 4] = ;
global.info[enemies.gunship, 4] = ;
global.info[enemies.shotgunner, 4] = ;
global.info[enemies.destroyer, 4] = ;
global.info[enemies.swarmer, 4] = ;
global.info[enemies.heavy_cruiser, 4] = ;
global.info[enemies.battlecruiser, 4] = ;
*/
#region read stat file
if file_exists("stats.txt") {
	for (var i = 0; i < array_length(global.enemy); i++) {
		global.stats[i, 0] = global.enemy[i]; //name
		global.stats[i, 1] = 0 //kills
		global.stats[i, 2] = 0 //lvl 2 killed
		global.stats[i, 3] = 0 //lvl 3 killed
		global.stats[i, 4] = 0 //extra
		global.stats[i, 5] = 0 //extra
		global.stats[i, 6] = 0 //hit by
		global.stats[i, 7] = 0 //shot by
		global.stats[i, 8] = 0 //extra
	}
	
	var file = file_text_open_read("stats.txt");
	
	var j = 0;
	while !file_text_eof(file) {
		var _id = file_text_read_real(file);
		file_text_readln(file);
		
		var _name = file_text_read_string(file);
		for (var i = 0; i < array_length(global.enemy); i++) {
			if _name = global.enemy[i] {
				j = i;
				break;
			} else if i = array_length(global.enemy)-1 {
				show_debug_message("WARN: draw_menu_bestiary - skipping entry " + string(_name));
				j = -1;
				repeat (9) {
					file_text_readln(file);
				}	
			}
		}
		
		if j != -1 {
			global.stats[j, 0] = _name; //name
			file_text_readln(file);
			global.stats[j, 1] = real(file_text_read_real(file)); //kills
			file_text_readln(file);
			global.stats[j, 2] = real(file_text_read_real(file)); //lvl 2 killed
			file_text_readln(file);
			global.stats[j, 3] = real(file_text_read_real(file)); //lvl 3 killed
			file_text_readln(file);
			global.stats[j, 4] = real(file_text_read_real(file)); //extra
			file_text_readln(file);
			global.stats[j, 5] = real(file_text_read_real(file)); //extra
			file_text_readln(file);
			global.stats[j, 6] = real(file_text_read_real(file)); //hit by
			file_text_readln(file);
			global.stats[j, 7] = real(file_text_read_real(file)); //shot by
			file_text_readln(file);
			global.stats[j, 8] = real(file_text_read_real(file)); //extra
			file_text_readln(file);
		}
	}
	file_text_close(file);
	
	ini_open("data.ini");
	for (var i = 0; i < 25; i++) {
		top10_scores[0][i] = ini_read_real("top10_scores", string(0) + ":" + string(i), -1);
		top10_scores[1][i] = ini_read_real("top10_scores", string(1) + ":" + string(i), -1);
		top10_scores[2][i] = ini_read_real("top10_scores", string(2) + ":" + string(i), -1);
		top10_scores[3][i] = ini_read_real("top10_scores", string(3) + ":" + string(i), -1);
		top10_scores[4][i] = ini_read_string("top10_scores", string(4) + ":" + string(i), "");
		top10_scores[5][i] = ini_read_real("top10_scores", string(5) + ":" + string(i), -1);
	}
	ini_close();
	
	if array_length(global.stats) < array_length(global.enemy) {
		var file = file_text_open_append("stats.txt");
		for (var i = array_length(global.stats); i < array_length(global.enemy); i++) {
			file_text_write_real(file, i); //id #
			file_text_writeln(file);
			file_text_write_string(file, global.enemy[i]); //name
			file_text_writeln(file);
			file_text_write_real(file, 0); //kills
			file_text_writeln(file);
			file_text_write_real(file, 0); //lvl2 killed
			file_text_writeln(file);
			file_text_write_real(file, 0); //lvl3 killed
			file_text_writeln(file);
			file_text_write_real(file, 0); //extra
			file_text_writeln(file);
			file_text_write_real(file, 0); //extra
			file_text_writeln(file);
			file_text_write_real(file, 0); //extra
			file_text_writeln(file);
			file_text_write_real(file, 0); //extra
			file_text_writeln(file);
			file_text_write_real(file, 0); //extra
			file_text_writeln(file);
		}
		file_text_close(file);
	}
} else {
	var file = file_text_open_write("stats.txt");
	
	for (var i = 0; i < array_length(global.enemy); i++) {
		file_text_write_real(file, i); //id #
		file_text_writeln(file);
		file_text_write_string(file, global.enemy[i]); //name
		file_text_writeln(file);
		file_text_write_real(file, 0); //kills
		file_text_writeln(file);
		file_text_write_real(file, 0); //lvl2 killed
		file_text_writeln(file);
		file_text_write_real(file, 0); //lvl3 killed
		file_text_writeln(file);
		file_text_write_real(file, 0); //extra
		file_text_writeln(file);
		file_text_write_real(file, 0); //extra
		file_text_writeln(file);
		file_text_write_real(file, 0); //extra
		file_text_writeln(file);
		file_text_write_real(file, 0); //extra
		file_text_writeln(file);
		file_text_write_real(file, 0); //extra
		file_text_writeln(file);
	}
	file_text_close(file);
	
	for (var i = 0; i < array_length(global.enemy); i++) {
		global.stats[i, 0] = global.enemy[i]; //name
		global.stats[i, 1] = 0 //kills
		global.stats[i, 2] = 0 //lvl 2 killed
		global.stats[i, 3] = 0 //lvl 3 killed
		global.stats[i, 4] = 0 //extra
		global.stats[i, 5] = 0 //extra
		global.stats[i, 6] = 0 //hit by
		global.stats[i, 7] = 0 //shot by
		global.stats[i, 8] = 0 //extra
	}
}
#endregion

sc_initialize_menu_control();
sc_initialize_menu_topscores();
sc_initialize_menu_stats();
sc_initialize_menu_achievements();
alarm_set(2, 60); //initialize achievements

if !variable_global_exists("pts") global.pts = 0;
if !variable_global_exists("cheats") global.cheats = false;

global.selected_character = 0;

ini_open("data.ini");
if !ini_key_exists("coins", "coins") {
	ini_write_real("coins", "coins", 0);
	global.coins = 0;
} else {
	global.coins = ini_read_real("coins", "coins", 0);
}

if !ini_section_exists("settings") {
	ini_write_real("settings", "volume", 100);
	ini_write_real("settings", "music_volume", 100);
	ini_write_real("settings", "main_menu_volume", 100);
	ini_write_real("settings", "background_objects", 2);
	
	global.volume = 100;
	global.music = 100;
	global.menu_sound = 100;
	global.background_objects = 2;
} else {
	if !ini_key_exists("settings", "volume") {
		ini_write_real("settings", "volume", 100);
		global.volume = 100;
	} else {
		global.volume = ini_read_real("settings", "volume", 100);
	}
	
	if !ini_key_exists("settings", "music_volume") {
		ini_write_real("settings", "music_volume", 100);
		global.music = 100;
	} else {
		global.music = ini_read_real("settings", "music_volume", 100);
	}
	
	if !ini_key_exists("settings", "main_menu_volume") {
		ini_write_real("settings", "main_menu_volume", 100);
		global.menu_sound = 100;
	} else {
		global.menu_sound = ini_read_real("settings", "main_menu_volume", 100);
	}
	
	if !ini_key_exists("settings", "background_objects") {
		ini_write_real("settings", "background_objects", 2);
		global.background_objects = 2;
	} else {
		global.background_objects = ini_read_real("settings", "background_objects", 2);
	}
}

audio_group_set_gain(ag_game_sounds, (global.menu_sound / 100) * 0.1 * global.volume / 100, 0);
audio_group_set_gain(ag_menu_sounds, (global.menu_sound / 100) * global.volume / 100, 0);
audio_group_set_gain(ag_game_music, (global.menu_sound / 100) * global.music / 100, 0);

if !ini_key_exists("settings", "fullscreen") {
	ini_write_real("settings", "fullscreen", 0);
} else {
	window_set_fullscreen(ini_read_real("settings", "fullscreen", 0));
}

ini_close();
