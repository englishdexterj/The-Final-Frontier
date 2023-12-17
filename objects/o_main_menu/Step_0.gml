#region menu enemies

if menu_enemies < menu_enemies_max {
	
	var _index = irandom(array_length(global.enemy)-1);
	if (global.stats[_index, 1] > 0 or _index = 0) and random(1) < 1/global.info[_index, 0] {
		if global.stats[_index, 3] > 0 var _lvl = irandom(2);
		else if global.stats[_index, 2] > 0 var _lvl = irandom(1);
		else var _lvl = 0;
		
		var _x = irandom(1920);
		var _y = irandom(1080);
		if !instance_place(_x, _y, o_asteroid) {
			var _e = instance_create_layer(_x, _y, "Instances_Top", global.info[_index][4]);
			_e.direction = irandom_range(0, 359);
			_e.image_angle = _e.direction;
			_e.upgrades = _lvl;
			menu_enemies++;
		}
	}
}

if menu_friendlies < menu_friendlies_max {
	var _x = irandom(1920);
	var _y = irandom(1080);
	if !instance_place(_x, _y, o_asteroid) {
		var _f = instance_create_layer(_x, _y, "Instances_Top", o_player_drone);
		_f.direction = irandom_range(0, 359);
		_f.image_angle = _f.direction;
		_f.ai = 0;
		_f.hardware = irandom(2);
		menu_friendlies++;
	}
}

if menu_asteroids < menu_asteroids_max {
	var _a = instance_create_layer(irandom_range(room_width/4, (room_width/4) * 3), choose(0, room_height), "Instances_Upper_Middle", o_asteroid);
	with _a {
		x_speed = random_range(-2, 2);
	
		if y = 0 {
			y -= irandom_range(100, 350);
			y_speed = random_range(0.5, 1);
		} else if y = room_height {
			y += irandom_range(100, 350);
			y_speed = random_range(-0.5, -1);
		}
		var _spd = (sqr(x_speed) + sqr(y_speed)) / 10;
		depth -= _spd;
	}
}

#endregion

if steam_initialised() {
	if steam_stats_ready() && steam_is_overlay_enabled() {
		global.steam_api = true;
	} else {
		global.steam_api = false;
	}
} else {
	global.steam_api = false;
}

sc_step_menu_control();
sc_step_menu_topscores();
sc_step_menu_stats();