if variable_global_exists("level") var rand = global.level / 5
else var rand = irandom_range(60, 100);

for (var i = 0; i < 6 + irandom(rand / 5); i++) {
	_enemy[i] = instance_create_layer(x, y, "Instances_Top", o_enemy_swarmer);
	_enemy[i].following = id;
	_enemy[i].follow = true;
	_enemy[i].follow_position = i+1;
	_enemy[i].upgrades = upgrades;
	_enemy[i].has_shield = has_shield;
}
