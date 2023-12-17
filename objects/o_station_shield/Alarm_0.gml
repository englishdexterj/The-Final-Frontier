/// @description create shield
if shield_size = 0 {
	var _s = instance_create_layer(x+293*global.scale, y+168*global.scale, "Instances_Top", o_shield_station_small);
	//_s.image_index = 3;
	//_s.sprite_index = s_shield_station_small;
} else if shield_size = 1 {
	var _s = instance_create_layer(x+293*global.scale, y+168*global.scale, "Instances_Top", o_shield_station_medium);
	//_s.image_index = 4;
	//_s.sprite_index = s_shield_station_medium;
} else if shield_size = 2 {
	var _s = instance_create_layer(x+293*global.scale, y+168*global.scale, "Instances_Top", o_shield_station);
	//_s.image_index = 5;
	//_s.sprite_index = s_shield_station;
}
_s.shield_size = shield_size;
_s.shield_strength = 20;
_s.pt = id;
_s.enemy = true;
_s.shield_regen = 0.0004;