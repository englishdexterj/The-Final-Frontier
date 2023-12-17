if enemy_type = "station_core" {
	if instance_exists(parent) {
		instance_destroy(parent);
		global.station_destroyed = true;
	}
}

if points != 0 {
	//create death particles
	if sprite_centered {
		part_particles_create(global.particle_sys, other.x, other.y, enemy_type_particle_death, 30*size);
	} else {
		part_particles_create(global.particle_sys, other.x + lengthdir_x(image_xscale*sprite_get_width(sprite_index)/2, image_angle), other.y + lengthdir_y(image_yscale*sprite_get_height(sprite_index)/2, image_angle), enemy_type_particle_death, 30*size);
	}
	
	//create point indicator
	if sprite_centered {
		var _point_indicator = instance_create_layer(x, y, "Above_All", o_point_indicator);
	} else {
		var _point_indicator = instance_create_layer(x + image_xscale*sprite_get_width(sprite_index)/2, y + image_yscale*sprite_get_height(sprite_index)/2, "Above_All", o_point_indicator);
	}
	_point_indicator.points = points;
	_point_indicator.original = true;
	
	//add kill to stats
	if instance_exists(o_player) {
		if global.cheats = false and global.steam_api = true {
			steam_set_stat_int("total_kills", steam_get_stat_int("total_kills") + 1);
		
			if enemy_type = "station_hatch" {
				steam_set_stat_int("kills_station_hatch", steam_get_stat_int("kills_station_hatch") + 1);
			} else if enemy_type = "station_rocket_launcher" {
				steam_set_stat_int("kills_station_rocket_launcher", steam_get_stat_int("kills_station_rocket_launcher") + 1);
			} else if enemy_type = "station_hanger" {
				steam_set_stat_int("kills_station_hanger", steam_get_stat_int("kills_station_hanger") + 1);
			} else if enemy_type = "station_shield" {
				steam_set_stat_int("kills_station_shield", steam_get_stat_int("kills_station_shield") + 1);
			} else if enemy_type = "station_core" {
				steam_set_stat_int("kills_station_core", steam_get_stat_int("kills_station_core") + 1);
			}
		}
	}
	
	//play audio
	if enemy_type = "station_core" {
		var _s = choose(sfx_exp_long4);
		audio_play_sound_at(_s, x, y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
		audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
		audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
	} else if !global.station_destroyed {
		if enemy_type = "station_shield" {
			var _s = choose(sfx_exp_medium1);
			audio_play_sound_at(_s, x, y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
			audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
			audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
		} else if enemy_type = "station_hanger" {
			for (var i = 0; i < 4; i++) {
				with instance_create_layer(x, y, "Instances", o_destroy_particle) {
					sprite_index = s_station_hanger_destroyed;
					image_angle = other.image_angle;
					direction = image_angle + 45 + i*79 + irandom_range(-20, 20);
					speed = .5*global.scale;
					image_index = i;
					image_xscale = global.scale;
					image_yscale = global.scale;
					alpha = 2 * random_range(.8, 1.2);
					destroy_timer = 180;
					audio = false;
					type = "station_hanger";
				}
			}
			
			var _s = choose(sfx_exp_medium2, sfx_exp_medium3, sfx_exp_medium4);
			audio_play_sound_at(_s, x, y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
			audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
			audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
		} else {
			var _s = choose(sfx_exp_short_soft1,sfx_exp_short_soft2,sfx_exp_short_soft3,sfx_exp_short_soft4,sfx_exp_short_soft5,sfx_exp_short_soft6,sfx_exp_short_soft7,sfx_exp_short_soft8,sfx_exp_short_soft9,sfx_exp_short_soft10,sfx_exp_short_soft11,sfx_exp_short_soft12);
			audio_play_sound_at(_s, x, y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
			audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
			audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1);
		}
	}
}