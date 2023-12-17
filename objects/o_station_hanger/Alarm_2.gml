/// @description particles
var _l = sqrt(sqr(30) + sqr(30));
part_particles_create(global.particle_sys, x + lengthdir_x(_l, image_angle+45)*global.scale, y +  + lengthdir_y(_l, image_angle+45)*global.scale, global.pt_hanger, 1);
alarm_set(2, 30);