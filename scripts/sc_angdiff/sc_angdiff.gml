function sc_angdiff(dir, target) {
	if x < room_width / 2 && distance_to_point(target.x, target.y) > distance_to_point(target.x - room_width + view_wport[0], target.y) {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, target.x - room_width + view_wport[0], target.y));
	} else if x > room_width / 2 && distance_to_point(target.x, target.y) > distance_to_point(target.x + room_width - view_wport[0], target.y) {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, target.x + room_width - view_wport[0], target.y));
	} else {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, target.x, target.y));
	}
	
	return ang_diff;
}