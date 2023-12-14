function sc_snipe(target) {
	//check for movement
	if distance_to_object(target) >= 520*global.scale*target.size {
		forward = ((distance_to_object(target)-520*global.scale)/(60*global.scale))/4;
	} else if distance_to_object(target) <= 260*global.scale*target.size {
		forward = -((260*global.scale-distance_to_object(target))/(30*global.scale))*2;
	} else {
		forward = 0;
	}

	if smart var ang_diff = sc_angdiff_smart(1, target, 0.4);
	else var ang_diff = sc_angdiff(1, target);
	
	if move_smart ang_diff = sc_move_smart(ang_diff, target, 1);
	else {
		sc_shoot(ang_diff);
	}
	
	acceleration = clamp((acceleration + forward*global.spd*.1)*(global.drag-.08), 0, 1);

	//move player
	x_speed += lengthdir_x(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	y_speed += lengthdir_y(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	
	turn_acceleration = clamp(ang_diff/45, -turn_acc, turn_acc);
	turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;
}