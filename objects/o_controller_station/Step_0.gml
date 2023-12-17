if station_level = global.spawn_level {
	var _dir = choose(-1, 1);
	if _dir = -1 var _y = room_height+210*global.scale;
	else var _y = -210*global.scale;
	
	with instance_create_layer(room_width/2, _y, "Instances_Middle", o_station_base) {
		y_speed = _dir*16;
		x_speed = random_range(-4, 4);
	}
	
	if station_level < 40 {
		station_level = irandom_range(51, 55);
	} else if station_level < 60 {
		station_level = irandom_range(71, 75);
	}
}

if global.station_destroyed = true and alarm_get(0) = -1 alarm_set(0, 60);