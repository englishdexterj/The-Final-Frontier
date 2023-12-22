if distance_to_object(o_player) > room_width/2 && room_width - x < view_wport[0] {
	x -= room_width - view_wport[0];
} else if distance_to_object(o_player) > room_width/2 && x < view_wport[0] {
	x += room_width - view_wport[0];
}

if ready {
if instance_exists(pt) {
	if image_alpha < 1 {
		image_yscale += warmup_speed*global.scale;
		image_alpha += warmup_speed;
		laser_width = (round(image_alpha*(laser_width_max/global.scale)*2)/2)*global.scale;
		
		if image_alpha >= 1 {
			tick_damage = 3*(1/(laser_width/(global.scale*2)))*1/60; //3 damage a second if touching all beams
			image_alpha = 1;
		}
	}
		
	var x1 = pt.x;
	var y1 = pt.y;
		
	var x2 = pt.x + _x;
	var y2 = pt.y + _y;

	var tdist = point_distance(x1, y1, x2, y2);
	var tdir  = point_direction(x1, y1, x2, y2) + pt.image_angle;
		
	x = x1 + lengthdir_x(tdist, tdir);
	y = y1 + lengthdir_y(tdist, tdir);
		
	direction = dir*pt.direction;
	image_angle = direction;
} else instance_destroy();
}