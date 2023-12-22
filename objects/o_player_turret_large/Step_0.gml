if hp <= 0 || !instance_exists(pt) {
	part_particles_create(global.particle_sys, x, y, enemy_type_particle, 30*size);
	instance_destroy();
}

if flash_alpha > 0 {
	flash_alpha -= .05;
}

if instance_exists(pt) {
	if instance_exists(o_enemy) and distance_to_object(instance_nearest(x, y, o_enemy)) < (view_wport[0]/2) {
		target = instance_nearest(x, y, o_enemy);
	} else target = noone;
	
	if instance_exists(o_asteroid) and distance_to_object(instance_nearest(x, y, o_asteroid)) < (view_wport[0]/2) {
		if weapon_type != "laser" and weapon_type != "ion" {
			if target = noone {
				target = instance_nearest(x, y, o_asteroid)
			} else if distance_to_object(instance_nearest(x, y, o_asteroid)) < distance_to_object(target) {
				target = instance_nearest(x, y, o_asteroid);
			}
		}
	}
	
	var x1 = pt.x;
	var y1 = pt.y;
	var x2 = pt.x + sprite_width + _x;
	var y2 = pt.y + _y;

	var tdist = point_distance(x1, y1, x2, y2);
	var tdir  = point_direction(x1, y1, x2, y2) + pt.image_angle;

	x = x1 + lengthdir_x(tdist, tdir);
	y = y1 + lengthdir_y(tdist, tdir);
	
	if instance_exists(target) {
		var ang_diff = -angle_difference(direction, point_direction(x, y, target.x, target.y));

		turn_acceleration = clamp(turn_acceleration_mult*(ang_diff/5)/60, -.25, .25);
		turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
		direction += turn_speed;
		image_angle = direction;

		x_speed = pt.x_speed;
		y_speed = pt.y_speed;

		sc_shoot(ang_diff);
	}
}