function sc_angdiff_swarmer(dir, target) {
	var _lx = lengthdir_x(sprite_get_width(sprite_index)*global.scale*2, (follow_position-1)*72);
	var _ly = lengthdir_y(sprite_get_width(sprite_index)*global.scale*2, (follow_position-1)*72);
	
	if x < room_width / 2 && distance_to_point(target.x + _lx, target.y + _ly) > distance_to_point(target.x + _lx - room_width + view_wport[0], target.y + _ly) {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, target.x + _lx - room_width + view_wport[0], target.y + _ly));
	} else if x > room_width / 2 && distance_to_point(target.x + _lx, target.y + _ly) > distance_to_point(target.x + _lx + room_width - view_wport[0], target.y + _ly) {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, target.x + _lx + room_width - view_wport[0], target.y + _ly));
	} else {
		var ang_diff = -dir*angle_difference(direction, point_direction(x, y, target.x + _lx, target.y + _ly));
	}
	
	return ang_diff;
}