// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_spawn_enemy_upgrade(enemy_id, _r, _spawn_level, _global_spawn_level, _lvl_b, _shield_b, _spawn_test = false, k = 0, j = 0) {
	if !_spawn_test {
		if min(0.75, 0.015*(_global_spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1] { //check for lvl 2 enemy
			enemy_id.upgrades = 1;
			_spawn_level -= enemy[_r][1];
			if min(0.5, 0.005*(_global_spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1] { //check to spawn lvl 3 enemy
				enemy_id.upgrades = 2;
				_spawn_level -= enemy[_r][1];
				if random(1) < ((_global_spawn_level-enemy[_r][3])*_shield_b)/50 and irandom(1) > 0.9 { //check for lvl 3 shield
					enemy_id.has_shield = true;
				}
			} else {
				if random(1) < ((_global_spawn_level-enemy[_r][3])*_shield_b)/100 and irandom(1) > 0.9 { //check for lvl 2 shield
					enemy_id.has_shield = true;
				}
			}
		} else {
			if random(1) < ((_global_spawn_level-enemy[_r][3])*_shield_b)/250 and irandom(1) > 0.9 { //check for lvl 1 shield
				enemy_id.has_shield = true;
			}
		}
	} else {
		if min(0.75, 0.015*(_global_spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1] { //check for lvl 2 enemy
			_spawn_level -= enemy[_r][1];
			enemy_total2[_r][j] += 1;
			enemy_total2[_r][0] += 1;
			enemy_total2[k][j] += 1;
			enemy_total2[k][0] += 1;
			if min(0.5, 0.005*(_global_spawn_level-enemy[_r][3])*_lvl_b) > random(1) && _spawn_level >= enemy[_r][1] { //check to spawn lvl 3 enemy
				_spawn_level -= enemy[_r][1];
				enemy_total3[_r][j] += 1;
				enemy_total3[_r][0] += 1;
				enemy_total3[k][j] += 1;
				enemy_total3[k][0] += 1;
			} else {
				
			}
		} else { //otherwise lvl 1 enemy
			enemy_total[_r][j] += 1;
			enemy_total[_r][0] += 1;
			enemy_total[k][j] += 1;
			enemy_total[k][0] += 1;
		}
	}
	
	return _spawn_level;
}