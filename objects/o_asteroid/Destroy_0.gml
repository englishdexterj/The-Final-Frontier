if !_clean_destroy {
	part_particles_create(global.particle_sys, x, y, global.pt_bullet, 30);

	if abs(image_xscale) > global.scale {
		repeat(3) {
			var _a = instance_create_layer(x, y, "Instances", o_asteroid);
			_a.image_xscale = image_xscale/2;
			_a.image_yscale = abs(image_yscale/2);
			_a.mult = mult/2;
			_a.hp = floor(mult/2);
			_a.flip = flip;
			_a.x_speed = irandom_range(-x_speed/2 - 2*global.scale, x_speed/2 + 2*global.scale);
			_a.y_speed = irandom_range(-y_speed/2 - 2*global.scale, y_speed/2 + 2*global.scale);
			var _spd = (sqr(_a.x_speed) + sqr(_a.y_speed)) / 10;
			_a.depth -= _spd;
		}
	}
}

if !instance_exists(o_player) o_main_menu.menu_asteroids--;