life_warmup_current = 0;
life_warmup_time = 180;
life_warmup_start = irandom_range(180, 360);
life = 3600;
image_alpha = 0;

x_speed = 0;
y_speed = 0;

draw_color = c_white;

parent = noone;
parent_max_distance = 1000*global.scale;
parent_notify = false;