hit_times = 0;
hit_reduce = 0;

width = camera_get_view_width(0)/2;
width_3 = camera_get_view_width(0)/3;
height = camera_get_view_height(0)/2;

shader_time = shader_get_uniform(sh_glisten, "time");
shader_alpha = shader_get_uniform(sh_glisten, "alpha");
shader_glisten = shader_get_uniform(sh_glisten, "glisten_strength");
time = 0;

index = false;
alarm_set(0, 1);

shader_color = shader_get_uniform(sh_ring, "u_Color");
shader_inner = shader_get_uniform(sh_ring, "u_InnerRadius");
shader_outer = shader_get_uniform(sh_ring, "u_OuterRadius");

shader_time2 = shader_get_uniform(sh_ring, "u_Time");
shader_frequency = shader_get_uniform(sh_ring, "u_Frequency");
shader_amplitude = shader_get_uniform(sh_ring, "u_Amplitude");
shader_alpha2 = shader_get_uniform(sh_ring, "u_RingAlpha");
shader_s_width = shader_get_uniform(sh_ring, "u_SpriteWidth");
shader_s_height = shader_get_uniform(sh_ring, "u_SpriteHeight");
time2 = 0;

depth -= 2;