
	/*
	var dx = sign(x - other.x);
	var dy = sign(y - other.y);
	
	var sx = sign(x_speed);
	var sy = sign(y_speed);
	var sey = sign(other.x_speed);
	var sex = sign(other.y_speed);
	
	var cp = false;
	var ce = false;
	if dx > 0 and dy < 0 { //enemy top right
		if (sx > 0 and sy < 0) var cp = true;
		if (sex < 0 and sey > 0) var ce = true;
	} else if dx > 0 and dy > 0 { //enemy top left
		if (sx < 0 and sy < 0) var cp = true;
		if (sex > 0 and sey > 0) var ce = true;
	} else if dx < 0 and dy > 0 { //enemy bot left
		if (sx < 0 and sy > 0) var cp = true;
		if (sex > 0 and sey < 0) var ce = true;
	} else if dx < 0 and dy < 0 { //enemy bot right
		if (sx > 0 and sy > 0) var cp = true;
		if (sex < 0 and sey < 0) var ce = true;
	}
	*/
	
if flash_alpha = 0 and other.size <= 8 {
	var temp_xspd = x_speed;
	var temp_yspd = y_speed;
		
	x -= x_speed;
	y -= y_speed;
	
	//x_speed = (x_speed + other.x_speed*(other.size/size))*.9;
	other.x_speed = -other.x_speed/2 + -max(abs(temp_xspd/2), abs(other.x_speed/2));
	//y_speed = (y_speed + other.y_speed*(other.size/size))*.9;
	other.y_speed = -other.y_speed/2 + -max(abs(temp_yspd/2), abs(other.y_speed/2));
	
	if other.size <= 2 {
		other.direction += 180;
		other.image_angle = other.direction;
	}
	
	while place_meeting(other.x, other.y, id) {
		other.x += other.x_speed;
		other.y += other.y_speed;
	}
	
	other.x += max(other.x_speed, 32);
	other.y += max(other.y_speed, 32);
}

/*
x_speed = (x_speed + other.x_speed*(other.size/size))*.9;
other.x_speed = (other.x_speed + temp_xspd*(size/other.size))*.9;
y_speed = (y_speed + other.y_speed*(other.size/size))*.9;
other.y_speed = (other.y_speed + temp_yspd*(size/other.size))*.9;
*/

if (flash_alpha = 0 or (rammer and !rammer_cooldown)) and !cloaking_active {
	if !rammer or rammer_cooldown {
		if hull_health > 0 {
			if hull_health >= 1 {
				hull_health -= 1;
			} else {
				hp -= (1 - hull_health);
				hull_health = 0;
			}
		} else if hp >= 1 {
			hp -= 1;
		} else hp = 0;
		
		if hp = 1 {
			audio_play_sound_at(sfx_lowhealth, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 2);
			audio_play_sound_at(sfx_lowhealth, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
			audio_play_sound_at(sfx_lowhealth, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		}
	}
	if rammer and rammer_cooldown = 0 {
		if global.cheats = false && global.steam_api = true {
			steam_set_stat_int("enemies_rammed", steam_get_stat_int("enemies_rammed") + 1);
		}
		
		rammer_cooldown = 9;
		alarm_set(9, rammer_cooldown_speed*2);
	}
	
	if global.cheats = false && global.steam_api = true {
		steam_set_stat_int("total_hitby", steam_get_stat_int("total_hitby") + 1);
		if other.enemy_type ="basic" {
			if hp = 0 steam_set_stat_int("killedby_basic", steam_get_stat_int("killedby_basic") + 1);
			steam_set_stat_int("hitby_basic", steam_get_stat_int("hitby_basic") + 1);
		} else if other.enemy_type ="suicider" {
			if hp = 0 steam_set_stat_int("killedby_suicider", steam_get_stat_int("killedby_suicider") + 1);
			steam_set_stat_int("hitby_suicider", steam_get_stat_int("hitby_suicider") + 1);
		} else if other.enemy_type ="marauder" {
			if hp = 0 steam_set_stat_int("killedby_marauder", steam_get_stat_int("killedby_marauder") + 1);
			steam_set_stat_int("hitby_marauder", steam_get_stat_int("hitby_marauder") + 1);
		} else if other.enemy_type ="ion" {
			if hp = 0 steam_set_stat_int("killedby_ion", steam_get_stat_int("killedby_ion") + 1);
			steam_set_stat_int("hitby_ion", steam_get_stat_int("hitby_ion") + 1);
		} else if other.enemy_type ="bomber" {
			if hp = 0 steam_set_stat_int("killedby_bomber", steam_get_stat_int("killedby_bomber") + 1);
			steam_set_stat_int("hitby_bomber", steam_get_stat_int("hitby_bomber") + 1);
		} else if other.enemy_type ="rusher" {
			if hp = 0 steam_set_stat_int("killedby_rusher", steam_get_stat_int("killedby_rusher") + 1);
			steam_set_stat_int("hitby_rusher", steam_get_stat_int("hitby_rusher") + 1);
		} else if other.enemy_type ="sniper" {
			if hp = 0 steam_set_stat_int("killedby_ranger", steam_get_stat_int("killedby_ranger") + 1);
			steam_set_stat_int("hitby_ranger", steam_get_stat_int("hitby_ranger") + 1);
		} else if other.enemy_type ="gunship" {
			if hp = 0 steam_set_stat_int("killedby_gunship", steam_get_stat_int("killedby_gunship") + 1);
			steam_set_stat_int("hitby_gunship", steam_get_stat_int("hitby_gunship") + 1);
		} else if other.enemy_type ="shotgunner" {
			if hp = 0 steam_set_stat_int("killedby_shotgunner", steam_get_stat_int("killedby_shotgunner") + 1);
			steam_set_stat_int("hitby_shotgunner", steam_get_stat_int("hitby_shotgunner") + 1);
		} else if other.enemy_type ="destroyer" {
			if hp = 0 steam_set_stat_int("killedby_destroyer", steam_get_stat_int("killedby_destroyer") + 1);
			steam_set_stat_int("hitby_destroyer", steam_get_stat_int("hitby_destroyer") + 1);
		} else if other.enemy_type ="swarmer" {
			if hp = 0 steam_set_stat_int("killedby_swarmer", steam_get_stat_int("killedby_swarmer") + 1);
			steam_set_stat_int("hitby_swarmer", steam_get_stat_int("hitby_swarmer") + 1);
		} else if other.enemy_type ="heavy_cruiser" {
			if hp = 0 steam_set_stat_int("killedby_heavy_cruiser", steam_get_stat_int("killedby_heavy_cruiser") + 1);
			steam_set_stat_int("hitby_heavy_cruiser", steam_get_stat_int("hitby_heavy_cruiser") + 1);
		} else if other.enemy_type ="battlecruiser" {
			if hp = 0 steam_set_stat_int("killedby_battlecruiser", steam_get_stat_int("killedby_battlecruiser") + 1);
			steam_set_stat_int("hitby_battlecruiser", steam_get_stat_int("hitby_battlecruiser") + 1);
		} else if other.enemy_type ="turret_large" {
			if hp = 0 steam_set_stat_int("killedby_turret_large", steam_get_stat_int("killedby_turret_large") + 1);
			steam_set_stat_int("hitby_turret_large", steam_get_stat_int("hitby_turret_large") + 1);
		} else if other.enemy_type ="turret_laser" {
			if hp = 0 steam_set_stat_int("killedby_turret_laser", steam_get_stat_int("killedby_turret_laser") + 1);
			steam_set_stat_int("hitby_turret_laser", steam_get_stat_int("hitby_turret_laser") + 1);
		} else if other.enemy_type ="turret_missile" {
			if hp = 0 steam_set_stat_int("killedby_turret_missile", steam_get_stat_int("killedby_turret_missile") + 1);
			steam_set_stat_int("hitby_turret_missile", steam_get_stat_int("hitby_turret_missile") + 1);
		} else if other.enemy_type ="turret_ion" {
			if hp = 0 steam_set_stat_int("killedby_turret_ion", steam_get_stat_int("killedby_turret_ion") + 1);
			steam_set_stat_int("hitby_turret_ion", steam_get_stat_int("hitby_turret_ion") + 1);
		}
	}
	
	var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
	audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	
	flash_alpha = 1;
	part_particles_create(global.particle_sys, x, y, global.pt_player, 30);

	with other {
		if !melee_immune {
			part_particles_create(global.particle_sys, other.x, other.y, enemy_type_particle, 3);
	
			_x = other.x - x;
			_y = other.y - y;
	
			var _a = image_angle * pi / 180;
			damage_y = _y*cos(_a) + _x*sin(_a);
			damage_x = _x*cos(_a) - _y*sin(_a);
	
			hit = true;
			hp -= 1;
		
			var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
			audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
			audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
			audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		
			//shader
			flash_alpha = 1;
		}
	}
}