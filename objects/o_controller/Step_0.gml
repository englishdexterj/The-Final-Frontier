if (!instance_exists(o_enemy) or spawn_timer <= 0) && alarm_get(0) = -1 && spawning
	&& (enemy[enemies.heavy_cruiser][3] != global.spawn_level || !instance_exists(o_enemy))
	&& (enemy[enemies.battlecruiser][3] != global.spawn_level || !instance_exists(o_enemy))
	&& (enemy[enemies.destroyer][3] != global.spawn_level || !instance_exists(o_enemy)) {
	alarm_set(0, 60);
	round_intermission = true;
	spawn_timer = 1200 + 15*global.spawn_level;
} else spawn_timer--;

if keyboard_check_pressed(ord("O")) debug = -debug + 1;

if debug = 1 {
if keyboard_check_pressed(vk_add) spawn = -spawn + 1;
if keyboard_check_pressed(vk_subtract) {
	spawn_level += 1;
	if spawn_level > 2 spawn_level = 0;
}
if keyboard_check_pressed(ord("R")) {
	alarm_set(1, 1);
}

if keyboard_check_pressed(ord("P")) {
	if global.debug_pathing global.debug_pathing = false;
	else global.debug_pathing = true;
}

if keyboard_check_released(vk_numpad0) {
	o_player.hp += 5;
	global.cheats = true;
}
if spawn = 0 {
	if keyboard_check_released(vk_numpad1) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_basic);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}
	if keyboard_check_released(vk_numpad2) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_suicider);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}
	if keyboard_check_released(vk_numpad3) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_ion);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}
	if keyboard_check_released(vk_numpad4) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_bomber);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}
	if keyboard_check_released(vk_numpad5) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_gunship);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}
	if keyboard_check_released(vk_numpad6) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_destroyer);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}

	if keyboard_check_released(vk_numpad7) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_heavy_cruiser);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}

	if keyboard_check_released(vk_numpad8) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_battlecruiser);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}

	if keyboard_check_released(vk_numpad9) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_marauder);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}
} else if spawn = 1 {
	if keyboard_check_released(vk_numpad1) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_sniper);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}
	if keyboard_check_released(vk_numpad2) {
		var _e = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_shotgunner);
		_e.upgrades = spawn_level;
		global.cheats = true;
	}
	if keyboard_check_released(vk_numpad3) {
		var _s = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_swarmer_controller);
		_s.upgrades = spawn_level;
		global.cheats = true;
	}
	if keyboard_check_released(vk_numpad4) {
		var _s = instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy_rusher);
		_s.upgrades = spawn_level;
		global.cheats = true;
	}
}

if keyboard_check_released(ord("P")) {
	global.spawn_level += 12;
	global.cheats = true;
}

if keyboard_check_released(ord("L")) {
	global.pts += 1000;
	global.cheats = true;
}
}