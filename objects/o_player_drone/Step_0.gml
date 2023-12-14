if hp <= 0 {
	hp = 0;
	instance_destroy();
}

if flash_alpha > 0 {
	flash_alpha -= .05;
}

//switch side of map
if !instance_exists(o_player) {
	if x > room_width + 256 and (direction < 90 or direction > 270) {
		x_speed *= -.5;
		if direction < 90 direction = 90 + direction;
		else if direction > 270 direction = 180 + (360-direction);
		image_angle = direction;
	} else if x < -256 and ((direction <= 180 and direction > 90) or (direction > 180 and direction < 270)) {
		x_speed *= -.5;
		if direction <= 180 and direction > 90 direction = (180 - direction);
		else if direction > 180 direction = 270 + (direction - 180);
		image_angle = direction;
	}
	if y > room_height + 256 {
		y_speed *= -.5;
		y = room_height + 246;
		direction *= -1;
		image_angle = direction;
	} else if y < -256 {
		y_speed *= -.5;
		direction *= -1;
		image_angle = direction;
		y = -246;
	}
} else {
	if y > room_height {
		y_speed *= -.5;
		y = room_height - 10;
		direction *= -1;
		image_angle = direction;
	} else if y < 0 {
		y_speed *= -.5;
		direction *= -1;
		image_angle = direction;
		y = 10;
	}
	
	//switch side of map
	if distance_to_object(o_player) > view_wport[0] && room_width - x < view_wport[0]*2 
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x - (room_width - view_wport[0]), y, o_player.x, o_player.y)) {
		x -= (room_width - view_wport[0]);
	} else if distance_to_object(o_player) > view_wport[0] && x < view_wport[0]*2
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x + (room_width - view_wport[0]), y, o_player.x, o_player.y)){
		x += (room_width - view_wport[0]);
	}
}

if !disabled {
	if ai = 0 {
		if instance_exists(o_enemy) {
			target = instance_nearest(x, y, o_enemy);
		} else {
			target = noone;
		}
	
		if follow = true {
			if instance_exists(following) {
				sc_drone_follow();
			} else follow = false;
		} else if target != noone and distance_to_object(target) >= 90*global.scale {
			sc_drone_push(target);
		} else if target != noone and distance_to_object(target) < 90*global.scale {
			sc_drone_back(target);
		}
	} else if ai = 1 {
	
	} else if ai = 2 {
	
	} else {
		show_debug_message("ERR: AI not programmed - o_player_drone");
	}
}

x_speed = clamp(x_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);
y_speed = clamp(y_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);

x += x_speed*global.scale;
y += y_speed*global.scale;
