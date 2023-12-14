function sc_shoot_sniper(ang_diff) {
	//shoot
	if can_shoot && cooldown = false && heat <= 0 && ang_diff < 4 && ang_diff > -4 {
		if movable {
			x_speed += lengthdir_x(-.2*global.spd, direction);
			y_speed += lengthdir_y(-.2*global.spd, direction);
		}
	
		cooldown = true;
		heat += 5 + (dual_bullet-1)*2.5;
		alarm_set(0, 5);
		for (var i = 0; i < dual_bullet; i++) {
			with instance_create_layer(x, y, "Instances", o_sniper_bullet) {
				enemy_type = other.enemy_type;
				depth = other.depth + 1;
				plated = true;
				enemy = other.enemy;
				if enemy bullet_color = c_red;
				else bullet_color = c_white;
				direction = other.direction;
				image_angle = other.image_angle;
				speed = ((10*global.spd + sqrt(power(other.x_speed,2) + power(other.y_speed,2)))*global.scale)*3;
				if other.dual_bullet = 2 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i*2-1)*4*global.scale;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				} else if other.dual_bullet = 3 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i-1)*4*global.scale;
					
					image_angle = direction;
					
					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				} else if other.dual_bullet = 4 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i*2-3)*2*global.scale;

					image_angle = direction;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				}
			}
		}
	}
	//
}