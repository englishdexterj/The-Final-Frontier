destroy_timer = 300;

laser_length = 960*2*global.scale;
laser_width = 0;
laser_width_max = 8*global.scale;

image_xscale = global.scale;
image_yscale = global.scale;
image_alpha = 0;

tick_damage = 0;

flank = false;

warmup_speed = 1/3*1/60;

pt = noone;

_x = 0;
_y = 0;

dir = 1;

ready = false;
alarm_set(0, 1);