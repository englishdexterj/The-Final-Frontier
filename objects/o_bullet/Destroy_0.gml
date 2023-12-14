if type = "ion" part_particles_create(global.particle_sys, x, y, global.pt_bullet_ion, 5);
else if enemy part_particles_create(global.particle_sys, x, y, global.pt_bullet_enemy, 5);
else part_particles_create(global.particle_sys, x, y, global.pt_bullet, 5);