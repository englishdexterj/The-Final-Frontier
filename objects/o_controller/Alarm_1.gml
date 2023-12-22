/// @description Spawn Enemies TESTER
randomize();
for (var i = 0; i < 15; i++) {
	for (var j = 1; j <= 100; j++) {
		enemy_total[i][j] = 0;
		enemy_total2[i][j] = 0;
		enemy_total3[i][j] = 0;
	}
	enemy_total[i][0] = 0;
	enemy_total2[i][0] = 0;
	enemy_total3[i][0] = 0;
}

var _progress = 0;
repeat(10) {
	show_debug_game("Enemy Test " + string((_progress/10)*100) + "%");
	_progress++;
	repeat (1000) {
		for (var j = 1; j <= 100; j++) {
		var k = sc_spawn_enemy_initiate();

		var _spawn_level = j/5;
		var skip = false
		for (var i = 0; i < array_length(enemy); i++) {
			if enemy[i][3] = j { //skip if current wave is first time seeing enemy
				//show_debug_message("Lvl " + string(j) + "" 1 " + string(enemy[i][5]));
				enemy_total[i][j] += 1;
				enemy_total[i][0] += 1;
				enemy_total[k][j] += 1;
				enemy_total[k][0] += 1;
				skip = true;
			}
		}
	
		if skip = false {
			sc_spawn_enemy(_spawn_level, j, true, j, k);
		}
		}
	}
}

var str = "Enemy|";
for (var i = 0; i < array_length(enemy_total); i++) {
	repeat (3) {
		if i = k str = str;
		else str = str + string(enemy[i][5]) + "|";
	}
}
show_debug_message(str);

for (var j = 1; j <= 100; j++) {
	var str = "Lvl " + string(j) + "|";
	for (var i = 0; i < array_length(enemy_total); i++) {
		str = str + string(enemy_total[i][j]) + "|";
		str = str + string(enemy_total2[i][j]) + "|";
		str = str + string(enemy_total3[i][j]) + "|";
		enemy_total[i][j] = 0;
		enemy_total2[i][j] = 0;
		enemy_total3[i][j] = 0;
	}
	show_debug_message(str);
}

var str = "Totals: |";
for (var i = 0; i < array_length(enemy_total); i++) {
	str = str + string(enemy_total[i][0]) + "|";
	str = str + string(enemy_total2[i][0]) + "|";
	str = str + string(enemy_total3[i][0]) + "|";
	enemy_total[i][0] = 0;
	enemy_total2[i][0] = 0;
	enemy_total3[i][0] = 0;
}
show_debug_message(str);
