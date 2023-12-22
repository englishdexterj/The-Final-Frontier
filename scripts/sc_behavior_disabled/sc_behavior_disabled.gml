function sc_behavior_disabled() {
	acceleration = clamp((acceleration)*(global.drag-.08), 0, 1);

	//move player
	x_speed += lengthdir_x(acceleration, direction);
	y_speed += lengthdir_y(acceleration, direction);
	
	turn_speed = clamp((turn_speed) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;
}