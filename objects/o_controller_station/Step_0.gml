if station_level = global.spawn_level and !instance_exists(o_station_base) {
	global.stations++;
	
	var _dir = choose(-1, 1);
	if _dir = -1 var _y = room_height+210*global.scale;
	else var _y = -210*global.scale;
	
	with instance_create_layer(room_width/2, _y, "Instances_Middle", o_station_base) {
		//delete all asteroids on spawn location
		var _list = ds_list_create();
		collision_circle_list(x, y, 420*global.scale, o_asteroid, false, true, _list, false);
		for (var i = 0; i < ds_list_size(_list); i++) {
			instance_destroy(ds_list_find_value(_list, i));
		}
		ds_list_destroy(_list);
		//
		
		y_speed = _dir*global.scale;
		x_speed = random_range(-global.scale/4, global.scale/4);
		
		background_enemies = 0;
		background_enemies_max = 100;
		
		if global.background_objects >= 1 {
			repeat (100) {
				var _dir = irandom_range(0, 359);
				var _dist = irandom_range(420, 840)*global.scale;
				background_enemies++;
				with instance_create_layer(x + lengthdir_x(_dist, _dir), y + lengthdir_y(_dist, _dir), "Instances_Background", o_background) {
					sprite_index = choose(s_enemy_basic, s_enemy_suicider, s_enemy_bomber);
					image_index = 0;
					image_alpha = 0;
					mult = choose(.25, .5, .75);
					image_xscale = global.scale*mult;
					image_yscale = global.scale*mult;
					life_warmup_current = 0;
					life_warmup_time = 300;
					life_warmup_start = irandom_range(180, 240);
					life = irandom_range(600, 1200);
					x_speed = other.x_speed * global.scale * 1/60 * random_range(.8, 1.2) * mult;
					y_speed = other.y_speed * global.scale * 1/60 * random_range(.8, 1.2) * mult;
					image_angle = point_direction(x, y, x + x_speed, y + y_speed);
					draw_color = c_dkgray;
					parent = other.id;
					parent_max_distance = 1500*global.scale;
					parent_notify = true;
				}
			}
		}
	}
	
	audio_play_sound(sfx_alarm_loop3, 10, false);
	
	if station_level < 40 {
		station_level = irandom_range(51, 55);
		alarm_set(1, 240);
	} else if station_level < 60 {
		station_level = irandom_range(81, 85);
		alarm_set(1, 240);
	} else {
		station_level = (station_level div 10) * 10 + irandom_range(31, 35);
		alarm_set(1, 240);
	}
}

if global.station_destroyed = true and alarm_get(0) = -1 alarm_set(0, 60);