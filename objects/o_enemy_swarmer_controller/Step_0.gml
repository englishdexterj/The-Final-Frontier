if alarm_get(0) = -1 {
	var alive = 0;

	for (var i = 0; i < array_length(_enemy); i++) {
		if instance_exists(_enemy[i]) alive++;
	}

	if alive = 0 {
		instance_destroy();
	} else if final = false and alive = 1 {
		for (var i = 0; i < array_length(_enemy); i++) {
			if instance_exists(_enemy[i]) {
				_enemy[i].follow_position = 1;
				x = _enemy[i].x;
				y = _enemy[i].y;
			}
		}
		final = true;
	}
}

if y > room_height {
	y_speed *= -.5;
	y = room_height - 10;
	direction *= -1;
	image_angle = direction;
} else if y < 0 {
	y_speed *= -.5;
	direction *= -1;
	image_angle = direction;
	y = 10;
}
if !instance_exists(o_player) {
	if x > room_width and (direction < 90 or direction > 270) {
		x_speed *= -.5;
		if direction < 90 direction = 90 + direction;
		else if direction > 270 direction = 180 + (360-direction);
		image_angle = direction;
	} else if x < 0 and ((direction <= 180 and direction > 90) or (direction > 180 and direction < 270)) {
		x_speed *= -.5;
		if direction <= 180 and direction > 90 direction = (180 - direction);
		else if direction > 180 direction = 270 + (direction - 180);
		image_angle = direction;
	}
}

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




if instance_exists(o_player_drone) {
	if distance_to_object(instance_nearest(x, y, o_player_drone)) < distance_to_object(o_player) {
		target = instance_nearest(x, y, o_player_drone);
	} else if instance_exists(o_player) {
		target = o_player;
	}
} else if instance_exists(o_player) {
	target = o_player;
} else target = noone;

if target != noone {
	if distance_to_object(target) >= 0*global.scale {
		forward = 1;

		var ang_diff = sc_angdiff(1, target);
	
		acceleration = clamp((acceleration + forward*global.spd*.1)*(global.drag-.08), 0, 1);

		x_speed += lengthdir_x(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
		y_speed += lengthdir_y(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	
		turn_acceleration = clamp(ang_diff/45, -.5, .5);
		turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
		direction += turn_speed;
		image_angle = direction;
	} else if distance_to_object(target) < 0*global.scale {
		//check for movement
		forward = 1;
	
		var ang_diff = sc_angdiff(-1, target);

		acceleration = clamp((acceleration + forward*global.spd*.1)*(global.drag-.08), 0, 1);

		//move away from player
		x_speed += lengthdir_x(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
		y_speed += lengthdir_y(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	
		turn_acceleration = clamp(ang_diff/45, -.5, .5);
		turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
		direction += turn_speed;
		image_angle = direction;
	}
}

x_speed = clamp(x_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);
y_speed = clamp(y_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);

x += x_speed*global.scale;
y += y_speed*global.scale;
