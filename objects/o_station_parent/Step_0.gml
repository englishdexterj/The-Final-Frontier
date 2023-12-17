if hp <= 0 {
	hp = 0;
	instance_destroy();
}

if flash_alpha > 0 {
	flash_alpha -= .05;
}

if instance_exists(parent) {
	x = parent.x + x_start*global.scale;
	y = parent.y + y_start*global.scale;
} else {
	if global.station_destroyed = false points = 0;
	instance_destroy();
}