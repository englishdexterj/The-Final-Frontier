hp = 3;
max_hp = hp;

index_add = 0;
alarm_set(2, 60);

image_xscale = global.scale;
image_yscale = image_xscale;

disabled = false;

hurt = false;

hit = false;
hit_radius = 0;
damage_x = 0;
damage_y = 0;

invincible = false;

size = 2;

//glow particles
particle_count = 50; // Adjust as needed
particle_lifetime = 60; // Adjust as needed
alarm_set(1, 1);

//shaders
flash_alpha = 0;
flash_color = c_white;

alarm_set(0, 1);