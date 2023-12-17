/// @description Spawn Enemies
round_intermission = false;

o_menu.wave_alpha = 1;

global.spawn_level += 1;

if global.cheats = false && global.steam_api = true and instance_exists(o_player) var _stats = true;
else var _stats = false;

if _stats and global.spawn_level-1 > steam_get_stat_int("highest_wave") steam_set_stat_int("highest_wave", global.spawn_level-1);

var _spawn_level = (global.spawn_level + (global.spawn_level/4)*enemy_spawn_boost)/5;

enemy[0][0] = o_enemy_basic; //type
enemy[0][1] = 1; //points
enemy[0][2] = 1; //chance
enemy[0][3] = 1; //introduction
enemy[0][4] = 0; //total spawned
enemy[0][5] = "Fighter"; //name

enemy[1][0] = o_enemy_suicider;
enemy[1][1] = 1;
enemy[1][2] = 1;
enemy[1][3] = 2; //introduction
enemy[1][4] = 0; //total spawned
enemy[1][5] = "Suicider"; //name

enemy[2][0] = o_enemy_ion;
enemy[2][1] = 1;
enemy[2][2] = .25;
enemy[2][3] = 5; //introduction
enemy[2][4] = 0; //total spawned
enemy[2][5] = "Ion"; //name

enemy[3][0] = o_enemy_marauder;
enemy[3][1] = 2;
enemy[3][2] = .5;
enemy[3][3] = 10; //introduction
enemy[3][4] = 0; //total spawned
enemy[3][5] = "Marauder"; //name

enemy[4][0] = o_enemy_bomber;
enemy[4][1] = 2;
enemy[4][2] = .85;
enemy[4][3] = 20; //introduction
enemy[4][4] = 0; //total spawned
enemy[4][5] = "Bomber"; //name

enemy[5][0] = o_enemy_rusher; //rusher
enemy[5][1] = 3;
enemy[5][2] = .5;
enemy[5][3] = 25; //introduction
enemy[5][4] = 0; //total spawned
enemy[5][5] = "Rusher"; //name

enemy[6][0] = o_enemy_sniper; //ranger
enemy[6][1] = 3;
enemy[6][2] = .5;
enemy[6][3] = 30; //introduction
enemy[6][4] = 0; //total spawned
enemy[6][5] = "Ranger"; //name

enemy[7][0] = o_enemy_gunship;
enemy[7][1] = 4;
enemy[7][2] = .75;
enemy[7][3] = 40; //introduction
enemy[7][4] = 0; //total spawned
enemy[7][5] = "Gunship"; //name

enemy[8][0] = o_enemy_destroyer;
enemy[8][1] = 8;
enemy[8][2] = .5;
enemy[8][3] = 50; //introduction
enemy[8][4] = 0; //total spawned
enemy[8][5] = "Destroyer"; //name

enemy[9][0] = o_enemy_shotgunner; //shotgunner
enemy[9][1] = 5;
enemy[9][2] = .5;
enemy[9][3] = 60; //introduction
enemy[9][4] = 0; //total spawned
enemy[9][5] = "Shotgunner"; //name

enemy[10][0] = o_enemy_swarmer_controller; //swarmer
enemy[10][1] = 3;
enemy[10][2] = .5;
enemy[10][3] = 70; //introduction
enemy[10][4] = 0; //total spawned
enemy[10][5] = "Swarmer"; //name

enemy[11][0] = o_enemy_heavy_cruiser;
enemy[11][1] = 12;
enemy[11][2] = .1;
enemy[11][3] = 80; //introduction
enemy[11][4] = 0; //total spawned
enemy[11][5] = "Heavy Cruiser"; //name

enemy[12][0] = o_enemy_battlecruiser;
enemy[12][1] = 25;
enemy[12][2] = .1;
enemy[12][3] = 100; //introduction
enemy[12][4] = 0; //total spawned
enemy[12][5] = "Battlecruiser"; //name

if global.spawn_level <= enemy[enemies.destroyer][3] global.next_boss_wave = enemy[enemies.destroyer][3];
else if global.spawn_level <= enemy[enemies.heavy_cruiser][3] global.next_boss_wave = enemy[enemies.heavy_cruiser][3];
else if global.spawn_level <= enemy[enemies.battlecruiser][3] global.next_boss_wave = enemy[enemies.battlecruiser][3];

for (var i = 0; i < array_length(enemy); i++) {
	if enemy[i][3] = global.spawn_level {
		var _y = room_height/2;
		var _x = o_player.x + room_width/2 - view_wport[0];
		
		if instance_exists(o_asteroid) {
			if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
			else var spawn = true;
		} else var spawn = true;
		while spawn = false || (_x - o_player.x < view_wport[0]/2 && _x - o_player.x > -view_wport[0]/2 && _y - o_player.y > -view_hport[0]/2 && _y - o_player.y < view_hport[0]/2) || _y < 0 || _y > room_height {
			var _a = irandom(359);
			var _d = irandom_range(600*global.scale, 800*global.scale);
			var _x = lengthdir_x(_d, _a) + o_player.x;
			var _y = lengthdir_y(_d, _a) + o_player.y;
			
			if instance_exists(o_asteroid) {
				if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
				else var spawn = true;
			} else var spawn = true;
		}
		
		var _e = instance_create_layer(_x, _y, "Instances_Top", enemy[i][0]);
		_e.upgrades = 0;
		
		_spawn_level -= enemy[i][1];
		
		exit;
	}
}
	
sc_spawn_enemy(_spawn_level);
