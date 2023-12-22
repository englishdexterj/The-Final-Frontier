function sc_rush(target, ang_diff) {
	forward = (rushing/120)*2*8;
	
	acceleration = clamp((acceleration + forward*global.spd*.1)*(global.drag-.08), 0, 1);

	//move to target
	x_speed += lengthdir_x(acceleration, direction);
	y_speed += lengthdir_y(acceleration, direction);
	
	turn_acceleration = clamp(turn_acceleration_mult*(ang_diff/5)/60, -.1, .1);
	turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;
	
	rushing++;
}