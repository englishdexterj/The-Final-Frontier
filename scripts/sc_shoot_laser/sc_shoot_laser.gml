function sc_shoot_laser(ang_diff) {
	//shoot
	enemy = true;
	
	if !enemy {
		target = instance_nearest(x, y, o_enemy);
	} else {
		target = o_player;
	}
	
	
	if can_shoot && cooldown = false && heat = 0 && ang_diff < 4 && ang_diff > -4 {
		if distance_to_object(target) < 540*global.scale {
			if movable {
				x_speed += lengthdir_x(-.2*global.spd, direction);
				y_speed += lengthdir_y(-.2*global.spd, direction);
			}
	
			cooldown = true;
			heat += 15;
			alarm_set(0, 5);
			
			for (var i = 0; i < 1; i++) {
				with instance_create_layer(x, y, "Instances", o_laser) {
					enemy_type = other.enemy_type;
					flank = false;
					plated = false;
					pt = other.id;
					image_alpha = 0;
					depth = pt.depth + 1;
					_x = 0;
					_y = 0;
					enemy = other.enemy;
					bullet_color = c_white;
					direction = other.direction;
					image_angle = other.image_angle;
					image_xscale = 10*global.scale;
					image_yscale = 0;
				}
			}
		}
	}
	//
}