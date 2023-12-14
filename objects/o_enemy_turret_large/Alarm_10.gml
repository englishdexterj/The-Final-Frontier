/// @description shield if parent has shield
if pt.has_shield {
	var _s = instance_create_layer(x, y, "Instances", o_shield);
	_s.depth = -10;
	_s.shield_size = pt.shield_size;
	_s.max_hit_times = pt.shield_hits;
	_s.pt = id;
	_s.enemy = true;
	_s.shield_regen = 0.005;
}