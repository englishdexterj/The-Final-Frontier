if hp <= 0 {
	hp = 0;
	instance_destroy();
}

if flash_alpha > 0 {
	flash_alpha -= .05;
}

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

if instance_exists(o_player_drone) {
	if distance_to_object(instance_nearest(x, y, o_player_drone)) < distance_to_object(o_player) {
		target = instance_nearest(x, y, o_player_drone);
	} else if instance_exists(o_player) {
		target = o_player;
	} else target = noone;
} else if instance_exists(o_player) {
	target = o_player;
} else target = noone;

//suicider ai
if enemy_type = "suicider" {
	if target != noone {
		if follow = true {
			if instance_exists(following) {
				sc_follow();
			} else follow = false;
		} else if distance_to_object(target) >= 90*global.scale*target.size {
			sc_push(target);
		} else if distance_to_object(target) < 90*global.scale*target.size {
			sc_suicide(target);
		}
	}
}

//basic ai
else if enemy_type = "basic" {
	if target != noone {
		if follow = true {
			if instance_exists(following) {
				sc_follow();
			} else follow = false;
		} else if distance_to_object(target) >= 90*global.scale*target.size {
			sc_push(target);
		} else if distance_to_object(target) < 90*global.scale*target.size {
			sc_back(target);
		}
	}
}

//bomber ai
else if enemy_type = "bomber" {
	if target != noone {
		if follow = true {
			if instance_exists(following) {
				sc_follow();
			} else follow = false;
		} if distance_to_object(target) >= 90*global.scale*target.size {
			sc_push(target);
		} else if distance_to_object(target) < 90*global.scale*target.size {
			sc_back(target);
		}
	}
}

//rusher ai
else if enemy_type = "rusher" {
	if target != noone {
		if follow = true {
			if instance_exists(following) {
				sc_follow();
			} else follow = false;
		}
		if smart var ang_diff = sc_angdiff_smart(1, target, .5);
		else var ang_diff = sc_angdiff(1, target);
		if ((ang_diff < 10 and distance_to_object(target) < 200*global.scale*target.size) 
			   or rush) and rushing < 120 {
			rush = true;
			part_particles_create(global.particle_sys, x, y, global.pt_engine, 2);
			
			sc_rush(target, ang_diff);
		} else {
			if rush {
				if rushing < 240 {
					rushing++;
				} else {
					rush = false;
					rushing = 0;
				}
			}
			sc_push(target);
		}
	}
}

//marauder ai
else if enemy_type = "marauder" {
	if target != noone {
		if follow = true {
			if instance_exists(following) {
				sc_follow();
			} else follow = false;
		} if distance_to_object(target) >= 180*global.scale*target.size {
			sc_push(target);
		} else {
			sc_marauder(target);
		}
	}
}

//sniper ai (ranger)
else if enemy_type = "sniper" {
	if target != noone {
		if follow = true {
			if instance_exists(following) {
				sc_follow();
			} else follow = false;
		} if distance_to_object(target) >= 520*global.scale*target.size {
			sc_push(target);
		} else if distance_to_object(target) < 260*global.scale*target.size {
			sc_back(target);
		} else {
			sc_snipe(target);
		}
	}
}

//gunship ai
else if enemy_type = "gunship" {
	if target != noone {
		if distance_to_object(target) >= 180*global.scale {
			sc_push(target);
		} else if distance_to_object(target) < 180*global.scale {
			sc_gunship(target);
		}
	}
}

//shotgunner ai
else if enemy_type = "shotgunner" {
	if target != noone {
		if distance_to_object(target) >= 180*global.scale {
			sc_push(target);
		} else if distance_to_object(target) < 180*global.scale {
			sc_shotgunner(target);
		}
	}
}

//ion ai
else if enemy_type = "ion" {
	if target != noone {
		if follow = true {
			if instance_exists(following) {
				sc_follow();
			} else follow = false;
		} else if distance_to_object(target) >= 90*global.scale*target.size {
			sc_push(target);
		} else if distance_to_object(target) < 90*global.scale*target.size {
			sc_suicide(target);
		}
	}
}

//destroyer ai
else if enemy_type = "destroyer" {
	if target != noone {
		if distance_to_object(target) >= 180*global.scale {
			sc_push(target);
		} else if distance_to_object(target) < 180*global.scale {
			sc_destroyer(target);
		}
	}
}


//swarmer ai
else if enemy_type = "swarmer" {
	if follow = true and instance_exists(target) {
		if instance_exists(following) {
			sc_swarm();
		} else follow = false;
	}
}


//heavy cruiser ai
else if enemy_type = "heavy_cruiser" {
	if target != noone {
		if distance_to_object(target) >= 180*global.scale {
			sc_push(target);
		} else if distance_to_object(target) < 180*global.scale {
			sc_destroyer(target);
		}
		if reactor_active[1] = false && reactor_active[2] = false {
			instance_destroy();
		}
	}
}

//heavy cruiser ai
else if enemy_type = "battlecruiser" {
	if target != noone {
		if distance_to_object(target) >= 270*global.scale {
			sc_push(target);
		} else if distance_to_object(target) < 270*global.scale {
			sc_destroyer(target);
		}
		if reactor_active[1] = false && reactor_active[2] = false
		&& reactor_active[3] = false && reactor_active[4] = false {
			instance_destroy();
		}
	}
}

else {
	show_debug_message("No AI for " + string(enemy_type))
	if distance_to_object(target) >= 90*global.scale*target.size {
		sc_push(target);
	} else if distance_to_object(target) < 90*global.scale*target.size {
		sc_back(target);
	}
}
}

if enemy_type = "rusher" and rush {
	x_speed = clamp(x_speed * global.fric, -global.spd*max_speed*1.5, global.spd*max_speed*1.5);
	y_speed = clamp(y_speed * global.fric, -global.spd*max_speed*1.5, global.spd*max_speed*1.5);

	x += x_speed*global.scale;
	y += y_speed*global.scale;
} else {
	x_speed = clamp(x_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);
	y_speed = clamp(y_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);

	x += x_speed*global.scale;
	y += y_speed*global.scale;
}
