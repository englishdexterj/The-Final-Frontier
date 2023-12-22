function sc_station_enemy_choose_upgrades() {
	if instance_exists(o_controller) {
		var _level_boost = o_controller.enemy_level_boost+1;
		var _shield_boost = o_controller.enemy_spawn_boost+1;
	} else {
		var _level_boost = 0;
		var _shield_boost = 0;
	}
	
	if min(0.75, 0.015*(global.stations*20)*_level_boost) > random(1) {
		upgrades += 1;
		if min(0.5, 0.005*(global.stations*20)*_level_boost) > random(1) {
			upgrades += 1;
			if random(1) < min(.9, ((global.stations*20)*_shield_boost)/50) has_shield = true;
		} else {
			if random(1) < min(.9, ((global.stations*20)*_shield_boost)/100) has_shield = true;
		}
	} else {
		if random(1) < min(.9, ((global.stations*20)*_shield_boost)/250) has_shield = true;
	}
	
	show_debug_message("upgrades:" + string(upgrades) + " shield:" + string(has_shield))
}