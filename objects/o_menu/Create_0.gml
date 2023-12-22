global.steam_api = false;

sc_initialize_menu_control();
sc_initialize_menu_topscores();
sc_initialize_menu_stats();
sc_initialize_menu_achievements();
if !global.steam_api alarm_set(4, 60);

//particles
global.particle_sys = part_system_create();
part_system_depth(global.particle_sys, -100);

sc_init_part();
//

setup = false

round_intermission = false;

alarm_set(0, 2);

final_level = 0;
final_wave = 0;
final_score = 0;

start_alpha = 1;

for (var i = 0; i < 30; i++) {
	for (var j = 0; j < 10; j++) {
		killed[i, j] = 0;
	}
}

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

total_coins = 0;
killed_enemies = 0;

pause = false;
game_over = false;
menu_active = true;
levelup_menu = false;
levelup_points = 250;
levelup_points_last = 0;
levelup_available = false;

wave_alpha = 0;

new_highscore = false;

hp = 0;
heat = 0;
