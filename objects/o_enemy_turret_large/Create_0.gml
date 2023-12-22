alarm_set(10, 2);

image_xscale *= global.scale;
image_yscale = image_xscale;

max_hp = hp;

turn_acceleration = 0;
turn_speed = 0;

//gun shoot speed cooldown
cooldown = false;
//gun heat
heat = irandom_range(0, 10);
//gun heat reduction
alarm_set(1, 10);

flash_alpha = 0;
flash_color = c_white;

x_speed = 0;
y_speed = 0;

hit = false;
damage_x = 0;
damage_y = 0;

target = noone;

parent = noone;
pt = noone;

flak_heat = 0;
flak_cooldown = false;
alarm_set(5, 10);