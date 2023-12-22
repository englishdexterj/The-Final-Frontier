//apply upgrades
alarm_set(10, 1);

if room = game global.active_enemies++;

image_xscale = global.scale;
image_yscale = image_xscale;

max_hp = hp;

if !variable_instance_exists(id, "follow") follow = false;
if !variable_instance_exists(id, "followed") followed = -4;
if !variable_instance_exists(id, "following") following = -4;

disabled = false;

forward = 0;
turn = 0;

x_speed = 0;
y_speed = 0;
acceleration = 0;
turn_acceleration = 0;
turn_speed = 0;

current_spawns = 0;

hurt = false;

//gun shoot speed cooldown
cooldown = false;
//gun heat
heat = irandom_range(4, 10);
//gun heat reduction
alarm_set(1, 10);

spawn_cooldown = false;
spawn_heat = irandom_range(0, 10);
alarm_set(3, 10);

flak_heat = 0;
flak_cooldown = false;
alarm_set(5, 10);

for (var i = 0; i <= 350; i+= 10) {
	col[i/10] = false;
	col_dist[i/10] = 0;
	safety[i/10] = 0;
}
move_direction = -4;

if enemy_type = "basic" {
	sprite_index = s_enemy_basic;
} else if enemy_type = "suicider" {
	sprite_index = s_enemy_suicider;
} else if enemy_type = "ion" {
	sprite_index = s_enemy_ion;
} else if enemy_type = "bomber" {
	sprite_index = s_enemy_bomber;
} else if enemy_type = "sentinel" {
	sprite_index = s_enemy_sentinel;
} else if enemy_type = "rusher" {
	rush = false;
	rushing = 0;
	sprite_index = s_enemy_rusher;
} else if enemy_type = "marauder" {
	sprite_index = s_enemy_marauder;
} else if enemy_type = "sniper" {
	sprite_index = s_enemy_sniper;
} else if enemy_type = "gunship" {
	sprite_index = s_enemy_gunship;
} else if enemy_type = "shotgunner" {
	sprite_index = s_enemy_shotgun;
} else if enemy_type = "destroyer" {
	sprite_index = s_enemy_destroyer;
	var _t1 = instance_create_layer(x, y-17, "Instances_Upper_Middle", o_enemy_turret_laser);
	with _t1 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = -16;
		_y = -17;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t2 = instance_create_layer(x, y+17, "Instances_Upper_Middle", o_enemy_turret_laser);
	with _t2 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = -16;
		_y = 17;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t3 = instance_create_layer(x, y-17, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t3 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = -56;
		_y = -17;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t4 = instance_create_layer(x, y+17, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t4 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = -56;
		_y = 17;
		_x *= global.scale;
		_y *= global.scale;
	}
} else if enemy_type = "swarmer" {
	sprite_index = s_enemy_swarmer;
	alarm_set(8, 1);
} else if enemy_type = "heavy_cruiser" {
	sprite_index = s_enemy_heavy_cruiser;
	var _t1 = instance_create_layer(x, y-17, "Instances_Upper_Middle", o_enemy_turret_laser);
	with _t1 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = -33;
		_y = -18;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t2 = instance_create_layer(x, y+17, "Instances_Upper_Middle", o_enemy_turret_laser);
	with _t2 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = -33;
		_y = 18;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t3 = instance_create_layer(x, y-17, "Instances_Upper_Middle", o_enemy_turret_ion);
	with _t3 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = -86;
		_y = -32;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t4 = instance_create_layer(x, y+17, "Instances_Upper_Middle", o_enemy_turret_ion);
	with _t4 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = -86;
		_y = 32;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t5 = instance_create_layer(x, y-17, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t5 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 43;
		_y = -20;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t6 = instance_create_layer(x, y+17, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t6 {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 43;
		_y = 20;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _r = instance_create_layer(x, y, "Instances_Top", o_enemy_heavy_cruiser_reactor);
	with _r {
		pt = other.id;
		depth = pt.depth - 1;
		_x = -52;
		_y = 42;
		_x *= global.scale;
		_y *= global.scale;
		reactor_number = 1;
		type = "heavy_cruiser";
	}
	var _r = instance_create_layer(x, y, "Instances_Top", o_enemy_heavy_cruiser_reactor);
	with _r {
		pt = other.id;
		depth = pt.depth - 1;
		_x = -52;
		_y = -42;
		_x *= global.scale;
		_y *= global.scale;
		reactor_number = 2;
		type = "heavy_cruiser";
	}
	for (var i = 1; i <= 2; i++) {
		reactor_active[i] = true;
	}
} else if enemy_type = "battlecruiser" {
	sprite_index = s_enemy_battlecruiser;
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11;
		_y = 0;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-222;
		_y = 0;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_ion);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11+16;
		_y = 39;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_ion);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11+16;
		_y = -39;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12;
		_y = 39;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12;
		_y = -39;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11+12+63;
		_y = 38;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11+12+63;
		_y = -38;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11+12+63+66;
		_y = 38;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11+12+63+66;
		_y = -38;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_missile);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12-88;
		_y = 39+22;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_missile);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12-88;
		_y = -39-22;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12-88-82;
		_y = 39+22+28;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12-88-82;
		_y = -39-22-28;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_laser);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12-88-11;
		_y = 39+22-50;
		_x *= global.scale;
		_y *= global.scale;
		max_turn_speed = .3;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_laser);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12-88-11;
		_y = -39-22+50;
		_x *= global.scale;
		_y *= global.scale;
		max_turn_speed = .3;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12-88-82-57;
		_y = 39+22+28-17;
		_x *= global.scale;
		_y *= global.scale;
	}
	var _t = instance_create_layer(x, y, "Instances_Upper_Middle", o_enemy_turret_large);
	with _t {
		pt = other.id;
		depth = pt.depth - 3;
		_x = 11-12-88-82-57;
		_y = -39-22-28+17;
		_x *= global.scale;
		_y *= global.scale;
	}
	
	var _r = instance_create_layer(x, y, "Instances_Top", o_enemy_battlecruiser_reactor);
	with _r {
		pt = other.id;
		depth = pt.depth - 1;
		_x = -149;
		_y = -111;
		_x *= global.scale;
		_y *= global.scale;
		reactor_number = 1;
		type = "battlecruiser";
	}
	var _r = instance_create_layer(x, y, "Instances_Top", o_enemy_battlecruiser_reactor);
	with _r {
		pt = other.id;
		depth = pt.depth - 1;
		_x = -149;
		_y = 111;
		_x *= global.scale;
		_y *= global.scale;
		reactor_number = 2;
		type = "battlecruiser";
	}
	var _r = instance_create_layer(x, y, "Instances_Top", o_enemy_battlecruiser_reactor);
	with _r {
		pt = other.id;
		depth = pt.depth - 1;
		_x = -149+76;
		_y = 111-46;
		_x *= global.scale;
		_y *= global.scale;
		reactor_number = 3;
		type = "battlecruiser";
	}
	var _r = instance_create_layer(x, y, "Instances_Top", o_enemy_battlecruiser_reactor);
	with _r {
		pt = other.id;
		depth = pt.depth - 1;
		_x = -149+76;
		_y = -111+46;
		_x *= global.scale;
		_y *= global.scale;
		reactor_number = 4;
		type = "battlecruiser";
	}
	for (var i = 1; i <= 4; i++) {
		reactor_active[i] = true;
	}
} else {
	show_debug_message("NO SET SPRITE INDEX 'O_ENEMY CREATE'")
	sprite_index = s_enemy_basic;
}

hit = false;
hit_radius = 0;
damage_x = 0;
damage_y = 0;

//shaders
flash_alpha = 0;
flash_color = c_white;
