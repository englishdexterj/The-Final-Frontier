if image_alpha = 1 var _c = c_red;
else var _c = c_white;

for (var i = -(laser_width/(global.scale*2))/2; i < (laser_width/(global.scale*2))/2; i++) {
	var _sx = x + lengthdir_x(2*global.scale * i, direction+90);
	var _sy = y + lengthdir_y(2*global.scale * i, direction+90);
	
	var _current = i + (laser_width/(global.scale*2))/2;
	
	if enemy var collision = collision_line_first_point(_sx, _sy, _sx + lengthdir_x(laser_length-sqr(abs(i))*global.scale, direction), _sy + lengthdir_y(laser_length-sqr(abs(i))*global.scale, direction), o_friendly_parent);
	else var collision = collision_line_first_point(_sx, _sy, _sx + lengthdir_x(laser_length-sqr(abs(i))*global.scale, direction), _sy + lengthdir_y(laser_length-sqr(abs(i))*global.scale, direction), o_enemy_parent);
	
	if collision[0] != noone {
		draw_set_color(c_yellow);
		draw_set_alpha(.01);
		//draw_line_width(_sx, _sy, collision[1], collision[2], 2*2*global.scale);
		draw_set_color(_c);
		draw_set_alpha(1);
		draw_line_width(_sx, _sy, collision[1], collision[2], 2*global.scale);
		
		if image_alpha = 1 {
			with collision[0] {
				if variable_instance_exists(id, "hp") {
					if object_index = o_player {
						if !invincible {
							if hull_health > 0 {
								if hull_health >= other.tick_damage hull_health -= other.tick_damage;
								else {
									hp -= (other.tick_damage - hull_health);
									hull_health = 0;
								}
							} else if hp >= other.tick_damage hp -= other.tick_damage;
							else hp = 0;
						
							if hp <= 0 and global.cheats = false && global.steam_api = true {
								sc_stats_enemy_projectile();
							}
						}
					} else {
						if round(hp) = hp {
							part_particles_create(global.particle_sys, collision[1], collision[2], enemy_type_particle, 30);
		
							var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
							audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
							audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
							audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
							
							//shader
							flash_alpha = 1;
						}
						hp -= other.tick_damage;
					}
				
					laser_heat += other.tick_damage;
				
					if !audio_is_playing(sfx_sound_mechanicalnoise4) {
						audio_play_sound_at(sfx_sound_mechanicalnoise4, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
					}
					
					if random(1) > .95 {
						var _x = collision[1] - x;
						var _y = collision[2] - y;
	
						var _a = image_angle * pi / 180;
						damage_y = _y*cos(_a) + _x*sin(_a);
						damage_x = _x*cos(_a) - _y*sin(_a);
		
						hit = true;
						hit_radius = 2;
					}
				}
			}
		}
	} else if collision[0] = noone { //only draw full line if both collision and collision2 is not noone
		draw_set_color(c_yellow);
		draw_set_alpha(.01);
		//draw_line_width(_sx, _sy, _sx + lengthdir_x(laser_length-sqr(abs(i))*global.scale, direction), _sy + lengthdir_y(laser_length-sqr(abs(i))*global.scale, direction), 2*2*global.scale);
		draw_set_color(_c);
		draw_set_alpha(1);
		draw_line_width(_sx, _sy, _sx + lengthdir_x(laser_length-sqr(abs(i))*global.scale, direction), _sy + lengthdir_y(laser_length-sqr(abs(i))*global.scale, direction), 2*global.scale);
	}
	
	var collision2 = collision_line_first_point(_sx, _sy, _sx + lengthdir_x(laser_length-sqr(abs(i))*global.scale, direction), _sy + lengthdir_y(laser_length-sqr(abs(i))*global.scale, direction), o_projectile_parent);
	
	if collision2[0] != noone {
		if image_alpha = 1 {
			with collision2[0] {
				if object_index != o_asteroid and object_is_ancestor(object_index, o_projectile_parent) {
					instance_destroy(collision2[0]);
				} else if variable_instance_exists(id, "hp") {
					hp -= other.tick_damage;
					//show_debug_message(other.laser_width/(global.scale*2))
					laser_heat += other.tick_damage;
				
					if !audio_is_playing(sfx_sound_mechanicalnoise4) {
						audio_play_sound_at(sfx_sound_mechanicalnoise4, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
					}
					
					if random(1) > .95 {
						var _x = collision2[1] - x;
						var _y = collision2[2] - y;
	
						var _a = image_angle * pi / 180;
						damage_y = _y*cos(_a) + _x*sin(_a);
						damage_x = _x*cos(_a) - _y*sin(_a);
		
						hit = true;
						hit_radius = 2;
					}
				}
			}
		}
	}
}

draw_set_color(c_green);
draw_circle(x, y, 8, false);
draw_set_color(c_white);

/*
for (var i = 0; i < ds_list_size(_col_list); i++) {
	var _col = ds_list_find_value(_col_list, i);
	if instance_exists(_col) {
		with _col {
			if variable_instance_exists(id, "hp") {
				hp -= 2*(1/(other.laser_width/(global.scale*2)))*1/60; //.5 damage a second if touching all beams
				//show_debug_message(other.laser_width/(global.scale*2))
				laser_heat += 2*(1/(other.laser_width/(global.scale*2)))*1/60;
				
				if !audio_is_playing(sfx_sound_mechanicalnoise4) {
					audio_play_sound_at(sfx_sound_mechanicalnoise4, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
				}
			}
		}
	}
}
*/