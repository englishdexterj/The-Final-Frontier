function sc_push(target) {
	//check for movement
	forward = 1;
	
	if smart var ang_diff = sc_angdiff_smart(1, target);
	else var ang_diff = sc_angdiff(1, target);
	
	if move_smart ang_diff = sc_move_smart(ang_diff, target, 1);
	else {
		sc_shoot(ang_diff);
	}
	
	acceleration = clamp((acceleration + forward*global.spd*.1)*(global.drag-.08), 0, 1);

	//move to target
	x_speed += lengthdir_x(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	y_speed += lengthdir_y(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	
	turn_acceleration = clamp(ang_diff/45, -turn_acc, turn_acc);
	turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;
}