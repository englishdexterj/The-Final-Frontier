function sc_angdiff_smart_shot(dir, target, multiplier = 1) {
	
	var dist = distance_to_object(target);
	var t_xspd = target.x_speed*global.scale;
	var t_yspd = target.y_speed*global.scale;
	var tx = target.x;
	var ty = target.y;
	
	var shot_spd = (20*global.spd + sqrt(sqr(x_speed + sqr(y_speed))))*global.scale;
	
	//var xspd = x_speed*global.scale;
	//var yspd = y_speed*global.scale;
	
	//var _spd = sqrt(sqr(xspd) + sqr(yspd));
	
	if shot_spd != 0 var ticks = dist/shot_spd;
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