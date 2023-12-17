// Inherit the parent event
event_inherited();

if instance_exists(o_player_drone) {
	if distance_to_object(instance_nearest(x, y, o_player_drone)) < distance_to_object(o_player) {
		target = instance_nearest(x, y, o_player_drone);
	} else if instance_exists(o_player) {
		target = o_player;
	} else target = noone;
} else if instance_exists(o_player) {
	target = o_player;
} else target = noone;
	
if target != noone and deploy = -600 {
	if activation_cooldown = false {
		if distance_to_object(target) <= activation_range*global.scale {
			deploy = 600;
			
			activation_cooldown = true;
			alarm_set(0, 1800);
		}
	}
} else if deploy > 0 {
	deploy--;
	
	if deploy = 0 {
		with instance_create_layer(x, y, "Shots", o_missile) {
			enemy_type = "station_launcher_rocket";
			
			//plated and change image index to plated
			plated = true;
			image_index += 2;
			
			enemy = true;
				
			max_turn_speed = 1;
			target = o_player;
				
			bullet_color = c_white;
			direction = point_direction(x, y, target.x, target.y);
			image_angle = direction;
			speed = (10*global.spd);
		}
		image_index = 11;
	} else {
		image_index = 10 - (deploy div (600/10));
	}
} else if deploy <= 0 and image_index != 0 {
	deploy--;
	
	image_index = 11 - (deploy div (600/10));
	
	if image_index = 21 {
		deploy = -600;
		image_index = 0;
	}
}