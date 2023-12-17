var _mult = 1;

if y_speed > 0 and y < 210*global.scale {
	_mult = 4*((210 - y/global.scale) / 420);
} else if y_speed < 0 and y > room_height - 210*global.scale {
	_mult = 4*((y/global.scale - (room_height/global.scale - 210)) / 420);
}

y += clamp(_mult, 1, 8)*y_speed*global.scale*1/60;
x += clamp(_mult, 1, 8)*x_speed*global.scale*1/60;

//only destroy when far off map so shield doesnt disappear
if y_speed > 0 and y > room_height + 210*1.5*global.scale {
	points = 0;
	instance_destroy();
} else if y_speed < 0 and y < -210*1.5*global.scale {
	points = 0;
	instance_destroy();
}

//if keyboard_check_pressed(ord("F")) instance_destroy();