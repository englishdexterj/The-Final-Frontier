if hp <= 0 {
	hp = 0;
	instance_destroy();
}

if flash_alpha > 0 {
	flash_alpha -= .05;
}

if laser_heat > 0 {
	laser_heat -= (.5)*1/5*1/60;
}

if instance_exists(o_player) {
	//switch side of map
	if distance_to_object(o_player) > view_wport[0] && room_width - x < view_wport[0]*2 
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x - (room_width - view_wport[0]), y, o_player.x, o_player.y)) {
		x -= (room_width - view_wport[0]);
	} else if distance_to_object(o_player) > view_wport[0] && x < view_wport[0]*2
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x + (room_width - view_wport[0]), y, o_player.x, o_player.y)){
		x += (room_width - view_wport[0]);
	}
}

if y < -350 or y > room_height + 350 {
	_clean_destroy = true;
	instance_destroy();
}

if !instance_exists(o_player) and (x < -350 or x > room_width + 350) {
	_clean_destroy = true;
	instance_destroy();
}

x += x_speed;
y += y_speed;
