if hp + hull_health <= 0 && image_alpha != 0 {
	part_particles_create(global.particle_sys, x, y, global.pt_basic, 30*2);
}

if hp <= current_max_hp - 1 current_max_hp -= 1;

audio_listener_position(x, y, 0);

//reduce damage flash effect
if flash_alpha > 0 {
	flash_alpha -= .025;
}

//check for movement
if disabled = false {
	if !gamepad_is_connected(0) {
		forward = keyboard_check(global.key[ctrl.forward]) - keyboard_check(global.key[ctrl.backward]);
		turn = keyboard_check(global.key[ctrl.left]) - keyboard_check(global.key[ctrl.right]);
		shoot = keyboard_check(global.key[ctrl.shoot]);
		shoot_special = keyboard_check(global.key[ctrl.special]);
	} else {
		forward = -gamepad_axis_value(0, gp_axislv);
		turn = -.5*gamepad_axis_value(0, gp_axisrh);
		if gamepad_button_check(0, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderrb) shoot = true;
		else shoot = false;
		
		if gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(0, gp_shoulderr) shoot_special = true;
		else shoot_special = false;
	}
} else {
	forward = 0;
	turn = 0;
	shoot = false;
	shoot_special = false;
}

acceleration = clamp((acceleration + accel_speed*forward*global.spd*.1)*(global.drag-ship_drag), 0, max_acceleration);

//move player
x_speed += lengthdir_x(acceleration, direction);
y_speed += lengthdir_y(acceleration, direction);

x_speed = clamp(x_speed*.998, -global.spd*max_speed, global.spd*max_speed);
y_speed = clamp(y_speed*.998, -global.spd*max_speed, global.spd*max_speed);

x += x_speed*global.scale;
y += y_speed*global.scale;

if y > room_height {
	y = room_height - 10;
	y_speed *= -.5;
	direction *= -1;
	image_angle = direction;
} else if y < 0 {
	y_speed *= -.5;
	direction *= -1;
	image_angle = direction;
	y = 10;
}
if x > room_width - view_wport[0]/2 {
	x -= room_width - view_wport[0];
} else if x < view_wport[0]/2 {
	x += room_width - view_wport[0];
}

spd = sqrt(power(x_speed, 2) + power(y_speed, 2));

turn_acceleration = clamp(turn, -max_turn_accel, max_turn_accel);
turn_speed = clamp((turn_speed + turn_acceleration) * (global.fric - .08), -max_turn_speed, max_turn_speed);

direction += turn_speed;
image_angle = direction;


//shoot
if weapon_lasers > 0 {
	if laser_cooldown = false && laser_heat <= 0 && shoot_special {
		max_turn_speed /= 6;
		
		laser_cooldown = true;
		laser_heat += 10;
		alarm_set(6, 5);
		with instance_create_layer(x, y, "Instances", o_laser) {
			enemy_type = "Player";
			flank = false;
			plated = false;
			pt = other.id;
			image_alpha = 0;
			depth = pt.depth + 1;
			_x = 0;
			_y = 0;
			enemy = false;
			bullet_color = c_white;
			direction = other.direction;
			image_angle = other.image_angle;
			image_xscale = 10*global.scale;
			image_yscale = 0;
			warmup_speed = 0.01;
		}
		
		if flank_laser = true {
			with instance_create_layer(x, y, "Instances", o_laser) {
				enemy_type = "Player";
				flank = true;
				plated = false;
				pt = other.id;
				depth = pt.depth + 1;
				_x = 0;
				_y = 0;
				enemy = false;
				bullet_color = c_white;
				direction = other.direction;
				image_angle = other.image_angle;
				image_xscale = -10*global.scale;
				image_yscale = 0;
			}
		}
	}
}

if weapon_missiles > 0 {
	if missile_cooldown = false && missile_heat <= 0 && shoot {
		//x_speed += lengthdir_x(-.2, direction);
		//y_speed += lengthdir_y(-.2, direction);
	
		missile_cooldown = true;
		missile_heat += 10;
		alarm_set(5, 5);
		for (var i = 0; i < weapon_missiles; i++) {
			with instance_create_layer(x, y, "Instances", o_missile) {
				enemy_type = "Player";
				if other.plated_missile plated = true;
				else plated = false;
				enemy = false;
				if !enemy {
					image_index = 1;
					target = instance_nearest(x, y, o_enemy);
				} else {
					target = o_player;
				}
				if plated = true image_index += 2;
				
				max_turn_speed = other.missile_turn_speed;
				bullet_color = c_white;
				direction = other.direction;
				image_angle = other.image_angle;
				speed = (10*global.spd + other.spd)*global.scale;
			
				if other.weapon_missiles = 2 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i*2-1)*4*global.scale;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				} else if other.weapon_missiles = 3 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i*2-2)*4*global.scale;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				}
			}
		}
	}
} 

if weapon_bullets > 0 {
	if cooldown = false && heat <= 6-(bullet_heat + (weapon_bullets-1)*bullet_heat/2) && shoot {
		//x_speed += lengthdir_x(-.2, direction);
		//y_speed += lengthdir_y(-.2, direction);
	
		cooldown = true;
		heat += bullet_heat + (weapon_bullets-1)*bullet_heat/2;
		alarm_set(0, bullet_reload);
		for (var i = 0; i < weapon_bullets; i++) {
			with instance_create_layer(x + lengthdir_x(6, direction), y + lengthdir_y(6, direction), "Instances", o_bullet) {
				plated = false;
				enemy = false;
				bullet_color = c_white;
				//image_angle = other.image_angle;
				//direction = image_angle;
				//speed = 10*global.spd + other.spd;
				
				direction = other.direction;
				image_angle = direction;
				speed = ((other.bullet_speed)*global.spd + other.spd)*global.scale;
				if other.weapon_bullets = 2 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i*2-1)*4*global.scale;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				} else if other.weapon_bullets = 3 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i-1)*4*global.scale;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;
					
					direction -= (i-1)*4;
					image_angle = direction;
					
					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				} else if other.weapon_bullets = 4 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i*2-3)*2*global.scale;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;
					
					direction -= (i*2-3)*2;
					image_angle = direction;
					
					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				}
			}
		}
	}
}

if weapon_ion > 0 {
	if ion_cooldown = false && ion_heat <= 5 && shoot {
		//x_speed += lengthdir_x(-.2, direction);
		//y_speed += lengthdir_y(-.2, direction);
	
		ion_cooldown = true;
		ion_heat += 2;
		alarm_set(7, 5);
		for (var i = 0; i < weapon_ion; i++) {
			with instance_create_layer(x + lengthdir_x(8, direction), y + lengthdir_y(8, direction), "Instances", o_ion_beam) {
				plated = false;
				enemy = false;
				bullet_color = c_white;
				//image_angle = other.image_angle;
				//direction = image_angle;
				//speed = 10*global.spd + other.spd;
				
				direction = other.direction;
				image_angle = direction;
				speed = (10*global.spd + other.spd)*global.scale;
				if other.weapon_ion = 2 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i*2-1)*4*global.scale;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				} else if other.weapon_ion = 3 {
					var x1 = other.x;
					var y1 = other.y;
					var x2 = other.x + sprite_width;
					var y2 = other.y + (i-1)*4*global.scale;

					var tdist = point_distance(x1, y1, x2, y2);
					var tdir  = point_direction(x1, y1, x2, y2) + other.image_angle;

					x = x1 + lengthdir_x(tdist, tdir);
					y = y1 + lengthdir_y(tdist, tdir);
				}
			}
		}
	}
}

if drone_ship && drones < drones_max && drone_cooldown = false && drone_heat = 0 {
	drone_cooldown = true;
	drone_heat += 50;
	
	if !global.cheats and global.steam_api {
		steam_set_stat_int("total_drones_produced", steam_get_stat_int("total_drones_produced") + 1);
		switch drone_hardware {
			case 0:
				steam_set_stat_int("drones_t1_produced", steam_get_stat_int("drones_t1_produced") + 1);
				break;
			case 1:
				steam_set_stat_int("drones_t2_produced", steam_get_stat_int("drones_t2_produced") + 1);
				break;
			case 2:
				steam_set_stat_int("drones_t3_produced", steam_get_stat_int("drones_t3_produced") + 1);
				break;
		}
	}
		
	var _s = instance_create_layer(x, y, "Instances", o_player_drone);
	_s.direction = irandom_range(0, 359);
	_s.image_angle = _s.direction;
	_s.ai = drone_ai;
	_s.hardware = drone_hardware;
		
	drones += 1;
		
	alarm_set(8, 5);
}

if flak {
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
			alarm_set(2, flak_speed);
			with instance_create_layer(x, y, "Instances", o_flak) {
				enemy_type = "Player";
				enemy = false;
				bullet_color = c_ltgray;
				image_xscale = .75*global.scale;
				image_yscale = .75*global.scale;
			
				direction = point_direction(x, y, _e.x, _e.y) + random_range(-10, 10);
				image_angle = direction;
				speed = (10*global.spd + other.spd)*global.scale;
			}
		}
	}
}

var cl = false;
if gamepad_is_connected(0) {
	if gamepad_button_check_pressed(0, gp_face1) or gamepad_button_check_pressed(0, gp_shoulderl) or gamepad_button_check_pressed(0, gp_shoulderr) {
		cl = true;
	}
}

if cloaking and !cloaking_active and cloaking_cooldown = 0 and (keyboard_check_pressed(global.key[ctrl.cloak]) or cl) {
	cloaking_active = true;
	cloaking_cooldown = 16;
	
	audio_play_sound_at(sfx_cloak, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	alarm_set(11, cloaking_length);
}

if missile_defense {
	if distance_to_object(o_bullet) < 100 && missile_flak_cooldown = false && missile_flak_heat <= 5 {
		var _cl = 100000;
		var _e = noone;
		with (o_bullet) {
			if enemy && type = "missile" {
				if distance_to_object(other.id) < _cl {
					_cl = distance_to_object(other.id)
					var _e = id;
				}
			}
		}
		if instance_exists(_e) && _cl < 100 {
			missile_flak_cooldown = true;
			missile_flak_heat += 1;
			alarm_set(10, 8);
			with instance_create_layer(x, y, "Instances", o_missile_flak) {
				enemy_type = "Player";
				enemy = false;
				bullet_color = c_blue;
				image_xscale = .85*global.scale;
				image_yscale = .85*global.scale;
			
				direction = point_direction(x, y, _e.x, _e.y) + random_range(-10, 10);
				image_angle = direction;
				speed = (10*global.spd + other.spd)*global.scale;
			}
		}
	}
}
