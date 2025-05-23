function sc_destroyer(target) {
	//check for movement
	forward = 1;
	
	var ang_diff = sc_get_angdiff(target);
	
	if move_avoidance ang_diff = sc_move_avoidance(ang_diff, target, 1);
	else {
		sc_shoot(ang_diff);
	}
	
	if can_spawn && current_spawns < max_spawns && spawn_cooldown = false && spawn_heat = 0 {
		spawn_cooldown = true;
		spawn_heat += 10;
		
		var _s = instance_create_layer(x, y, "Instances_Top", choose(o_enemy_basic, o_enemy_suicider));
		_s.direction = irandom_range(0, 359);
		_s.image_angle = _s.direction;
		
		current_spawns += 1;
		
		alarm_set(2, 5)
	}
	
	acceleration = clamp((acceleration + forward*global.spd*.1)*(global.drag-.08), 0, 1);

	//move player
	x_speed += lengthdir_x(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	y_speed += lengthdir_y(acceleration + abs(clamp(ang_diff/5,-.2, .2)), direction);
	
	turn_acceleration = clamp(turn_acceleration_mult*(ang_diff/5)/60, -turn_acc, turn_acc);
	turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;
}