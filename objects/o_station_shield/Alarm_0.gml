/// @description create shield
if shield_size = 0 {
	var _s = instance_create_layer(x+293*global.scale, y+168*global.scale, "Instances_Top", o_shield_station_small);
	_s.shield_strength = 15;
} else if shield_size = 1 {
	var _s = instance_create_layer(x+293*global.scale, y+168*global.scale, "Instances_Top", o_shield_station_medium);
	_s.shield_strength = 20;
} else if shield_size = 2 {
	var _s = instance_create_layer(x+293*global.scale, y+168*global.scale, "Instances_Top", o_shield_station);
	_s.shield_strength = 30;
}
_s.shield_size = shield_size;
_s.pt = id;
_s.enemy = true;
_s.shield_regen = 0.0003;