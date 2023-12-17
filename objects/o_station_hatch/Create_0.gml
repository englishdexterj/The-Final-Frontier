// Inherit the parent event
event_inherited();

activation_range = 600;
activation_cooldown = false;
deploy = -600;

with instance_create_layer(x, y, "Instances_Top", o_station_hatch_top) {
	image_xscale = global.scale;
	image_yscale = image_xscale;
	image_angle = other.image_angle;
	image_index = 0;
	parent = other.id;
	x_start = 0;
	y_start = 0;
	other.child = id;
}

image_index = 0;