//switch side of map
if distance_to_object(o_player) > room_width/2 && room_width - x < view_wport[0] {
	x -= room_width - view_wport[0];
} else if distance_to_object(o_player) > room_width/2 && x < view_wport[0] {
	x += room_width - view_wport[0];
}

if type = "laser" {
	if instance_exists(pt) {
		if image_alpha < 1 {
			image_yscale += warmup_speed*global.scale;
			image_alpha += warmup_speed;
			if image_alpha >= 1 bullet_color = c_red;
		}
		
		var x1 = pt.x;
		var y1 = pt.y;
		
		var x2 = pt.x + _x;
		var y2 = pt.y + _y;

		var tdist = point_distance(x1, y1, x2, y2);
		var tdir  = point_direction(x1, y1, x2, y2) + pt.image_angle;
		
		x = x1 + lengthdir_x(tdist, tdir);
		y = y1 + lengthdir_y(tdist, tdir);
		
		direction = pt.direction;
		image_angle = direction;

		x_speed = pt.x_speed;
		y_speed = pt.y_speed;
	} else instance_destroy();
	
	var col_list = ds_list_create();
	
	if image_alpha >= 1 {
		if !enemy {
			collision_line_list(x, y, x + lengthdir_x(sprite_get_width(sprite_index)*image_xscale, direction), y + lengthdir_y(sprite_get_width(sprite_index)*image_xscale, direction), o_enemy, true, true, col_list, false);

			for (var i = 0; i < ds_list_size(col_list); i++) {
				var _enemy = ds_list_find_value(col_list, i);
		
				if (_enemy.image_alpha = 1 or _enemy.disabled) {
					if _enemy.flash_alpha = 0 or _enemy.disabled {
						//if (other.destroy) part_particles_create(global.particle_sys, other.x, other.y, enemy_type_particle, 30);
						//else part_particles_create(global.particle_sys, x, y, enemy_type_particle, 30);
						part_particles_create(global.particle_sys, _enemy.x, _enemy.y, _enemy.enemy_type_particle, 30);
		
						var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
						audio_play_sound_at(_s, _enemy.x, _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(_s, _enemy.x - (room_width - view_hport[0]), _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(_s, _enemy.x + (room_width - view_hport[0]), _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
						_enemy.hp -= 1;
			
						_enemy.hurt = true;
						with _enemy { alarm_set(7, 10); }
		
						//shader
						_enemy.flash_alpha = 1;
					}
				}
			}
		} else {
			collision_line_list(x, y, x + lengthdir_x(sprite_get_width(sprite_index)*image_xscale, direction), y + lengthdir_y(sprite_get_width(sprite_index)*image_xscale, direction), o_player, true, true, col_list, false);
			collision_line_list(x, y, x + lengthdir_x(sprite_get_width(sprite_index)*image_xscale, direction), y + lengthdir_y(sprite_get_width(sprite_index)*image_xscale, direction), o_player_drone, true, true, col_list, false);
		
			for (var i = 0; i < ds_list_size(col_list); i++) {
				var _enemy = ds_list_find_value(col_list, i);
		
				if _enemy.image_alpha = 1 && !_enemy.cloaking_active {
					if _enemy.flash_alpha = 0 {
						if global.cheats = false && global.steam_api = true and instance_exists(o_player) {
							steam_set_stat_int("total_hitby", steam_get_stat_int("total_hitby") + 1);
							if type = "laser" steam_set_stat_int("hitby_weapon_laser", steam_get_stat_int("hitby_weapon_laser") + 1);
						}
						part_particles_create(global.particle_sys, x, y, global.pt_player, 30);
						_enemy.flash_alpha = 1;
						
						if _enemy.object_index = o_player {
							if _enemy.hull_health > 0 {
								if _enemy.hull_health >= 1 _enemy.hull_health -= 1;
								else {
									_enemy.hp -= (1 - _enemy.hull_health);
									_enemy.hull_health = 0;
								}
							} else if _enemy.hp >= 1 _enemy.hp -= 1;
							else _enemy.hp = 0;
						} else {
							_enemy.hp -= 1;
						}
		
						var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
						audio_play_sound_at(_s, _enemy.x, _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(_s, _enemy.x - (room_width - view_hport[0]), _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(_s, _enemy.x + (room_width - view_hport[0]), _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
					}
	
					if _enemy.hp = 1 {
						audio_play_sound_at(sfx_lowhealth, _enemy.x, _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 2);
						audio_play_sound_at(sfx_lowhealth, _enemy.x - (room_width - view_hport[0]), _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
						audio_play_sound_at(sfx_lowhealth, _enemy.x + (room_width - view_hport[0]), _enemy.y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
					}
				}
			}
		}
	}
}