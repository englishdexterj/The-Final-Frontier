if levelup_menu = true {
	if !gamepad_is_connected(0) {
		var ud = 0;
		var lr = 0;
		var sel = false;
	} else {
		if gamepad_button_check_pressed(0, gp_padl) {
			var lr = 1;
			var ud = 0;
		} else if gamepad_button_check_pressed(0, gp_padr) {
			var lr = -1;
			var ud = 0;
		} else if gamepad_button_check_pressed(0, gp_padu) {
			var ud = 1;
			var lr = 0;
		} else if gamepad_button_check_pressed(0, gp_padd) {
			var ud = -1;
			var lr = 0;
		} else {
			var ud = -gamepad_axis_value(0, gp_axislv) - gamepad_axis_value(0, gp_axisrv);
			var lr = -gamepad_axis_value(0, gp_axislh) - gamepad_axis_value(0, gp_axisrh);
		}
		if gamepad_button_check_pressed(0, gp_face1) var sel = true;
		else var sel = false
	}
	if (keyboard_check_pressed(global.key[ctrl.forward]) or ud > 0.9) && selected - 9 >= 0 {
		if upgrade[selected - 9, up.name] != ""
		&& (upgrade[selected - 9, up.req1] = -4 or upgrade[upgrade[selected - 9, up.req1], up.active] >= 1)
		&& (upgrade[selected - 9, up.req2] = -4 or upgrade[upgrade[selected - 9, up.req2], up.active] >= 1) {
			selected -= 9;
		}
	} else if (keyboard_check_pressed(global.key[ctrl.backward]) or ud < -0.9) && selected + 9 <= 80 {
		if upgrade[selected + 9, up.name] != ""
		&& (upgrade[selected + 9, up.req1] = -4 or upgrade[upgrade[selected + 9, up.req1], up.active] >= 1)
		&& (upgrade[selected + 9, up.req2] = -4 or upgrade[upgrade[selected + 9, up.req2], up.active] >= 1) {
			selected += 9;
		}
	} else if (keyboard_check_pressed(global.key[ctrl.right]) or lr < -0.9) && selected + 1 <= 80 {
		if upgrade[selected + 1, up.name] != ""
		&& (upgrade[selected + 1, up.req1] = -4 or upgrade[upgrade[selected + 1, up.req1], up.active] >= 1)
		&& (upgrade[selected + 1, up.req2] = -4 or upgrade[upgrade[selected + 1, up.req2], up.active] >= 1) {
			selected += 1;
		}
	} else if (keyboard_check_pressed(global.key[ctrl.left]) or lr > 0.9) && selected - 1 >= 0 {
		if upgrade[selected - 1, up.name] != ""
		&& (upgrade[selected - 1, up.req1] = -4 or upgrade[upgrade[selected - 1, up.req1], up.active] >= 1)
		&& (upgrade[selected - 1, up.req2] = -4 or upgrade[upgrade[selected - 1, up.req2], up.active] >= 1) {
			selected -= 1;
		}
	} else if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.key[ctrl.select]) or sel {
		if upgrade[selected, up.name] != "" && upgrade[selected, up.active] < upgrade[selected, up.active_max]
		&& (upgrade[selected, up.req1] = -4 or upgrade[upgrade[selected, up.req1], up.active] >= 1)
		&& (upgrade[selected, up.req2] = -4 or upgrade[upgrade[selected, up.req2], up.active] >= 1) {
			
			upgrade[selected, up.active] += 1;
			
			#region play sound and activate all
			if global.cheats = false and global.steam_api = true {
				var _stats = true;
				steam_set_stat_int("total_upgrades", steam_get_stat_int("total_upgrades") + 1);
			} else var _stats = false;
			
			var _s = choose(sfx_sounds_powerup2);
			var snd = audio_play_sound(_s, 10, false);
			audio_sound_gain(snd, 1, 0);
			
			levelup_menu = false;
			instance_activate_all();
			#endregion
			
			#region activate upgrade
			if upgrade[selected, up.name] = "Speed" {
				if _stats steam_set_stat_int("upgrades_speed", steam_get_stat_int("upgrades_speed") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":30";
				o_player.max_speed += 2.5;
			} else if upgrade[selected, up.name] = "Turn Speed" {
				if _stats steam_set_stat_int("upgrades_turn_speed", steam_get_stat_int("upgrades_turn_speed") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":50";
				o_player.max_turn_speed += 1;
				o_player.max_turn_accel += 0.075
			} else if upgrade[selected, up.name] = "Acceleration" {
				if _stats steam_set_stat_int("upgrades_acceleration", steam_get_stat_int("upgrades_acceleration") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":78";
				o_player.max_acceleration += 0.2;
				o_player.accel_speed += 0.25;
			} else if upgrade[selected, up.name] = "Aerodynamics" { //unused
				if _stats steam_set_stat_int("upgrades_aerodynamics", steam_get_stat_int("upgrades_aerodynamics") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":0";
				o_player.ship_drag -= 0.02;
			} else if upgrade[selected, up.name] = "Rammer" {
				if _stats steam_set_stat_int("upgrades_rammer", steam_get_stat_int("upgrades_rammer") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":34";
				o_player.rammer = true;
			} else if upgrade[selected, up.name] = "Drone Speed" { //unused
				if _stats steam_set_stat_int("upgrades_drone_speed", steam_get_stat_int("upgrades_drone_speed") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":0";
				
			} else if upgrade[selected, up.name] = "Bullet Speed" {
				if _stats steam_set_stat_int("upgrades_hull_speed", steam_get_stat_int("upgrades_hull_speed") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":26";
				o_player.bullet_speed += 4;
			} else if upgrade[selected, up.name] = "Shooting Speed" {
				if _stats steam_set_stat_int("upgrades_shooting_speed", steam_get_stat_int("upgrades_shooting_speed") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":32";
				o_player.bullet_reload -= 1;
			} else if upgrade[selected, up.name] = "Health" {
				if _stats steam_set_stat_int("upgrades_health", steam_get_stat_int("upgrades_health") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":96";
				o_player.hp += 1;
				o_player.max_hp += 1;
				o_player.current_max_hp += 1;
			} else if upgrade[selected, up.name] = "Healer Nanites" {
				if _stats steam_set_stat_int("upgrades_healer_nanites", steam_get_stat_int("upgrades_healer_nanites") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":98";
				o_player.healers += 1;
			} else if upgrade[selected, up.name] = "Hull Upgrade" {
				if _stats steam_set_stat_int("upgrades_hull_upgrade", steam_get_stat_int("upgrades_hull_upgrade") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":28";
				o_player.hull_level += 1;
				o_player.hull_health += 1;
				if o_player.hp + o_player.hull_level > o_player.max_hp {
					o_player.hp = o_player.max_hp - o_player.hull_level;
				}
			} else if upgrade[selected, up.name] = "Shield" {
				if _stats steam_set_stat_int("upgrades_shield", steam_get_stat_int("upgrades_shield") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":22";
				o_player.has_shield = true;
				var _s = instance_create_layer(x, y, "Instances_Top", o_shield);
				_s.depth = -10;
				_s.shield_size = o_player.shield_size;
				_s.max_hit_times = o_player.shield_hits;
				_s.pt = o_player.id;
				_s.enemy = false;
				_s.shield_regen = 0.00125;
			} else if upgrade[selected, up.name] = "Shield Strength" {
				if _stats steam_set_stat_int("upgrades_shield_strength", steam_get_stat_int("upgrades_shield_strength") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":70";
				with o_shield {
					if enemy = false {
						max_hit_times += o_player.shield_hits;
						hit_reduce = 0;
						image_xscale = 1;
						image_yscale = 1;
					}
				}
			} else if upgrade[selected, up.name] = "Shield Regen" {
				if _stats steam_set_stat_int("upgrades_shield_regen", steam_get_stat_int("upgrades_shield_regen") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":72";
				with o_shield {
					if enemy = false {
						shield_regen += 0.000625;
						hit_reduce = 0;
						image_xscale = 1;
						image_yscale = 1;
					}
				}
			} else if upgrade[selected, up.name] = "Drone Ship" {
				if _stats steam_set_stat_int("upgrades_drone_ship", steam_get_stat_int("upgrades_drone_ship") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":24";
				o_player.drone_ship = true;
			} else if upgrade[selected, up.name] = "Drone AI" { //unused
				if _stats steam_set_stat_int("upgrades_drone_ai", steam_get_stat_int("upgrades_drone_ai") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":0";
				o_player.drone_ai += 1;
			} else if upgrade[selected, up.name] = "Drone Hardware" {
				if _stats steam_set_stat_int("upgrades_drone_hardware", steam_get_stat_int("upgrades_drone_hardware") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":40";
				o_player.drone_hardware += 1;
			} else if upgrade[selected, up.name] = "Drone Construction" {
				if _stats steam_set_stat_int("upgrades_drone_construction", steam_get_stat_int("upgrades_drone_construction") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":58";
				o_player.drone_cooldown_speed += 0.05;
			} else if upgrade[selected, up.name] = "Max Drones" {
				if _stats steam_set_stat_int("upgrades_max_drones", steam_get_stat_int("upgrades_max_drones") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":82";
				o_player.drones_max++;
			} else if upgrade[selected, up.name] = "Single Shot" {
				if _stats steam_set_stat_int("upgrades_single_shot", steam_get_stat_int("upgrades_single_shot") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":80";
				o_player.weapon_bullets = 1;
			} else if upgrade[selected, up.name] = "Dual Shot" {
				if _stats steam_set_stat_int("upgrades_dual_shot", steam_get_stat_int("upgrades_dual_shot") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":6";
				o_player.weapon_bullets = 2;
			} else if upgrade[selected, up.name] = "Triple Shot" {
				if _stats steam_set_stat_int("upgrades_triple_shot", steam_get_stat_int("upgrades_triple_shot") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":8";
				o_player.weapon_bullets = 3;
			} else if upgrade[selected, up.name] = "Quad Shot" {
				if _stats steam_set_stat_int("upgrades_quad_shot", steam_get_stat_int("upgrades_quad_shot") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":10";
				o_player.weapon_bullets = 4;
			} else if upgrade[selected, up.name] = "Gun Cooldown" {
				if _stats steam_set_stat_int("upgrades_gun_cooldown", steam_get_stat_int("upgrades_gun_cooldown") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":76";
				o_player.cooldown_speed += 0.05;
			} else if upgrade[selected, up.name] = "Missiles" {
				if _stats steam_set_stat_int("upgrades_missiles", steam_get_stat_int("upgrades_missiles") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":4";
				o_player.weapon_missiles = 1;
			} else if upgrade[selected, up.name] = "Dual Missiles" {
				if _stats steam_set_stat_int("upgrades_dual_missiles", steam_get_stat_int("upgrades_dual_missiles") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":12";
				o_player.weapon_missiles = 2;
			} else if upgrade[selected, up.name] = "Triple Missiles" {
				if _stats steam_set_stat_int("upgrades_triple_missiles", steam_get_stat_int("upgrades_triple_missiles") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":14";
				o_player.weapon_missiles = 3;
			} else if upgrade[selected, up.name] = "Missile Reload" {
				if _stats steam_set_stat_int("upgrades_missile_reload", steam_get_stat_int("upgrades_missile_reload") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":74";
				o_player.missile_cooldown_speed += 0.05;
			} else if upgrade[selected, up.name] = "Plated Missiles" {
				if _stats steam_set_stat_int("upgrades_plated_missiles", steam_get_stat_int("upgrades_plated_missiles") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":54";
				o_player.plated_missile = true;
			} else if upgrade[selected, up.name] = "Missile Tracking" {
				if _stats steam_set_stat_int("upgrades_missile_tracking", steam_get_stat_int("upgrades_missile_tracking") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":56";
				o_player.missile_turn_speed += 1;
			} else if upgrade[selected, up.name] = "Flak" {
				if _stats steam_set_stat_int("upgrades_flak", steam_get_stat_int("upgrades_flak") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":38";
				o_player.flak = true;
			} else if upgrade[selected, up.name] = "Flak Speed" {
				if _stats steam_set_stat_int("upgrades_flak_speed", steam_get_stat_int("upgrades_flak_speed") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":36";
				o_player.flak_speed -= 1;
			} else if upgrade[selected, up.name] = "Laser" {
				if _stats steam_set_stat_int("upgrades_laser", steam_get_stat_int("upgrades_laser") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":20";
				o_player.weapon_lasers = 1;
			} else if upgrade[selected, up.name] = "Dual Laser" { //
				if _stats steam_set_stat_int("upgrades_dual_laser", steam_get_stat_int("upgrades_dual_laser") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":0";
				o_player.weapon_lasers = 2;
			} else if upgrade[selected, up.name] = "Triple Laser" { //
				if _stats steam_set_stat_int("upgrades_triple_laser", steam_get_stat_int("upgrades_triple_laser") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":0";
				o_player.weapon_lasers = 3;
			} else if upgrade[selected, up.name] = "Quad Laser" { //
				if _stats steam_set_stat_int("upgrades_quad_laser", steam_get_stat_int("upgrades_quad_laser") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":0";
				o_player.weapon_lasers = 4;
			} else if upgrade[selected, up.name] = "Laser Cooldown" {
				if _stats steam_set_stat_int("upgrades_laser_cooldown", steam_get_stat_int("upgrades_laser_cooldown") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":0";
				o_player.laser_cooldown_speed += 0.05;
			} else if upgrade[selected, up.name] = "Missile Defense" {
				if _stats steam_set_stat_int("upgrades_missile_defense", steam_get_stat_int("upgrades_missile_defense") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":48";
				o_player.missile_defense = true;
			} else if upgrade[selected, up.name] = "Flank Laser" {
				if _stats steam_set_stat_int("upgrades_flank_laser", steam_get_stat_int("upgrades_flank_laser") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":0";
				o_player.flank_laser = true;
			} else if upgrade[selected, up.name] = "Ion Cannon" {
				if _stats steam_set_stat_int("upgrades_ion_cannon", steam_get_stat_int("upgrades_ion_cannon") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":60";
				o_player.weapon_ion = 1;
			} else if upgrade[selected, up.name] = "Ion Recharge" {
				if _stats steam_set_stat_int("upgrades_ion_recharge", steam_get_stat_int("upgrades_ion_recharge") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":62";
				o_player.ion_cooldown_speed += 0.05;
			} else if upgrade[selected, up.name] = "Cloaking Device" {
				if _stats steam_set_stat_int("upgrades_cloaking_device", steam_get_stat_int("upgrades_cloaking_device") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":64";
				o_player.cloaking = true;
			} else if upgrade[selected, up.name] = "Cloak Length" {
				if _stats steam_set_stat_int("upgrades_cloak_length", steam_get_stat_int("upgrades_cloak_length") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":68";
				o_player.cloaking_length += 7;
			} else if upgrade[selected, up.name] = "Cloak Recharge" {
				if _stats steam_set_stat_int("upgrades_cloak_recharge", steam_get_stat_int("upgrades_cloak_recharge") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":66";
				o_player.cloaking_recharge -= 30;
			} else if upgrade[selected, up.name] = "Gun Turret" {
				if _stats steam_set_stat_int("upgrades_gun_turret", steam_get_stat_int("upgrades_gun_turret") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":88";
				if upgrade[selected, up.active] = 1 {
					var _t = instance_create_layer(x, y, "Instances_Top", o_player_turret_large);
					with _t {
						pt = o_player.id;
						depth = pt.depth - 3;
						_x = -20;
						_y = 10;
						_x *= global.scale;
						_y *= global.scale;
					}
				} else if upgrade[selected, up.active] = 2 {
					var _t = instance_create_layer(x, y, "Instances_Top", o_player_turret_large);
					with _t {
						pt = o_player.id;
						depth = pt.depth - 3;
						_x = -20;
						_y = -10;
						_x *= global.scale;
						_y *= global.scale;
						cooldown_speed += other.turret_cooldown_speed;
						max_turn_speed += other.turret_turn_speed;
					}
				}
			} else if upgrade[selected, up.name] = "Missile Turret" {
				if _stats steam_set_stat_int("upgrades_missile_turret", steam_get_stat_int("upgrades_missile_turret") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":82";
				var _t = instance_create_layer(x, y, "Instances_Top", o_player_turret_missile);
				with _t {
					pt = o_player.id;
					depth = pt.depth - 3;
					_x = -30;
					_y = 0;
					_x *= global.scale;
					_y *= global.scale;
					cooldown_speed += other.missile_cooldown_speed;
					max_turn_speed += other.missile_turn_speed;
				}
			} else if upgrade[selected, up.name] = "Turret Cooldown" {
				if _stats steam_set_stat_int("upgrades_turret_cooldown", steam_get_stat_int("upgrades_turret_cooldown") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":90";
				with o_player_turret_large {
					if object_index = o_player_turret_large cooldown_speed += 0.05;
				}
				turret_cooldown_speed += 0.05;
			} else if upgrade[selected, up.name] = "Missile Turret Cooldown" {
				if _stats steam_set_stat_int("upgrades_missile_turret_cooldown", steam_get_stat_int("upgrades_missile_turret_cooldown") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":84";
				with o_player_turret_missile {
					cooldown_speed += 0.05;
				}
				missile_cooldown_speed += 0.05;
			} else if upgrade[selected, up.name] = "Turret Turn Speed" {
				if _stats steam_set_stat_int("upgrades_turret_turn_speed", steam_get_stat_int("upgrades_turret_turn_speed") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":92";
				with o_player_turret_large {
					if object_index = o_player_turret_large max_turn_speed += 2;
				}
				turret_turn_speed += 2;
			} else if upgrade[selected, up.name] = "Missile Turret Turn Speed" {
				if _stats steam_set_stat_int("upgrades_missile_turret_turn_speed", steam_get_stat_int("upgrades_missile_turret_turn_speed") + 1);
				o_player.upgrade_string = o_player.upgrade_string + ":86";
				with o_player_turret_missile {
					max_turn_speed += 2;
				}
				missile_turn_speed += 2;
			} else {
				show_debug_message("ERR: Cannot find upgrade type - o_upgrade_tree step");
			}
			#endregion
		}
	}
}
