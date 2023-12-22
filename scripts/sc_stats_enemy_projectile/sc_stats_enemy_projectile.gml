function sc_stats_enemy_projectile() {
	if other.enemy_type ="basic" {
		if hp = 0 steam_set_stat_int("killedby_basic", steam_get_stat_int("killedby_basic") + 1);
		steam_set_stat_int("shotby_basic", steam_get_stat_int("shotby_basic") + 1);
	} else if other.enemy_type ="suicider" {
		if hp = 0 steam_set_stat_int("killedby_suicider", steam_get_stat_int("killedby_suicider") + 1);
		steam_set_stat_int("shotby_suicider", steam_get_stat_int("shotby_suicider") + 1);
	} else if other.enemy_type ="marauder" {
		if hp = 0 steam_set_stat_int("killedby_marauder", steam_get_stat_int("killedby_marauder") + 1);
		steam_set_stat_int("shotby_marauder", steam_get_stat_int("shotby_marauder") + 1);
	} else if other.enemy_type ="ion" {
		if hp = 0 steam_set_stat_int("killedby_ion", steam_get_stat_int("killedby_ion") + 1);
		steam_set_stat_int("shotby_ion", steam_get_stat_int("shotby_ion") + 1);
	} else if other.enemy_type ="bomber" {
		if hp = 0 steam_set_stat_int("killedby_bomber", steam_get_stat_int("killedby_bomber") + 1);
		steam_set_stat_int("shotby_bomber", steam_get_stat_int("shotby_bomber") + 1);
	} else if other.enemy_type ="sentinel" {
		if hp = 0 steam_set_stat_int("killedby_sentinel", steam_get_stat_int("killedby_sentinel") + 1);
		steam_set_stat_int("shotby_sentinel", steam_get_stat_int("shotby_sentinel") + 1);
	} else if other.enemy_type ="rusher" {
		if hp = 0 steam_set_stat_int("killedby_rusher", steam_get_stat_int("killedby_rusher") + 1);
		steam_set_stat_int("shotby_rusher", steam_get_stat_int("shotby_rusher") + 1);
	} else if other.enemy_type ="sniper" {
		if hp = 0 steam_set_stat_int("killedby_ranger", steam_get_stat_int("killedby_ranger") + 1);
		steam_set_stat_int("shotby_ranger", steam_get_stat_int("shotby_ranger") + 1);
	} else if other.enemy_type ="gunship" {
		if hp = 0 steam_set_stat_int("killedby_gunship", steam_get_stat_int("killedby_gunship") + 1);
		steam_set_stat_int("shotby_gunship", steam_get_stat_int("shotby_gunship") + 1);
	} else if other.enemy_type ="shotgunner" {
		if hp = 0 steam_set_stat_int("killedby_shotgunner", steam_get_stat_int("killedby_shotgunner") + 1);
		steam_set_stat_int("shotby_shotgunner", steam_get_stat_int("shotby_shotgunner") + 1);
	} else if other.enemy_type ="destroyer" {
		if hp = 0 steam_set_stat_int("killedby_destroyer", steam_get_stat_int("killedby_destroyer") + 1);
		steam_set_stat_int("shotby_destroyer", steam_get_stat_int("shotby_destroyer") + 1);
	} else if other.enemy_type ="swarmer" {
		if hp = 0 steam_set_stat_int("killedby_swarmer", steam_get_stat_int("killedby_swarmer") + 1);
		steam_set_stat_int("shotby_swarmer", steam_get_stat_int("shotby_swarmer") + 1);
	} else if other.enemy_type ="heavy_cruiser" {
		if hp = 0 steam_set_stat_int("killedby_heavy_cruiser", steam_get_stat_int("killedby_heavy_cruiser") + 1);
		steam_set_stat_int("shotby_heavy_cruiser", steam_get_stat_int("shotby_heavy_cruiser") + 1);
	} else if other.enemy_type ="battlecruiser" {
		if hp = 0 steam_set_stat_int("killedby_battlecruiser", steam_get_stat_int("killedby_battlecruiser") + 1);
		steam_set_stat_int("shotby_battlecruiser", steam_get_stat_int("shotby_battlecruiser") + 1);
	} else if other.enemy_type ="turret_large" {
		if hp = 0 steam_set_stat_int("killedby_turret_large", steam_get_stat_int("killedby_turret_large") + 1);
		steam_set_stat_int("shotby_turret_large", steam_get_stat_int("shotby_turret_large") + 1);
	} else if other.enemy_type ="turret_laser" {
		if hp = 0 steam_set_stat_int("killedby_turret_laser", steam_get_stat_int("killedby_turret_laser") + 1);
		steam_set_stat_int("shotby_turret_laser", steam_get_stat_int("shotby_turret_laser") + 1);
	} else if other.enemy_type ="turret_missile" {
		if hp = 0 steam_set_stat_int("killedby_turret_missile", steam_get_stat_int("killedby_turret_missile") + 1);
		steam_set_stat_int("shotby_turret_missile", steam_get_stat_int("shotby_turret_missile") + 1);
	} else if other.enemy_type ="turret_ion" {
		if hp = 0 steam_set_stat_int("killedby_turret_ion", steam_get_stat_int("killedby_turret_ion") + 1);
		steam_set_stat_int("shotby_turret_ion", steam_get_stat_int("shotby_turret_ion") + 1);
	} else if other.enemy_type ="turret_station" {
		if hp = 0 steam_set_stat_int("killedby_turret_station", steam_get_stat_int("killedby_turret_station") + 1);
		steam_set_stat_int("shotby_turret_station", steam_get_stat_int("shotby_turret_station") + 1);
	} else if other.enemy_type ="turret_station_double" {
		if hp = 0 steam_set_stat_int("killedby_turret_station_double", steam_get_stat_int("killedby_turret_station_double") + 1);
		steam_set_stat_int("shotby_turret_station_double", steam_get_stat_int("shotby_turret_station_double") + 1);
	} else {
		if hp = 0 steam_set_stat_int("killedby_enemy_other", steam_get_stat_int("killedby_enemy_other") + 1);
		steam_set_stat_int("shotby_enemy_other", steam_get_stat_int("shotby_enemy_other") + 1);
	}
}