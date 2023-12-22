function sc_swarm() {
	var ang_diff = sc_angdiff_swarmer(1, target);
	
	if move_avoidance sc_move_avoidance(ang_diff, target, 1);
	else {
		sc_shoot(ang_diff);
	}
	
	if follow_position = 1 {
		x = lerp(x, following.x, 1);
		y = lerp(y, following.y, 1);
	} else {
		var _pos = follow_position;
		var i = 6;
		var _ring = 0;
		while _pos > 0 {
			_pos -= i;
			i *= 2;
			_ring++;
		}
		var _ang = (follow_position-1)*(72/_ring);
		
		x = lerp(x, following.x + lengthdir_x(sprite_get_width(sprite_index)*global.scale*2*_ring, _ang mod 360), 1);
		y = lerp(y, following.y + lengthdir_y(sprite_get_width(sprite_index)*global.scale*2*_ring, _ang mod 360), 1);
	}
	
	acceleration = following.acceleration;
	
	x_speed = following.x_speed;
	y_speed = following.y_speed;
	
	turn_acceleration = following.turn_acceleration;
	turn_speed = following.turn_speed;
	
	direction = following.direction;
	image_angle = direction;
	
	/*
	acceleration = clamp((acceleration + forward*global.spd*.1)*(global.drag-.08), -1, 1);

	//move player
	x_speed += lengthdir_x(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	y_speed += lengthdir_y(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	
	turn_acceleration = clamp(turn_acceleration_mult*(ang_diff/5)/60, -.5, .5);
	turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;
	*/
}