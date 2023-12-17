station_level = irandom_range(31, 35);

global.station_level = station_level;

global.station_destroyed = false;

spawn_timer = 20;

if 1=2 {
with instance_create_layer(room_width/2 - view_hport[0], 0, "Instances_Middle", o_station_base) {
	y_speed = 16;
	x_speed = random_range(-4, 4);
}
}