function sc_shoot_lay_mine(ang_diff) {
	//shoot
	//if can_shoot && cooldown = false && heat = 0 && ang_diff < 12 && ang_diff > -12 {
	if can_shoot && cooldown = false && heat = 0 {
		if movable {
			x_speed += lengthdir_x(-.2*global.spd, direction);
			y_speed += lengthdir_y(-.2*global.spd, direction);
		}
	
		cooldown = true;
		heat += 6;
		alarm_set(0, 150);
		with instance_create_layer(x, y, "Instances_Upper_Middle", o_projectile_mine) {
			deploy = 120;
			deploy_move = true;
			parent = other.id;
			idle = true;
			x_start = -4;
			y_start = 0;
			
			enemy_type = other.enemy_type;
			depth = other.depth + 1;
			enemy = other.enemy;
		}
	}
}