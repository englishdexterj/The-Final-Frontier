if variable_global_exists("spawn_level") var rand = clamp((global.spawn_level-70) / 10, 0, 5);
else var rand = irandom_range(0, 3);

for (var i = 0; i < 6 + upgrades*2 + irandom(rand); i++) {
	_enemy[i] = instance_create_layer(x, y, "Instances_Top", o_enemy_swarmer);
	_enemy[i].following = id;
	_enemy[i].follow = true;
	_enemy[i].follow_position = i+1;
	_enemy[i].upgrades = upgrades;
	_enemy[i].has_shield = has_shield;
}
