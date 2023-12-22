if hp <= 0 {
	hp = 0;
	instance_destroy();
}

if instance_exists(pt) {
	var x1 = pt.x;
	var y1 = pt.y;
	var x2 = pt.x + sprite_width + _x;
	var y2 = pt.y + _y;

	var tdist = point_distance(x1, y1, x2, y2);
	var tdir  = point_direction(x1, y1, x2, y2) + pt.image_angle;

	x = x1 + lengthdir_x(tdist, tdir);
	y = y1 + lengthdir_y(tdist, tdir);
	
	direction = pt.direction;
	image_angle = direction;
} else instance_destroy();