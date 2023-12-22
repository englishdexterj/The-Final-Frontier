function sc_move_avoidance(ang_diff, target, dir) {
	var length = abs((180+(size-1)*5)*(180+(size-1)*5)*global.scale*global.scale) + abs((180+(size-1)*5)*(180+(size-1)*5)*global.scale*global.scale);
	if length != 0 length = sqrt(length);
	
	if !collision_line(x, y, target.x, target.y, o_asteroid, true, true) {
		if object_index = o_player_drone sc_drone_shoot(ang_diff);
		else sc_shoot(ang_diff);
	} else if collision_line(x, y, x + lengthdir_x(length/2, direction), y + lengthdir_y(length/2, direction), o_asteroid, true, true) {
		if object_index = o_player_drone sc_drone_shoot(0);
		else sc_shoot(0);
	}
	
	//dont continue if no collision between target
	var targ_ang = point_direction(x, y, target.x, target.y);
	if !collision_line(x + lengthdir_x(30*global.scale, targ_ang + 90), y + lengthdir_y(30*global.scale, targ_ang + 90), target.x + lengthdir_x(30*global.scale, targ_ang + 90), target.y + lengthdir_y(30*global.scale, targ_ang + 90), o_asteroid, true, true) 
	and !collision_line(x + lengthdir_x(30*global.scale, targ_ang - 90), y + lengthdir_y(30*global.scale, targ_ang - 90), target.x + lengthdir_x(30*global.scale, targ_ang - 90), target.y + lengthdir_y(30*global.scale, targ_ang - 90), o_asteroid, true, true)
	and !collision_line(x, y, target.x, target.y, o_asteroid, true, true) {
		return ang_diff;
	}
	
	#region cast rays looking for collisions
	var c = 0;
	for (var i = 0; i <= 350; i+= 10) {
		col[c] = false;
		col_dist[c] = 0;
		var _col = collision_line_first(x, y, x + lengthdir_x(length, i), y + lengthdir_y(length, i), o_asteroid, true, true);
		if _col {
			col[c] = true;
			col_dist[c] = 1 - distance_to_object(_col) / length;
		}
		c++;
	}
	#endregion
	
	#region safety rating of each direction
	var max_safety = 0;
	for (var i = 0; i <= 35; i++) {
		var num = i;
		var num2 = i;
		safety[i] = 0;
		
		for (var j = 0; j <= 9; j++) {
			if col[num] or col[num2] {
				safety[i] -= ((20-j))*col_dist[num];
				safety[i] -= ((20-j))*col_dist[num2];
			}
			
			safety[i]++;
			
			num++; if num > 35 num = 0;
			num2--; if num2 < 0 num2 = 35;
		}
		
		if safety[i] > max_safety max_safety = safety[i];
	}
	#endregion
	
	#region look in 180 degree around ang_diff
	var target_angle = point_direction(x, y, target.x - room_width + view_wport[0], target.y);
	var target_angle = point_direction(x, y, target.x, target.y);
	target_angle = round(target_angle / 10) * 10;
	if dir = -1 target_angle += 180;
	
	while target_angle > 180 and target_angle < -180 {
		if target_angle > 180 {
			target_angle -= 360;
		} else if target_angle < -180 {
			target_angle += 360;
		}
	}
	
	var best_safety = -10000;
	var best_safety_dir = 180;
	var safety_diff = 180;
	var diff_calc = 10000;
	
	var ang = 0;
	for (var i = (target_angle/10) - 36/2; i < (target_angle/10) + 36/2; i++) {
	//for (var i = 0; i < 36; i++) {
	
		if i < 0 ang = 36 + i;
		else if i > 35 ang = i - 36;
		else ang = i;
		ang = clamp(ang, 0, 35);
		
		//if (safety[ang] >= min(4, best_safety) and abs(angle_difference(target_angle, ang*10)) < abs(best_safety_dir)) 
		if (safety[ang] >= min(2, best_safety) and power(angle_difference(direction, ang*10), 2) + power(angle_difference(target_angle, ang*10), 2) < diff_calc) 
		or (safety[ang] > best_safety and power(angle_difference(direction, ang*10), 2) + power(angle_difference(target_angle, ang*10), 2) < diff_calc + sqr(safety[ang])) {
			best_safety = safety[ang];
			best_safety_dir = angle_difference(target_angle, ang*10);
			safety_diff = angle_difference(direction, ang*10);
			diff_calc = power(angle_difference(direction, ang*10), 2) + power(angle_difference(target_angle, ang*10), 2);
		} else if 1=2 and safety[ang] >= 3 and sqr(angle_difference(direction, ang*10)) + sqr(angle_difference(target_angle, ang*10)) - (safety[ang])*5 < diff_calc {
			best_safety = safety[ang];
			best_safety_dir = angle_difference(target_angle, ang*10);
			safety_diff = angle_difference(direction, ang*10);
			diff_calc = sqr(angle_difference(direction, ang*10)) + sqr(angle_difference(target_angle, ang*10)) - (safety[ang])*5;
		}
	}
	
	

	//move_direction = round((direction + angle_difference(direction, target_angle + best_safety_dir))/10)*10;
	move_direction = round((direction - safety_diff)/10)*10;
	if move_direction > 350 move_direction -= 360;
		
	//return -dir*angle_difference(direction, target_angle + best_safety_dir);
	return -dir*safety_diff;
	
	#endregion
}