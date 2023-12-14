image_xscale *= global.scale;
image_yscale = image_xscale;

image_index = global.color_modifier[global.selected_character];

upgrade_string = "";

weapon_bullets = 0;
weapon_missiles = 0;
weapon_lasers = 0;
weapon_ion = 0;

hull_health = 0;
hull_level = 0;
hull_repair_speed = 0.00125;

bullet_speed = 10;
bullet_reload = 5;

missile_turn_speed = 1;

drone_ship = false;
drone_ai = 0;
drones_max = 1;
drones = 0;
drone_hardware = 0;

healers = 0;
healer_repair_speed = 0.00125;

flank_laser = false;

forward = 0;
turn = 0;

disabled = false;

x_speed = 0;
y_speed = 0;
spd = 0;
turn_acceleration = 0;
turn_speed = 0;
acceleration = 0;
accel_speed = 1;
max_turn_accel = 0.5;

//gun shoot speed cooldown
cooldown = false;
laser_cooldown = false;
missile_cooldown = false;
ion_cooldown = false;
drone_cooldown = false;
//gun heat
heat = 0;
cooldown_speed = 0.2;
laser_heat = 0;
laser_cooldown_speed = 0.05;
missile_heat = 0;
missile_cooldown_speed = 0.2;
ion_heat = 0;
ion_cooldown_speed = 0.2;
drone_heat = 0;
drone_cooldown_speed = 0.2;
//gun heat reduction
alarm_set(1, 5);
bullet_heat = 1;

rammer = false;
rammer_cooldown = 0;
rammer_cooldown_speed = 48;

missile_defense = false;
missile_flak_heat = 0;
missile_flak_cooldown = false;

//shaders
flash_alpha = 0;
flash_color = c_white;

cloaking = false;
cloaking_active = false;
cloaking_cooldown = 0;
cloaking_recharge = 180;
cloaking_length = 14;

//upgrades
flak_heat = 0;
flak_cooldown_speed = 0.2;
flak_cooldown = false;
alarm_set(3, 5);
//

if global.selected_character = 0 { //fighter
	sprite_index = s_player_fighter;
	hp = 5;
	max_speed = 20;
	weapon_bullets = 1;
} else if global.selected_character = 1 { //bomber
	sprite_index = s_player_bomber;
	hp = 8;
	max_speed = 17;
	weapon_missiles = 1;
	missile_cooldown_speed = 0.3;
} else if global.selected_character = 2 { //summoner
	sprite_index = s_player_summoner;
	hp = 3;
	max_speed = 22;
	drone_ship = true;
	drones_max = 5;
	drone_cooldown_speed = 0.3;
} else if global.selected_character = 3 { //healer
	sprite_index = s_player_healer;
	hp = 5;
	hull_level += 1;
	hull_health += 1;
	max_speed = 18;
	weapon_bullets = 1;
} else if global.selected_character = 4 { //basher
	sprite_index = s_player_basher;
	hp = 6;
	max_speed = 25;
	rammer = true;
	rammer_cooldown_speed = 4;
	has_shield = true;
	var _s = instance_create_layer(x, y, "Instances", o_shield);
	_s.depth = -10;
	_s.shield_size = o_player.shield_size;
	_s.max_hit_times = o_player.shield_hits;
	_s.pt = o_player.id;
	_s.enemy = false;
	_s.shield_regen = 0.00125;
}

switch global.color_modifier[global.selected_character] {
	case colors.blue:
		break;
	case colors.green:
		hp += 1;
		break;
	case colors.orange:
		cooldown_speed *= 1.1;
		laser_cooldown_speed *= 1.1;
		missile_cooldown_speed *= 1.1;
		ion_cooldown_speed *= 1.1;
		break;
	case colors.purple:
		global.xp_gain = 1.05;
		break;
	case colors.yellow:
		max_speed *= 1.2;
		break;
}

if hull_level > 0 hp = clamp((hp + hull_level) - o_controller.health_debuff, 0, hp);
else hp = clamp(hp - o_controller.health_debuff, 1, hp);
max_hp = hp;
current_max_hp = max_hp;
