function sc_drone_shoot_flak(ang_diff) {
	//shoot
	if distance_to_object(o_bullet) < 100 && flak_cooldown = false && flak_heat <= 5 {
		var _cl = 100000;
		var _e = noone;
		with (o_bullet) {
			if enemy && type = "bullet" {
				if distance_to_object(other.id) < _cl {
					_cl = distance_to_object(other.id)
					var _e = id;
				}
			}
		}
		if instance_exists(_e) && _cl < 100 {
			flak_cooldown = true;
			flak_heat += .5;
			alarm_set(4, flak_speed);
			with instance_create_layer(x, y, "Shots", o_flak) {
				enemy_type = other.enemy_type;
				enemy = false;
				bullet_color = make_color_rgb(150, 80, 80);
				image_xscale = .75*global.scale;
				image_yscale = .75*global.scale;
			
				direction = point_direction(x, y, _e.x, _e.y) + random_range(-10, 10);
				image_angle = direction;
				speed = (10*global.spd + sqrt(power(other.x_speed,2) + power(other.y_speed,2)))*global.scale;
			}
		}
	}
	//
}
