mult = choose(2, 4);
flip = choose(-1, 1);

_clean_destroy = false;

if !instance_exists(o_player) o_main_menu.menu_asteroids++;

if !variable_instance_exists(id, "hp") hp = floor(mult/2);

image_xscale = global.scale*mult;
image_yscale = global.scale*mult;

if mult = 4 image_index = irandom(3);
else if mult = 2 image_index = irandom_range(4, 8);
else if mult = 1 image_index = irandom_range(9, 12);

x_speed = 0;
y_speed = 0;

hit = false;
hit_radius = 0;
damage_x = 0;
damage_y = 0;

//shaders
flash_alpha = 0;
flash_color = c_white;
