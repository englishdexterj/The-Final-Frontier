function sc_spawn_enemy_test(_spawn_level, j) {
	while _spawn_level > 0 {
		if _spawn_level >= 1 {
			var _r = irandom(array_length(enemy)-1);
			if enemy[_r][1] <= _spawn_level && enemy[_r][2] > random(1) && j >= enemy[_r][3] {
				if _spawn_level >= enemy[_r][1]*3 && enemy[_r][1] = 1 && random(1) > .5 {
					enemy[_r][4] += 3;
					
					enemy[_r][2] *= .8;
					_spawn_level -= 3*enemy[_r][1];
					
					var upgrades = 0;
					
					if upgrades = 0 && min(0.75, 0.015*(j-enemy[_r][3])) > random(1) && _spawn_level >= enemy[_r][1] {
						upgrades = 1;
						_spawn_level -= enemy[_r][1];
						if upgrades = 1 && min(0.5, 0.005*(j-enemy[_r][3])) > random(1) && _spawn_level >= enemy[_r][1] {
							enemy_total3[_r][j] += 3;
							enemy_total3[_r][0] += 3;
							enemy_total3[12][j] += 3;
							enemy_total3[12][0] += 3;
							upgrades = 2;
							_spawn_level -= enemy[_r][1];
						} else {
							enemy_total2[_r][j] += 3;
							enemy_total2[_r][0] += 3;
							enemy_total2[12][j] += 3;
							enemy_total2[12][0] += 3;
						}
					} else {
						enemy_total[_r][j] += 3;
						enemy_total[_r][0] += 3;
						enemy_total[12][j] += 3;
						enemy_total[12][0] += 3;
					}
				} else {
					enemy[_r][4] += 1;
					enemy[_r][2] *= .8;
				
					_spawn_level -= enemy[_r][1];
					var upgrades = 0;
					if upgrades = 0 && min(0.75, 0.015*(j-enemy[_r][3])) > random(1) && _spawn_level >= enemy[_r][1]/3 {
						upgrades += 1;
						_spawn_level -= enemy[_r][1]/3;
						if upgrades = 1 && min(0.5, 0.005*(j-enemy[_r][3])) > random(1) && _spawn_level >= enemy[_r][1]/3 {
							upgrades += 1;
							_spawn_level -= enemy[_r][1]/3;
						}
					}
					if upgrades = 0 {
						enemy_total[_r][j] += 1;
						enemy_total[_r][0] += 1;
						enemy_total[12][j] += 1;
						enemy_total[12][0] += 1;
					} else if upgrades = 1 {
						enemy_total2[_r][j] += 1;
						enemy_total2[_r][0] += 1;
						enemy_total2[12][j] += 1;
						enemy_total2[12][0] += 1;
					} else if upgrades = 2 {
						enemy_total3[_r][j] += 1;
						enemy_total3[_r][0] += 1;
						enemy_total3[12][j] += 1;
						enemy_total3[12][0] += 1;
					}
					
					round(_spawn_level);
				}
			}
		} else {
			var _r = irandom(1);
			enemy[_r][4] += 1;
			enemy_total[_r][j] += 1;
			enemy_total[_r][0] += 1;
			enemy_total[12][j] += 1;
			enemy_total[12][0] += 1;
			_spawn_level = 0;
		}
	}
}