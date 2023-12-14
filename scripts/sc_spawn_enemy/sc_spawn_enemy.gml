function sc_spawn_enemy(_spawn_level) {
	var _lvl_b = enemy_level_boost+1;
	var _shield_b = enemy_shield_boost+1;
	
	while _spawn_level > 0 {
		if _spawn_level >= 1 {
			var _r = irandom(array_length(enemy)-1);
			if enemy[_r][1] <= _spawn_level && enemy[_r][2] > random(1) && global.spawn_level > enemy[_r][3] {
				if _spawn_level >= enemy[_r][1]*3 && enemy[_r][1] = 1 && random(1) > .75 {
					var _x = -1;
					var _y = -1;
					
					if instance_exists(o_asteroid) {
						if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
						else var spawn = true;
					} else var spawn = true;
					
					while !spawn || (_x - o_player.x < view_wport[0]/2 && _x - o_player.x > -view_wport[0]/2 && _y - o_player.y > -view_hport[0]/2 && _y - o_player.y < view_hport[0]/2) || _y < 0 || _y > room_height {
						var _a = irandom(359);
						var _d = irandom_range(600*global.scale, 800*global.scale);
						var _x = lengthdir_x(_d, _a) + o_player.x;
						var _y = lengthdir_y(_d, _a) + o_player.y;
						var _x2 = lengthdir_x(_d+40, _a) + o_player.x;
						var _y2 = lengthdir_y(_d+40, _a) + o_player.y;
						var _x3 = lengthdir_x(_d+80, _a) + o_player.x;
						var _y3 = lengthdir_y(_d+80, _a) + o_player.y;
						
						if instance_exists(o_asteroid) {
							if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
							else var spawn = true;
						} else var spawn = true;
					}
					var _enemy1 = instance_create_layer(_x, _y, "Instances", enemy[_r][0]);
					var _enemy2 = instance_create_layer(_x2, _y2, "Instances", enemy[_r][0]);
					var _enemy3 = instance_create_layer(_x3, _y3, "Instances", enemy[_r][0]);
				
					enemy[_r][2] *= .8;
				
					_enemy1.followed = _enemy2;
					_enemy1.upgrades = 0;
					
					_enemy2.following = _enemy1;
					_enemy2.followed = _enemy3;
					_enemy2.follow = true;
					_enemy2.upgrades = 0;
				
					_enemy3.following = _enemy2;
					_enemy3.follow = true;
					_enemy3.upgrades = 0;
				
					_spawn_level -= 3*enemy[_r][1];
					
					if _enemy1.upgrades = 0 && min(0.75, 0.015*(global.spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1] {
						_enemy1.upgrades += 1;
						_enemy2.upgrades += 1;
						_enemy3.upgrades += 1;
						_spawn_level -= enemy[_r][1];
						if _enemy1.upgrades = 1 && min(0.5, 0.005*(global.spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1] {
							_enemy1.upgrades += 1;
							_enemy2.upgrades += 1;
							_enemy3.upgrades += 1;
							_spawn_level -= enemy[_r][1];
							if random(1) < ((global.spawn_level-enemy[_r][3])*_shield_b)/50 and irandom(1) > 0.9 {
								_enemy1.has_shield = true;
								_enemy2.has_shield = true;
								_enemy3.has_shield = true;
							}
						} else {
							if random(1) < ((global.spawn_level-enemy[_r][3])*_shield_b)/100 and irandom(1) > 0.9 {
								_enemy1.has_shield = true;
								_enemy2.has_shield = true;
								_enemy3.has_shield = true;
							}
						}
					} else {
						if random(1) < ((global.spawn_level-enemy[_r][3])*_shield_b)/250 and irandom(1) > 0.9 {
							_enemy1.has_shield = true;
							_enemy2.has_shield = true;
							_enemy3.has_shield = true;
						}
					}

				} else {
					var _x = -1;
					var _y = -1;
					
					if instance_exists(o_asteroid) {
						if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
						else var spawn = true;
					} else var spawn = true;
					
					while place_meeting(_x, _y, o_asteroid) || (_x - o_player.x < view_wport[0]/2 && _x - o_player.x > -view_wport[0]/2 && _y - o_player.y > -view_hport[0]/2 && _y - o_player.y < view_hport[0]/2) || _y < 0 || _y > room_height {
						var _a = irandom(359);
						var _d = irandom_range(600*global.scale, 800*global.scale);
						var _x = lengthdir_x(_d, _a) + o_player.x;
						var _y = lengthdir_y(_d, _a) + o_player.y;
						
						if instance_exists(o_asteroid) {
							if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
							else var spawn = true;
						} else var spawn = true;
					}
					var _enemy = instance_create_layer(_x, _y, "Instances", enemy[_r][0]);
					enemy[_r][2] *= .8;
				
					_spawn_level -= enemy[_r][1];
					_enemy.upgrades = 0;
					
					if _enemy.upgrades = 0 && min(0.75, 0.015*(global.spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1]/3 {
						_enemy.upgrades += 1;
						_spawn_level -= enemy[_r][1]/3;
						if _enemy.upgrades = 1 && min(0.5, 0.005*(global.spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1]/3 {
							_enemy.upgrades += 1;
							_spawn_level -= enemy[_r][1]/3;
							if random(1) < ((global.spawn_level-enemy[_r][3])*_shield_b)/50 and irandom(1) > 0.9 _enemy.has_shield = true;
						} else {
							if random(1) < ((global.spawn_level-enemy[_r][3])*_shield_b)/100 and irandom(1) > 0.9 _enemy.has_shield = true;
						}
					} else {
						if random(1) < ((global.spawn_level-enemy[_r][3])*_shield_b)/250 and irandom(1) > 0.9 _enemy.has_shield = true;
					}
					round(_spawn_level);
				}
			}
		} else {
			var _x = -1;
			var _y = -1;
			
			if instance_exists(o_asteroid) {
				if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
				else var spawn = true;
			} else var spawn = true;
		
			while place_meeting(_x, _y, o_asteroid) || (_x - o_player.x < view_wport[0]/2 && _x - o_player.x > -view_wport[0]/2 && _y - o_player.y > -view_hport[0]/2 && _y - o_player.y < view_hport[0]/2) || _y < 0 || _y > room_height {
				var _a = irandom(359);
				var _d = irandom_range(600*global.scale, 800*global.scale);
				var _x = lengthdir_x(_d, _a) + o_player.x;
				var _y = lengthdir_y(_d, _a) + o_player.y;
				
				if instance_exists(o_asteroid) {
					if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
					else var spawn = true;
				} else var spawn = true;
			}
			var _enemy = instance_create_layer(_x, _y, "Instances", choose(o_enemy_basic, o_enemy_suicider));
			_enemy.upgrades = 0;
			_spawn_level = 0;
		}
	}
}