if hp <= 0 {
	hp = 0;
	instance_destroy();
}

if flash_alpha > 0 {
	flash_alpha -= .05;
}

if laser_heat > 0 {
	laser_heat -= (.5)*1/5*1/60;
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
	if idle = false {
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



if !disabled and !idle {
	#region set followed speed
	if followed {
		if instance_exists(followed) and object_is_ancestor(followed.object_index, o_enemy) {
			if !followed_set { //set followed speeds to current max speeds to change back when no longer followed
				if variable_instance_exists(followed, "followed") and followed.followed and instance_exists(followed.followed) {
					followed_turn_acc = turn_acc;
					followed_max_turn_speed = max_turn_speed;
					followed_max_speed = max_speed;
					
					turn_acc = min(turn_acc, followed.followed.turn_acc, followed.turn_acc);
					max_turn_speed = min(max_turn_speed, followed.followed.max_turn_speed, followed.max_turn_speed);
					max_speed = min(max_speed, followed.followed.max_speed, followed.max_speed);
				} else {
					followed_turn_acc = turn_acc;
					followed_max_turn_speed = max_turn_speed;
					followed_max_speed = max_speed;
					
					turn_acc = min(turn_acc, followed.turn_acc);
					max_turn_speed = min(max_turn_speed, followed.max_turn_speed);
					max_speed = min(max_speed, followed.max_speed);
				}
				
				followed_set = true;
			}
		} else { //set speeds back to normal when no longer followed
			followed = false;
			
			turn_acc = followed_turn_acc;
			max_turn_speed = followed_max_turn_speed;
			max_speed = followed_max_speed;
		}
	}
	#endregion
	
	#region set following speed
	if following {
		if instance_exists(following) and object_is_ancestor(following.object_index, o_enemy) {
			if !following_set { //set following speeds to current max speeds to change back when no longer following
				if variable_instance_exists(following, "following") and following.following and instance_exists(following.following) {
					following_turn_acc = turn_acc;
					following_max_turn_speed = max_turn_speed;
					following_max_speed = max_speed;
					
					turn_acc = min(turn_acc, following.following.turn_acc, following.turn_acc);
					max_turn_speed = min(max_turn_speed, following.following.max_turn_speed, following.max_turn_speed);
					max_speed = min(max_speed, following.following.max_speed, following.max_speed);
				} else {
					following_turn_acc = turn_acc;
					following_max_turn_speed = max_turn_speed;
					following_max_speed = max_speed;
					
					turn_acc = min(turn_acc, following.turn_acc);
					max_turn_speed = min(max_turn_speed, following.max_turn_speed);
					max_speed = min(max_speed, following.max_speed);
				}
				
				following_set = true;
			}
		} else { //set speeds back to normal when no longer followed
			following = false;
			
			turn_acc = following_turn_acc;
			max_turn_speed = following_max_turn_speed;
			max_speed = following_max_speed;
		}
	}
	#endregion
	
	#region choose enemy target
	if instance_exists(o_player_drone) {
		if distance_to_object(instance_nearest(x, y, o_player_drone)) < distance_to_object(o_player) {
			target = instance_nearest(x, y, o_player_drone);
		} else if instance_exists(o_player) {
			target = o_player;
		} else target = noone;
	} else if instance_exists(o_player) {
		target = o_player;
	} else target = noone;
	#endregion
	
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
			} else if distance_to_object(target) >= 90*global.scale*target.size {
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
			} else {
			
				var ang_diff = sc_get_angdiff(target, 1, 0.5);
			
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
	}

	//marauder ai
	else if enemy_type = "marauder" {
		if target != noone {
			if follow = true {
				if instance_exists(following) {
					sc_follow();
				} else follow = false;
			} else if distance_to_object(target) >= 180*global.scale*target.size {
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
			} else if distance_to_object(target) >= 520*global.scale*target.size {
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
			if follow = true {
				if instance_exists(following) {
					sc_follow();
				} else follow = false;
			} else if distance_to_object(target) >= 180*global.scale {
				sc_push(target);
			} else if distance_to_object(target) < 180*global.scale {
				sc_gunship(target);
			}
		}
	}

	//shotgunner ai
	else if enemy_type = "shotgunner" {
		if target != noone {
			if follow = true {
				if instance_exists(following) {
					sc_follow();
				} else follow = false;
			} else if distance_to_object(target) >= 180*global.scale {
				sc_push(target);
			} else if distance_to_object(target) < 180*global.scale {
				sc_shotgunner(target);
			}
		}
	}
	
	//sentinel ai
	else if enemy_type = "sentinel" {
		if target != noone {
			if follow = true {
				if instance_exists(following) {
					sc_follow();
				} else follow = false;
			} else if distance_to_object(target) >= 400*global.scale*target.size {
				sc_push(target);
			} else if distance_to_object(target) < 200*global.scale*target.size {
				sc_back(target);
			} else {
				sc_behavior_lay_mines(target);
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
			if follow = true {
				if instance_exists(following) {
					sc_follow();
				} else follow = false;
			} else if distance_to_object(target) >= 180*global.scale {
				sc_push(target);
			} else if distance_to_object(target) < 180*global.scale {
				sc_destroyer(target);
			}
		}
	}


	//swarmer ai
	else if enemy_type = "swarmer" {
		if instance_exists(target) {
			if follow = true {
				if instance_exists(following) {
					sc_swarm();
				} else follow = false;
			} else {
				sc_push(target);
			}
		}
	}


	//heavy cruiser ai
	else if enemy_type = "heavy_cruiser" {
		if target != noone {
			if follow = true {
				if instance_exists(following) {
					sc_follow();
				} else follow = false;
			} else if distance_to_object(target) >= 180*global.scale {
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
			if follow = true {
				if instance_exists(following) {
					sc_follow();
				} else follow = false;
			} else if distance_to_object(target) >= 270*global.scale {
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
} else if idle {
	if instance_exists(parent) {
		x = parent.x + x_start*global.scale;
		y = parent.y + y_start*global.scale;
	} else {
		points = 0;
		instance_destroy();
	}
	
	if deploy > 0 {
		if deploy_move {
			x_start += lengthdir_x(1, image_angle)/global.scale;
			y_start += lengthdir_y(1, image_angle)/global.scale;
		}
		deploy--;
		
		if deploy = 0 {
			idle = false;
			depth = layer_get_depth("Instances_Top");
		}
	} else {
		if instance_exists(o_player_drone) {
			if distance_to_object(instance_nearest(x, y, o_player_drone)) < distance_to_object(o_player) {
				target = instance_nearest(x, y, o_player_drone);
			} else if instance_exists(o_player) {
				target = o_player;
			} else target = noone;
		} else if instance_exists(o_player) {
			target = o_player;
		} else target = noone;
	
		if target != noone {
			if distance_to_object(target) <= idle_activation_range*global.scale {
				idle = false;
			}
		}
	}
	
	if idle = false global.idle_enemies--;
} else if disabled {
	sc_behavior_disabled();
	
	if enemy_type = "swarmer" {
		follow = false;
	}
	
	x_speed = clamp(x_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);
	y_speed = clamp(y_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);

	x += x_speed*global.scale;
	y += y_speed*global.scale;
}