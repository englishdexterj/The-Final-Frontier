function sc_save_score(quit) {
	final_wave = global.spawn_level;
	final_level = global.level;
	killed_enemies = global.ships_destroyed;
	final_score = global.pts;
	
	if global.cheats = false {
		#region write enemy kill stats to file
	
		if file_exists("stats.txt") {
			file_delete("stats.txt");
		}
			
		var stat_file = file_text_open_write("stats.txt");
	
		for (var i = 0; i < array_length(global.stats); i++) {
			file_text_write_real(stat_file, i); //id #
			file_text_writeln(stat_file);
			file_text_write_string(stat_file, global.stats[i, 0]); //name
			file_text_writeln(stat_file);
			file_text_write_real(stat_file, real(global.stats[i, 1])); //kills
			file_text_writeln(stat_file);
			file_text_write_real(stat_file, real(global.stats[i, 2])); //lvl2 killed
			file_text_writeln(stat_file);
			file_text_write_real(stat_file, real(global.stats[i, 3])); //lvl3 killed
			file_text_writeln(stat_file);
			file_text_write_real(stat_file, real(global.stats[i, 4])); //extra
			file_text_writeln(stat_file);
			file_text_write_real(stat_file, real(global.stats[i, 5])); //extra
			file_text_writeln(stat_file);
			file_text_write_real(stat_file, real(global.stats[i, 6])); //hit by
			file_text_writeln(stat_file);
			file_text_write_real(stat_file, real(global.stats[i, 7])); //shot by
			file_text_writeln(stat_file);
			file_text_write_real(stat_file, real(global.stats[i, 8])); //extra
			file_text_writeln(stat_file);
		}
		file_text_close(stat_file);
		#endregion
	
		if !quit {
			#region save high score to steam
			if global.cheats = false && global.steam_api = true {
				var _leaderboard = string(global.selected_character) + ":" + string(global.ascension_modifier[global.selected_character]);
				steam_create_leaderboard(_leaderboard, lb_sort_descending, lb_disp_numeric);
			
				upload_ID = steam_upload_score(_leaderboard, global.pts);
			
				if !upload_ID alarm_set(2, room_speed);
				steam_set_stat_int("total_deaths", steam_get_stat_int("total_deaths") + 1);
				steam_set_stat_int("total_games", steam_get_stat_int("total_games") + 1);
				steam_set_stat_int("total_rounds", steam_get_stat_int("total_rounds") + global.spawn_level);
			}
			#endregion
		
			#region update max ascension
			if global.spawn_level >= 51 and global.ascension_modifier[global.selected_character] = global.ascension_modifier_max[global.selected_character] {
				ini_open("data.ini");
				ini_write_real("ascensions", global.selected_character, global.ascension_modifier_max[global.selected_character] + 1);
				ini_close();
	
				global.ascension_modifier_max[global.selected_character]++;
			}
			#endregion
		
			#region save high scores
			ini_open("data.ini");
			if global.pts > ini_read_real("scores", string(global.selected_character) + ":" + string(global.ascension_modifier[global.selected_character]), 0) {
				ini_write_real("scores", string(global.selected_character) + ":" + string(global.ascension_modifier[global.selected_character]), global.pts);
				new_highscore = true;
			} else new_highscore = false;
		
			for (var i = 0; i < 25; i++) {
				top10_scores[0][i] = ini_read_real("top10_scores", string(0) + ":" + string(i), -1);
				top10_scores[1][i] = ini_read_real("top10_scores", string(1) + ":" + string(i), -1);
				top10_scores[2][i] = ini_read_real("top10_scores", string(2) + ":" + string(i), -1);
				top10_scores[3][i] = ini_read_real("top10_scores", string(3) + ":" + string(i), -1);
				top10_scores[4][i] = ini_read_string("top10_scores", string(4) + ":" + string(i), "");
				top10_scores[5][i] = ini_read_real("top10_scores", string(5) + ":" + string(i), -1);
			}
		
			for (var i = 0; i < 25; i++) {
				if global.pts > top10_scores[0][i] {
					for (var j = 24; j > i; j--) {
						ini_write_real("top10_scores", "0:" + string(j), top10_scores[0][j-1]);
						ini_write_real("top10_scores", "1:" + string(j), top10_scores[1][j-1]);
						ini_write_real("top10_scores", "2:" + string(j), top10_scores[2][j-1]);
						ini_write_real("top10_scores", "3:" + string(j), top10_scores[3][j-1]);
						ini_write_string("top10_scores", "4:" + string(j), top10_scores[4][j-1]);
						ini_write_real("top10_scores", "5:" + string(j), top10_scores[5][j-1]);
					}
					ini_write_real("top10_scores", "0:" + string(i), global.pts);
					ini_write_real("top10_scores", "1:" + string(i), global.selected_character);
					ini_write_real("top10_scores", "2:" + string(i), global.ascension_modifier[global.selected_character]);
					ini_write_real("top10_scores", "3:" + string(i), global.color_modifier[global.selected_character]);
					ini_write_string("top10_scores", "4:" + string(i), o_player.upgrade_string + ":");
					ini_write_real("top10_scores", "5:" + string(i), global.spawn_level);
					/*
					if instance_exists(o_player) and variable_instance_exists(o_player, "upgrade_string") {
						ini_write_string("top10_scores", "4:" + string(i), o_player.upgrade_string + ":");
					} else ini_write_string("top10_scores", "4:" + string(i), ":");
					*/
					break;
				}
			}
			ini_close();
			#endregion
	
			#region compute and save points
			var _pts = 0;
		
			for (var i = 0; i < array_length(killed); i++) {
				for (var j = 0; j < 3; j++) {
					if i >= array_length(killed)-2 j+= 2;
					if killed[i, j] > 0 {
						_pts += killed[i, j]*global.info[i, 5]*(j+1);
					}
				}
			}
		
			total_coins = _pts;
			global.coins += round((_pts)*(global.ascension_modifier[global.selected_character]*2/10 + 1));
		
			ini_open("data.ini");
			ini_write_real("coins", "coins", global.coins);
			ini_close();
			#endregion
		}
	}
	
	global.level = 1;
	global.spawn_level = 0;
	global.pts = 0;
	global.ships_destroyed = 0;
	global.cheats = false;
}