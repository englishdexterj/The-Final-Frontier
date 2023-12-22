function sc_spawn_enemy(_spawn_level, _global_spawn_level, spawn_test = false, j = 0, k = 0) {
	var _lvl_b = enemy_level_boost+1;
	var _shield_b = enemy_shield_boost+1;
	
	while _spawn_level > 0 {
		if _spawn_level >= 1 {
			var _r = irandom(array_length(enemy)-1);
			if enemy[_r][1] <= _spawn_level && enemy[_r][2] > random(1) && _global_spawn_level > enemy[_r][3] {
				if (_spawn_level >= enemy[_r][1]*3 && enemy[_r][1] <= 2 && random(1) > .75) {
					#region create triple followers
					if !spawn_test {
						var _x = -1;
						var _y = -1;
					
						if instance_exists(o_asteroid) {
							if point_distance(_x, _y, instance_nearest(_x, _y, o_asteroid).x, instance_nearest(_x, _y, o_asteroid).y) < 128*global.scale var spawn = true;
							else var spawn = true;
						} else var spawn = true;
					
						while !spawn || (_x - o_player.x < view_wport[0]/2 && _x - o_player.x > -view_wport[0]/2 && _y - o_player.y > -view_hport[0]/2 && _y - o_player.y < view_hport[0]/2) || _y < 0 || _y > room_height {
							var _a = irandom(359);
							var _d = irandom_range(600*global.scale, 1200*global.scale);
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
						
						//triple follows different types
						if random(1) > .25 {
							var _enemy1 = instance_create_layer(_x, _y, "Instances_Top", enemy[_r][0]);
							var _r2 = irandom(array_length(enemy)-1);
							while enemy[_r2][1] > 2 _r2 = irandom(array_length(enemy)-1);
							if enemy[_r][1] - enemy[_r2][1] <= 1 and enemy[_r2][1] <= 2 and enemy[_r2][2] > random(1) { //if point value difference is 1 or less, only 2 points or less, and enemy spawn chance succeeded
								enemy[_r2][2] *= .8;
								var _enemy2 = instance_create_layer(_x2, _y2, "Instances_Top", enemy[_r2][0]);
							} else { //otherwise keep original enemy
								enemy[_r][2] *= .8;
								_r2 = _r;
								var _enemy2 = instance_create_layer(_x2, _y2, "Instances_Top", enemy[_r][0]);
							}
							
							if random(1) > .5 var _r3 = _r2; //50% chance for third enemy to be same as second
							else {
								var _r3 = irandom(array_length(enemy)-1);
								while enemy[_r3][1] > 2 _r3 = irandom(array_length(enemy)-1);
							}
							if enemy[_r][1] - enemy[_r3][1] <= 1 and enemy[_r3][1] <= 2 and enemy[_r3][2] > random(1) { //if point value difference is 1 or less, only 2 points or less, and enemy spawn chance succeeded
								enemy[_r3][2] *= .8;
								var _enemy3 = instance_create_layer(_x3, _y3, "Instances_Top", enemy[_r3][0]);
							} else { //otherwise keep original enemy
								enemy[_r][2] *= .8;
								_r3 = _r;
								var _enemy3 = instance_create_layer(_x3, _y3, "Instances_Top", enemy[_r][0]);
							}
						} else {
							enemy[_r][2] *= .8; enemy[_r][2] *= .8; enemy[_r][2] *= .8;
							var _r2 = _r;
							var _r3 = _r;
							
							var _enemy1 = instance_create_layer(_x, _y, "Instances_Top", enemy[_r][0]);
							var _enemy2 = instance_create_layer(_x2, _y2, "Instances_Top", enemy[_r][0]);
							var _enemy3 = instance_create_layer(_x3, _y3, "Instances_Top", enemy[_r][0]);
						}
				
						_enemy1.followed = _enemy2;
						_enemy1.upgrades = 0;
					
						_enemy2.following = _enemy1;
						_enemy2.followed = _enemy3;
						_enemy2.follow = true;
						_enemy2.upgrades = 0;
				
						_enemy3.following = _enemy2;
						_enemy3.follow = true;
						_enemy3.upgrades = 0;
				
						_spawn_level -= enemy[_r][1];
						_spawn_level -= enemy[_r2][1];
						_spawn_level -= enemy[_r3][1];
						
						_spawn_level = sc_spawn_enemy_upgrade(_enemy1, _r, _spawn_level, _global_spawn_level, _lvl_b, _shield_b);
						_spawn_level = sc_spawn_enemy_upgrade(_enemy2, _r2, _spawn_level, _global_spawn_level, _lvl_b, _shield_b);
						_spawn_level = sc_spawn_enemy_upgrade(_enemy3, _r3, _spawn_level, _global_spawn_level, _lvl_b, _shield_b);
					} else {
						//triple follows different types
						if random(1) > .25 {
							enemy[_r][4]++;
							var _r2 = irandom(array_length(enemy)-1);
							while enemy[_r2][1] > 2 _r2 = irandom(array_length(enemy)-1);
							if enemy[_r][1] - enemy[_r2][1] <= 1 and enemy[_r2][1] <= 2 and enemy[_r2][2] > random(1) { //if point value difference is 1 or less, only 2 points or less, and enemy spawn chance succeeded
								enemy[_r2][2] *= .8;
								enemy[_r2][4]++;
							} else { //otherwise keep original enemy
								enemy[_r][2] *= .8;
								enemy[_r][4]++;
								_r2 = _r;
							}
							
							if random(1) > .5 var _r3 = _r2; //50% chance for third enemy to be same as second
							else {
								var _r3 = irandom(array_length(enemy)-1);
								while enemy[_r3][1] > 2 _r3 = irandom(array_length(enemy)-1);
							}
							if enemy[_r][1] - enemy[_r3][1] <= 1 and enemy[_r3][1] <= 2 and enemy[_r3][2] > random(1) { //if point value difference is 1 or less, only 2 points or less, and enemy spawn chance succeeded
								enemy[_r3][2] *= .8;
								enemy[_r3][4]++;
							} else { //otherwise keep original enemy
								enemy[_r][2] *= .8;
								enemy[_r][4]++;
								_r3 = _r;
							}
						} else {
							enemy[_r][2] *= .8; enemy[_r][2] *= .8; enemy[_r][2] *= .8;
							enemy[_r][4] += 3;
							var _r2 = _r;
							var _r3 = _r;
						}
				
						_spawn_level -= enemy[_r][1];
						_spawn_level -= enemy[_r2][1];
						_spawn_level -= enemy[_r3][1];
						
						_spawn_level = sc_spawn_enemy_upgrade(0, _r, _spawn_level, _global_spawn_level, _lvl_b, _shield_b, spawn_test, k, j);
						_spawn_level = sc_spawn_enemy_upgrade(0, _r2, _spawn_level, _global_spawn_level, _lvl_b, _shield_b, spawn_test, k, j);
						_spawn_level = sc_spawn_enemy_upgrade(0, _r3, _spawn_level, _global_spawn_level, _lvl_b, _shield_b, spawn_test, k, j);
					}
					#endregion
				} else {
					#region spawn single enemy
					if !spawn_test {
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
						var _enemy = instance_create_layer(_x, _y, "Instances_Top", enemy[_r][0]);
						enemy[_r][2] *= .8;
				
						_spawn_level -= enemy[_r][1];
						_enemy.upgrades = 0;
					
						if _enemy.upgrades = 0 && min(0.75, 0.015*(_global_spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1]/3 {
							_enemy.upgrades += 1;
							_spawn_level -= enemy[_r][1]/3;
							if _enemy.upgrades = 1 && min(0.5, 0.005*(_global_spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1]/3 {
								_enemy.upgrades += 1;
								_spawn_level -= enemy[_r][1]/3;
								if random(1) < ((_global_spawn_level-enemy[_r][3])*_shield_b)/50 and irandom(1) > 0.9 _enemy.has_shield = true;
							} else {
								if random(1) < ((_global_spawn_level-enemy[_r][3])*_shield_b)/100 and irandom(1) > 0.9 _enemy.has_shield = true;
							}
						} else {
							if random(1) < ((_global_spawn_level-enemy[_r][3])*_shield_b)/250 and irandom(1) > 0.9 _enemy.has_shield = true;
						}
						round(_spawn_level);
					} else {
						enemy[_r][2] *= .8;
				
						_spawn_level -= enemy[_r][1];
					
						if min(0.75, 0.015*(_global_spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1]/3 { //check for lvl 2 enemy
							_spawn_level -= enemy[_r][1]/3;
							if min(0.5, 0.005*(_global_spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1]/3 { //check for lvl 3 enemy
								_spawn_level -= enemy[_r][1]/3;
								enemy_total3[_r][j] += 1;
								enemy_total3[_r][0] += 1;
								enemy_total3[k][j] += 1;
								enemy_total3[k][0] += 1;
							} else { //if lvl 3 fails, set lvl 2 stats
								enemy_total2[_r][j] += 1;
								enemy_total2[_r][0] += 1;
								enemy_total2[k][j] += 1;
								enemy_total2[k][0] += 1;
							}
						} else { //if lvl 2 fails, set lvl 1 stats
							enemy_total[_r][j] += 1;
							enemy_total[_r][0] += 1;
							enemy_total[k][j] += 1;
							enemy_total[k][0] += 1;
						}
						
						round(_spawn_level);
					}
					#endregion
				}
			}
		} else {
			#region spawn last enemy if less than 1 spawn point
			if !spawn_test {
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
				var _enemy = instance_create_layer(_x, _y, "Instances_Top", choose(o_enemy_basic, o_enemy_suicider));
				_enemy.upgrades = 0;
				_spawn_level = 0;
			} else { //if less than 1 spawn point, choose either fighter or suicider
				var _r = irandom(1);
				enemy[_r][4] += 1;
				enemy_total[_r][j] += 1;
				enemy_total[_r][0] += 1;
				enemy_total[k][j] += 1;
				enemy_total[k][0] += 1;
				_spawn_level = 0;
			}
			#endregion
		}
	}
}