if other.enemy = false {
	if flash_alpha = 0 {
		part_particles_create(global.particle_sys, other.x, other.y, enemy_type_particle, 30*size);
	
		_x = other.x - x;
		_y = other.y - y;
	
		var _a = image_angle * pi / 180;
		damage_y = _y*cos(_a) + _x*sin(_a);
		damage_x = _x*cos(_a) - _y*sin(_a);
	
		hit = true;
		hp -= 1;
	
		//shader
		flash_alpha = 1;
	}
	
	instance_destroy(other);
}