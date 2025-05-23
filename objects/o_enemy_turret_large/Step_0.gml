if hp <= 0 {
	instance_destroy();
} else if !instance_exists(pt) and !testing {
	if on_station and global.station_destroyed = false points = 0;
	instance_destroy();
}

if flash_alpha > 0 {
	flash_alpha -= .05;
}

if instance_exists(pt) or testing {
	if instance_exists(o_player_drone) {
		if distance_to_object(instance_nearest(x, y, o_player_drone)) < distance_to_object(o_player) {
			target = instance_nearest(x, y, o_player_drone);
		} else if instance_exists(o_player) {
			target = o_player;
		}
	} else if instance_exists(o_player) {
		target = o_player;
	} else target = noone;
	
	if instance_exists(o_asteroid) {
		if target = noone {
			target = instance_nearest(x, y, o_asteroid)
		} else if weapon_type != "laser" and weapon_type != "ion" and distance_to_object(instance_nearest(x, y, o_asteroid)) < distance_to_object(target) {
			target = instance_nearest(x, y, o_asteroid);
		}
	}
	
	if target != noone and distance_to_object(target) > max_range*global.scale target = noone;
	
	if testing {
		
	} else if !on_station {
		var x1 = pt.x;
		var y1 = pt.y;
		var x2 = pt.x + sprite_width + _x;
		var y2 = pt.y + _y;

		var tdist = point_distance(x1, y1, x2, y2);
		var tdir  = point_direction(x1, y1, x2, y2) + pt.image_angle;

		x = x1 + lengthdir_x(tdist, tdir);
		y = y1 + lengthdir_y(tdist, tdir);
	} else if on_station { //is on station
		if instance_exists(pt) {
			x = pt.x + x_start*global.scale;
			y = pt.y + y_start*global.scale;
		}
	}
	
	if instance_exists(target) {
		var ang_diff = sc_get_angdiff(target);
	} else var ang_diff = 180;

	turn_acceleration = clamp(turn_acceleration_mult*(ang_diff/5)/60, -.25*max_turn_acceleration, .25*max_turn_acceleration);
	turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;
	
	if !on_station and !testing {
		x_speed = pt.x_speed;
		y_speed = pt.y_speed;
	}

	sc_shoot(ang_diff);
	
	if !instance_place(x, y, pt) and !testing instance_destroy();
}