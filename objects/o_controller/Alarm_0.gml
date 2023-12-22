/// @description Spawn Enemies
round_intermission = false;

o_menu.wave_alpha = 1;

global.spawn_level += 1;

if global.cheats = false && global.steam_api = true and instance_exists(o_player) var _stats = true;
else var _stats = false;

if _stats and global.spawn_level-1 > steam_get_stat_int("highest_wave") steam_set_stat_int("highest_wave", global.spawn_level-1);

var _spawn_level = (global.spawn_level + (global.spawn_level/4)*enemy_spawn_boost)/5;

var k = sc_spawn_enemy_initiate();

if global.spawn_level = global.next_boss_wave {
	audio_play_sound(sfx_alarm_loop6, 10, false);
}

if global.spawn_level-1 = enemy[enemies.destroyer][3] {
	global.next_boss_wave = enemy[enemies.heavy_cruiser][3];
} else if global.spawn_level-1 = enemy[enemies.heavy_cruiser][3] {
	global.next_boss_wave = enemy[enemies.battlecruiser][3];
} else if global.spawn_level-1 = enemy[enemies.battlecruiser][3] {
	global.next_boss_wave = -1;
}

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
	
sc_spawn_enemy(_spawn_level, global.spawn_level);
