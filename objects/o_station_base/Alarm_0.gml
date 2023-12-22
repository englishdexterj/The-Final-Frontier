/// @description background enemies
if global.background_objects >= 1 {
	while background_enemies < background_enemies_max {
		var _dir = irandom_range(0, 359);
		var _dist = irandom_range(420, 840)*global.scale;
		background_enemies++;
		with instance_create_layer(x + lengthdir_x(_dist, _dir), y + lengthdir_y(_dist, _dir), "Instances_Background", o_background) {
			sprite_index = choose(s_enemy_basic, s_enemy_suicider, s_enemy_bomber);
			image_index = 0;
			image_alpha = 0;
			mult = choose(.25, .5, .75);
			image_xscale = global.scale*mult;
			image_yscale = global.scale*mult;
			life_warmup_current = 0;
			life_warmup_time = 300;
			life_warmup_start = irandom_range(180, 240);
			life = irandom_range(600, 1200);
			x_speed = other.x_speed * global.scale * 1/60 * random_range(.8, 1.2) * mult;
			y_speed = other.y_speed * global.scale * 1/60 * random_range(.8, 1.2) * mult;
			image_angle = point_direction(x, y, x + x_speed, y + y_speed);
			draw_color = c_dkgray;
			parent = other.id;
			parent_max_distance = 1500*global.scale;
			parent_notify = true;
		}
	}
}

alarm_set(0, 60);