if instance_exists(o_player) {
	//switch side of map
	if distance_to_object(o_player) > view_wport[0] && room_width - x < view_wport[0]*2 
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x - (room_width - view_wport[0]), y, o_player.x, o_player.y)) {
		x -= (room_width - view_wport[0]);
	} else if distance_to_object(o_player) > view_wport[0] && x < view_wport[0]*2
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x + (room_width - view_wport[0]), y, o_player.x, o_player.y)){
		x += (room_width - view_wport[0]);
	}
}

if type = "missile" {
	if instance_exists(target) {
	
	var ang_diff = sc_angdiff(1, target);
	if abs(ang_diff) > 90 {
		target = noone;
		ang_diff = 0;
	}
	
	forward = 1;
	
	} else {
		ang_diff = 0;
		forward = 1;
		
		if !enemy {
			target = instance_nearest(x, y, o_enemy);
			
			if distance_to_object(target) > distance_to_object(instance_nearest(x, y, o_station_parent)) {
				target = instance_nearest(x, y, o_station_parent);
			}
			
			if distance_to_object(target) > distance_to_object(instance_nearest(x, y, o_station_core)) {
				target = instance_nearest(x, y, o_station_core);
			}
		} else {
			if instance_exists(o_player) {
				if distance_to_object(instance_nearest(x, y, o_player)) <= distance_to_object(instance_nearest(x, y, o_player_drone)) {
					target = o_player;
				} else {
					target = instance_nearest(x, y, o_player_drone);
				}
			} else {
				target = instance_nearest(x, y, o_player_drone);
			}
		}
	}
	
	acceleration = clamp((acceleration + forward*global.spd*.02)*global.drag, 0, 1);

	//move player
	x_speed += lengthdir_x(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	y_speed += lengthdir_y(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	
	turn_acceleration = clamp(ang_diff/45, -.5, .5);
	turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;
	
	x_speed = clamp(x_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);
	y_speed = clamp(y_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);

	x += x_speed*global.scale;
	y += y_speed*global.scale;
}

if type = "laser" {
	if instance_exists(pt) {
		if image_alpha < 1 {
			image_yscale += .005*global.scale;
			image_alpha += .005;
			if image_alpha >= 1 bullet_color = c_red;
		}
		
		var x1 = pt.x;
		var y1 = pt.y;
		
		var x2 = pt.x + _x;
		var y2 = pt.y + _y;

		var tdist = point_distance(x1, y1, x2, y2);
		var tdir  = point_direction(x1, y1, x2, y2) + pt.image_angle;

		x = x1 + lengthdir_x(tdist, tdir);
		y = y1 + lengthdir_y(tdist, tdir);

		direction = pt.direction;
		image_angle = direction;

		x_speed = pt.x_speed;
		y_speed = pt.y_speed;
	} else instance_destroy();
}