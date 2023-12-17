/// @description spawn lights
with instance_create_layer(x, y, "Instances_Upper_Middle", o_station_hanger_lights) {
	image_xscale = global.scale;
	image_yscale = image_xscale;
	image_angle = other.image_angle;
	parent = other.id;
	x_start = 0;
	y_start = 0;
	other.lights = id;
}