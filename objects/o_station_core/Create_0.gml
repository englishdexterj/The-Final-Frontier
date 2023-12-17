event_inherited();

shader_time = shader_get_uniform(sh_glisten, "time");
shader_alpha = shader_get_uniform(sh_glisten, "alpha");
shader_glisten = shader_get_uniform(sh_glisten, "glisten_strength");

time = 0;