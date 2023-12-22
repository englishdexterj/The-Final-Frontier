if spawn_timer > 0 spawn_timer--;

if spawns_left > 0 and spawn_timer = 0 {
	repeat (3) {
		if global.background_objects = 2 {
			with instance_create_layer(irandom_range(room_width/2 - 2040*global.scale, room_width/2 + 2040*global.scale), irandom_range(0, room_height), "Instances_Background", o_background) {
				sprite_index = s_asteroid3;
				image_index = irandom(sprite_get_number(sprite_index));
				image_alpha = 0;
				mult = choose(.25, .5, 1);
				image_xscale = global.scale*mult;
				image_yscale = global.scale*mult;
				life_warmup_current = 0;
				life_warmup_time = 360;
				life_warmup_start = irandom_range(180, 720);
				life = irandom_range(10000, 11600);
				x_speed = random_range(-1*mult, 1*mult);
				y_speed = random_range(2*mult, 4*mult);
				draw_color = c_dkgray;
			}
		}
	}
	
	var _a = instance_create_layer(irandom_range(room_width/2 - 2040*global.scale, room_width/2 + 2040*global.scale), choose(0, room_height), "Instances_Upper_Middle", o_asteroid);
	with _a {
		x_speed = random_range(-2, 2);
	
		if y = 0 {
			y -= irandom_range(200, 450);
			y_speed = random_range(3, 7);
		} else if y = room_height {
			y += irandom_range(200, 450);
			y_speed = random_range(-3, -7);
		}
		var _spd = (sqr(x_speed) + sqr(y_speed)) / 10;
		depth -= _spd;
	}
	
	spawns_left --;
	spawn_timer = 5;
} else if spawn_timer = 0 {
	var _a = instance_create_layer(irandom_range(room_width/2 - 2040*global.scale, room_width/2 + 2040*global.scale), choose(0, room_height), "Instances_Upper_Middle", o_asteroid);
	with _a {
		x_speed = random_range(-2, 2);
	
		if y = 0 {
			y -= irandom_range(100, 350);
			y_speed = random_range(3, 7);
		} else if y = room_height {
			y += irandom_range(100, 350);
			y_speed = random_range(-3, -7);
		}
		var _spd = (sqr(x_speed) + sqr(y_speed)) / 10;
		depth -= _spd;
	}
	
	global.asteroid_level = asteroid_level; //set global later so wave indicator will say "asteroids"
	spawn_timer = 600;
}

if asteroid_level = global.spawn_level {
	audio_play_sound(sfx_alarm_loop2, 10, false);
	
	spawns_left = 200;
	spawn_timer = 20;
	if asteroid_level < 20 {
		asteroid_level = irandom_range(41, 45);
	} else if asteroid_level < 50 {
		asteroid_level = irandom_range(71, 75);
	} else {
		asteroid_level = (asteroid_level div 10) * 10 + irandom_range(31, 35);
	}
}
