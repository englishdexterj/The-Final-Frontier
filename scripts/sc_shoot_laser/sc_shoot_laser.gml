function sc_shoot_laser(ang_diff) {
	//shoot
	enemy = true;
	
	if !enemy {
		//target = instance_nearest(x, y, o_enemy);
	} else {
		//target = o_player;
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
				with instance_create_layer(x, y, "Shots", o_laser_updated) {
					destroy_timer = 300;
					
					enemy_type = other.enemy_type;
					enemy = other.enemy;
					
					laser_length = 2*960*global.scale;
					laser_width = 0;
					laser_width_max = 8*global.scale;

					image_xscale = global.scale;
					image_yscale = global.scale;
					image_alpha = 0;
					direction = other.direction;
					image_angle = other.image_angle;

					tick_damage = 0;

					pt = other.id;
					depth = pt.depth + 1;

					_x = 0;
					_y = 0;
				}
			}
		}
	}
	//
}