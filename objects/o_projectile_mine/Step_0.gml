if idle {
	if instance_exists(parent) {
		x = parent.x + lengthdir_x(x_start*global.scale, parent.direction);
		y = parent.y + lengthdir_y(x_start*global.scale, parent.direction);
	} else {
		points = 0;
		instance_destroy();
	}
	
	if deploy > 0 {
		if deploy_move {
			x_start -= 2/global.scale;
			//y_start += lengthdir_y(1, image_angle)/global.scale;
		}
		deploy--;
		
		if deploy = 0 {
			idle = false;
			depth = layer_get_depth("Shots");
		}
	}
} else {
	if instance_exists(o_player) {
		//switch side of map
		if distance_to_object(o_player) > view_wport[0] && room_width - x < view_wport[0]*2 
		and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x - (room_width - view_wport[0]), y, o_player.x, o_player.y)) {
			x -= (room_width - view_wport[0]);
		} else if distance_to_object(o_player) > view_wport[0] && x < view_wport[0]*2
		and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x + (room_width - view_wport[0]), y, o_player.x, o_player.y)){
			x += (room_width - view_wport[0]);
		}
	}

	if explosion_timer > 0 {
		if blip_timer > 0 blip_timer--;
	
		if blip_timer = 0 { //play blip audio and blink red when blowing up
			if image_index = 2 image_index = 3;
			else image_index = 2;
		
			if !audio_is_playing(sfx_sounds_Blip1) {
				var _s = sfx_sounds_Blip1;
				var snd = audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
				var snd2 = audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
				var snd3 = audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
				audio_sound_gain(snd2, .1, 0);
				audio_sound_gain(snd3, .1, 0);
				audio_sound_gain(snd, .1, 0);
				blip_timer = explosion_timer div 5;
			}
		}
	
		explosion_timer--;
	
		if explosion_timer = 0 instance_destroy();
	}

	if instance_exists(target) {
		timer++;
	
		var ang_diff = sc_angdiff(1, target);
		if distance_to_object(target) > 270*global.scale {
			target = noone;
			ang_diff = 0;
		} else {
			if explosion_timer = 0 { //only blink green if not exploding
				if timer mod 20 = 0 {
					if image_index = 0 image_index = 1;
					else image_index = 0;
		
					timer -= 20;
				}
		
				if distance_to_object(target) < 90*global.scale { //start explosion if closer than 90 and not already exploding
					explosion_timer = 120;
					blip_timer = explosion_timer div 5;
				}
			}
		
			forward = 1;
			max_speed = clamp((360*global.scale / distance_to_object(target))/2, 0, 5);
		}
	} else {
		image_index = 0;
		var ang_diff = 0;
		forward = 0;
		max_speed = 0;
		
		if !enemy {
			target = instance_nearest(x, y, o_enemy);
			
			if distance_to_object(target) > distance_to_object(instance_nearest(x, y, o_station_parent)) {
				target = instance_nearest(x, y, o_station_parent);
			}
			
			if distance_to_object(target) > distance_to_object(instance_nearest(x, y, o_station_core)) {
				target = instance_nearest(x, y, o_station_core);
			}
		} else {
			if instance_exists(o_player) {
				target = instance_nearest(x, y, o_friendly_parent);
			} else {
				target = instance_nearest(x, y, o_player_drone);
			}
		}
	}

	acceleration = clamp((acceleration + forward*global.spd*.02)*global.drag, 0, 1);

	if target = noone and drift {
		x += drift_x;
		y += drift_y;
	} else drift = false;

	//move player
	x_speed += lengthdir_x(acceleration, direction);
	y_speed += lengthdir_y(acceleration, direction);
	
	direction += ang_diff;
	
	x_speed = clamp(x_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);
	y_speed = clamp(y_speed * global.fric, -global.spd*max_speed, global.spd*max_speed);

	x += x_speed*global.scale;
	y += y_speed*global.scale;
}