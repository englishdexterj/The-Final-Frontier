follow = false;

image_xscale *= global.scale;
image_yscale = image_xscale;

if instance_exists(o_enemy) {
	target = instance_nearest(x, y, o_enemy);
} else {
	target = noone;
}

weapon_type = "bullet";
flak = false;

can_shoot = true;
cooldown = false;
heat = 0;

//smart movement
for (var i = 0; i <= 350; i+= 10) {
	col[i/10] = false;
	col_dist[i/10] = 0;
	safety[i/10] = 0;
}

movable = true;
dual_bullet = 1;

alarm_set(1, 10);

cooldown_speed = 0.1;

max_speed = 15;
max_turn_speed = 2;

forward = 0;
turn = 0;

x_speed = 0;
y_speed = 0;
acceleration = 0;
turn_acceleration = 0;
turn_speed = 0;

size = .5;

disabled = false;

//shaders
flash_alpha = 0;
flash_color = c_white;

cloaking_active = false;

hp = 1;

alarm_set(8, 1);
