if spawn_timer > 0 spawn_timer--;

if spawns_left > 0 and spawn_timer = 0 {
	var _a = instance_create_layer(irandom_range(room_width/2 - 500*global.scale, room_width/2 + 500*global.scale), choose(0, room_height), "Instances", o_asteroid);
	with _a {
		x_speed = random_range(-2, 2);
	
		if y = 0 {
			y -= irandom_range(100, 350);
			y_speed = random_range(3, 7);
		} else if y = room_height {
			y += irandom_range(100, 350);
			y_speed = random_range(-3, -7);
		}
	}
	
	spawns_left --;
	spawn_timer = 5;
	
	if spawns_left = 0 global.asteroid_level = asteroid_level;
} else if spawn_timer = 0 {
	var _a = instance_create_layer(irandom_range(room_width/2 - 500*global.scale, room_width/2 + 500*global.scale), choose(0, room_height), "Instances", o_asteroid);
	with _a {
		x_speed = random_range(-2, 2);
	
		if y = 0 {
			y -= irandom_range(100, 350);
			y_speed = random_range(3, 7);
		} else if y = room_height {
			y += irandom_range(100, 350);
			y_speed = random_range(-3, -7);
		}
	}
	
	spawn_timer = 600;
}

if asteroid_level = global.spawn_level {
	spawns_left = 50;
	spawn_timer = 20;
	if asteroid_level < 20 {
		asteroid_level = irandom_range(41, 45);
	} else if asteroid_level < 50 {
		asteroid_level = irandom_range(81, 85);
	}
}
