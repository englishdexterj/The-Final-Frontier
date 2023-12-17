/*
var ww = sprite_get_width(sprite_index);
var hh = sprite_get_height(sprite_index);

var chunk = 20;

for (var i = 0; i < ww; i += chunk) {
	for (var j = 0; j < hh; j += chunk) {
		with instance_create_layer(x+i*global.scale, y+j*global.scale, "Instances_Top", o_destroy_particle) {
			sprite = other.sprite_index;
			size = chunk;
			xx = i;
			yy = j;
		}
		chunk = irandom_range(20, 40);
	}
}
*/

for (var i = 0; i < 6; i++) {
	with instance_create_layer(x, y, "Instances", o_destroy_particle) {
		direction = 45 + i*63 + irandom_range(-20, 20);
		speed = .5*global.scale;
		image_index = i;
		image_xscale = global.scale;
		image_yscale = global.scale;
		alpha = 2 * random_range(.8, 1.2);
		destroy_timer = 300;
	}
}