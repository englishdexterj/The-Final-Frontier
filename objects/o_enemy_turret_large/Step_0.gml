if hp <= 0 || !instance_exists(pt) {
	part_particles_create(global.particle_sys, x, y, enemy_type_particle, 30*size);
	instance_destroy();
}

if flash_alpha > 0 {
	flash_alpha -= .05;
}

if instance_exists(pt) {
	if instance_exists(o_player_drone) {
		if distance_to_object(instance_nearest(x, y, o_player_drone)) < distance_to_object(o_player) {
			target = instance_nearest(x, y, o_player_drone);
		} else if instance_exists(o_player) {
			target = o_player;
		}
	} else if instance_exists(o_player) {
		target = o_player;
	} else target = noone;
	
	if instance_exists(o_asteroid) {
		if target = noone {
			target = instance_nearest(x, y, o_asteroid)
		} else if weapon_type != "laser" and weapon_type != "ion" and distance_to_object(instance_nearest(x, y, o_asteroid)) < distance_to_object(target) {
			target = instance_nearest(x, y, o_asteroid);
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
	
	if instance_exists(target) var ang_diff = -angle_difference(direction, point_direction(x, y, target.x, target.y));

	turn_acceleration = clamp(ang_diff/45, -.25, .25);
	turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);
	
	direction += turn_speed;
	image_angle = direction;

	x_speed = pt.x_speed;
	y_speed = pt.y_speed;

	sc_shoot(ang_diff);
	
	if !instance_place(x, y, pt) instance_destroy();
}