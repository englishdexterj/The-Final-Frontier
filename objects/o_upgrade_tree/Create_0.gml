enum up {
	active,
	name,
	sprite,
	req1,
	req2,
	active_max
}

enum upgrades_list {
	spd,
	turn_speed,
	acceleration,
	aerodynamics,
	rammer,
	drone_speed,
	bullet_speed,
	shooting_speed,
	hp,
	healer_nanites,
	hull_upgrade,
	shield,
	shield_strength,
	shield_regen,
	drone_ship,
	drone_ai,
	drone_hardware,
	drone_construction,
	max_drones,
	single_shot,
	dual_shot,
	triple_shot,
	quad_shot,
	gun_cooldown,
	missiles,
	dual_missiles,
	triple_missiles,
	missile_reload,
	plated_missiles,
	missile_tracking,
	flak,
	flak_speed,
	laser,
	dual_laser,
	triple_laser,
	quad_laser,
	laser_cooldown,
	missile_defense,
	flank_laser,
	ion_cannon,
	ion_recharge,
	cloaking_device,
	cloak_length,
	cloak_recharge,
	gun_turret,
	missile_turret,
	turret_cooldown,
	missile_turret_cooldown,
	turret_turn_speed,
	missile_turret_turn_speed
}

for (var i = 0; i < 9; i++) {
	for (var j = 0; j < 9; j++) {
		upgrade[i*9 + j, up.active] = 0;
		upgrade[i*9 + j, up.sprite] = 0;
	}
}

selected = 40;
levelup_menu = false;
upgrade[40, up.active] = 1;

turret_cooldown_speed = 0;
missile_cooldown_speed = 0;
turret_turn_speed = 0;
missile_turn_speed = 0;

sc_initiate_tech_trees(); //initiate tech trees

xx = display_get_gui_width();
yy = display_get_gui_height();

scale = 8;
