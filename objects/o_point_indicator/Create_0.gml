image_angle_change = 0;
ready = false;
alarm_set(0, 1);

alpha = 1;
scale = 0;
scale_max = 2;
color = c_white;
subimage = 0;
alpha_reduction = 120;

original = false;
spawn_timer = 0;
spawn_count = 0;

shader_time = shader_get_uniform(sh_glisten, "time");
shader_alpha = shader_get_uniform(sh_glisten, "alpha");
shader_glisten = shader_get_uniform(sh_glisten, "glisten_strength");

shader_time2 = shader_get_uniform(sh_glisten_background, "time");
shader_alpha2 = shader_get_uniform(sh_glisten_background, "alpha");
shader_glisten2 = shader_get_uniform(sh_glisten_background, "glisten_strength");
time = 0;

change_y = 0;
change_x = 0;