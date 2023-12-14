if enemy part_particles_create(global.particle_sys, x, y, global.pt_bullet_enemy, 5);
else {
	part_particles_create(global.particle_sys, x, y, global.pt_bullet, 5);
	if flank = false pt.max_turn_speed *= 6;
}
