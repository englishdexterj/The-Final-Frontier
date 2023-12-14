image_angle_change = 0;
ready = false;
alarm_set(0, 1);

alpha = 1;

shader_time = shader_get_uniform(sh_glisten, "time");
shader_alpha = shader_get_uniform(sh_glisten, "alpha");
time = 0;