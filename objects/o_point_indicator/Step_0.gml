if ready {
	if scale < scale_max {
		scale += scale_max/20;
	} else {
		alpha -= 1/alpha_reduction;
	}
	
	image_angle += image_angle_change/2;

	//switch side of map
	if distance_to_object(o_player) > view_wport[0] && room_width - x < view_wport[0]*2 
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x - (room_width - view_wport[0]), y, o_player.x, o_player.y)) {
		x -= (room_width - view_wport[0]);
	} else if distance_to_object(o_player) > view_wport[0] && x < view_wport[0]*2
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x + (room_width - view_wport[0]), y, o_player.x, o_player.y)){
		x += (room_width - view_wport[0]);
	}
	
	time += 0.015;
	
	x += change_x*global.scale*1/60;
	y += change_y*global.scale*1/60;
	
	if spawn_timer > 0 {
		spawn_timer--;
		
		if spawn_timer = 0 and spawn_count > 0 {
			with instance_create_layer(x, y+1.1*sprite_get_height(sprite_index)*scale_max, "Above_All", o_point_indicator) {
				points = other.points;
				spawn_count = other.spawn_count-1;
				spawn_timer = 60;
				change_y = other.change_y;
			}
			
			spawn_count = 0;
		}
	}
	
	if alpha <= 0 instance_destroy();
}