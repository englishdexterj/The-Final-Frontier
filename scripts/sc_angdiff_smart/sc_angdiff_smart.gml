function sc_angdiff_smart(dir, target, multiplier = 1) {
	var dist = distance_to_object(target);
	var t_xspd = target.x_speed*global.scale;
	var t_yspd = target.y_speed*global.scale;
	var tx = target.x;
	var ty = target.y;
	
	var xspd = sign(x_speed)*x_speed;
	var yspd = sign(y_speed)*y_speed;
	
	var _spd = xspd*global.scale*xspd*global.scale + yspd*global.scale*yspd*global.scale
	if _spd != 0 var ticks = dist/sqrt(_spd);
	else var ticks = 0;
	
	tx += t_xspd*ticks*multiplier;
	ty += t_yspd*ticks*multiplier;
	
	if x < room_width / 2 && distance_to_point(tx, ty) > distance_to_point(tx - room_width + view_wport[0], ty) {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, tx - room_width + view_wport[0], ty));
	} else if x > room_width / 2 && distance_to_point(tx, ty) > distance_to_point(tx + room_width - view_wport[0], ty) {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, tx + room_width - view_wport[0], ty));
	} else {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, tx, ty));
	}
	
	return ang_diff;
}