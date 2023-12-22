/// @description upgrades
if variable_instance_exists(o_controller, "enemy_speed_boost") {
	max_speed += o_controller.enemy_speed_boost*5;
}
if variable_instance_exists(o_controller, "enemy_plated_boost") {
	if weapon_type = "missile" and o_controller.enemy_plated_boost plated_missile = true;
}
if variable_instance_exists(o_controller, "enemy_health_boost") {
	hp += o_controller.enemy_health_boost;
}
if variable_instance_exists(o_controller, "enemy_cooldown_boost") {
	cooldown_speed += o_controller.enemy_cooldown_boost*0.1;
}
if variable_instance_exists(o_controller, "enemy_flak_boost") {
	if o_controller.enemy_flak_boost flak = true;
}

if variable_instance_exists(id, "upgrades") {
	if upgrades = 2 {
		image_index = 2;
		max_speed *= 1.3;
		if dual_bullet <= 2 && can_shoot dual_bullet += 2;
		if weapon_type = "missile" plated_missile = true;
		cooldown_speed += 0.2;
		flak = true;
		turn_acc = 1.25;
	
		if can_have_shield and has_shield {
			var _s = instance_create_layer(x, y, "Instances_Top", o_shield);
			_s.depth = _s.depth - 10;
			_s.shield_size = shield_size;
			_s.max_hit_times = shield_hits;
			_s.pt = id;
			_s.enemy = true;
			_s.shield_regen = 0.01;
		}
		if object_index = o_enemy_suicider move_smart = true;
	} else if upgrades = 1 {
		image_index = 1;
		max_speed *= 1.15;
		if dual_bullet <= 2 && can_shoot dual_bullet += 1;
		cooldown_speed += 0.1;
		flak = true;
		turn_acc = 1;
	
		if can_have_shield and has_shield {
			var _s = instance_create_layer(x, y, "Instances_Top", o_shield);
			_s.depth = _s.depth - 10;
			_s.shield_size = shield_size;
			_s.max_hit_times = shield_hits;
			_s.pt = id;
			_s.enemy = true;
			_s.shield_regen = 0.005;
		}
	
		if object_index = o_enemy_suicider move_smart = true;
	} else {
		if can_have_shield and has_shield {
			var _s = instance_create_layer(x, y, "Instances_Top", o_shield);
			_s.depth = _s.depth - 10;
			_s.shield_size = shield_size;
			_s.max_hit_times = shield_hits;
			_s.pt = id;
			_s.enemy = true;
			_s.shield_regen = 0.005;
		}
	}
} else {
	if can_have_shield and has_shield {
		var _s = instance_create_layer(x, y, "Instances_Top", o_shield);
		_s.depth = _s.depth - 10;
		_s.shield_size = shield_size;
		_s.max_hit_times = shield_hits;
		_s.pt = id;
		_s.enemy = true;
		_s.shield_regen = 0.005;
	}
}
