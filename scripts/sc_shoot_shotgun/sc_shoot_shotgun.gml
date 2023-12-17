function sc_shoot_shotgun(ang_diff) {
	//shoot
	if can_shoot && cooldown = false && heat <= 6-(1 + (dual_bullet-1)*1/2) && ang_diff < 4 && ang_diff > -4 {
		if movable {
			x_speed += lengthdir_x(-.2*global.spd, direction);
			y_speed += lengthdir_y(-.2*global.spd, direction);
		}
	
		cooldown = true;
		heat += 1 + (dual_bullet-1)*1/2;
		alarm_set(0, 5);
		for (var i = 0; i < dual_bullet; i++) {
			repeat (5) {
				with instance_create_layer(x, y, "Shots", o_bullet) {
					enemy_type = other.enemy_type;
					depth = other.depth + 1;
					plated = false;
					enemy = other.enemy;
					if enemy bullet_color = c_red;
					else bullet_color = c_white;
					direction = other.direction + irandom_range(-8, 8);
					image_angle = other.image_angle;
					speed = (irandom_range(5, 10)*global.spd + sqrt(power(other.x_speed,2) + power(other.y_speed,2)))*global.scale;
					if other.dual_bullet = 2 {
						var x1 = other.x;
						var y1 = other.y;
						var x2 = other.x + sprite_width;
						var y2 = other.y + (i*2-1)*17*global.scale;

						var tdist = point_distance(x1, y1, x2, y2);
						var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

						x = x1 + lengthdir_x(tdist, tdir);
						y = y1 + lengthdir_y(tdist, tdir);
					} else if other.dual_bullet = 3 {
						var x1 = other.x;
						var y1 = other.y;
						var x2 = other.x + sprite_width;
						var y2 = other.y + (i-1)*4*global.scale;
					
						direction -= (i-1)*4;
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

						direction -= (i*2-3)*2;
						image_angle = direction;

						var tdist = point_distance(x1, y1, x2, y2);
						var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

						x = x1 + lengthdir_x(tdist, tdir);
						y = y1 + lengthdir_y(tdist, tdir);
					}
				}
			}
		}
	}
	//
}