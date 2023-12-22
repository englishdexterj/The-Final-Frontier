// Inherit the parent event
event_inherited();

if !instance_exists(child) {
	instance_destroy();
}

if instance_exists(o_player_drone) {
	if distance_to_object(instance_nearest(x, y, o_player_drone)) < distance_to_object(o_player) {
		target = instance_nearest(x, y, o_player_drone);
	} else if instance_exists(o_player) {
		target = o_player;
	} else target = noone;
} else if instance_exists(o_player) {
	target = o_player;
} else target = noone;
	
if target != noone and deploy = -900 {
	if activation_cooldown = false {
		if distance_to_object(target) <= activation_range*global.scale {
			child.deploy = 600;
			deploy = 600;
			
			var _enemy = choose(o_enemy_suicider, o_enemy_suicider, o_enemy_suicider, o_enemy_rusher);
			//with instance_create_layer(x, y, "Instances_Upper_Middle", _enemy) {
			with instance_create_layer(x, y, "Instances_Upper_Middle", _enemy) {
				image_xscale = global.scale;
				image_yscale = image_xscale;
				image_index = 0;
				image_angle = other.image_angle;
				direction = image_angle;
				idle = true;
				deploy = 660;
				deploy_move = false;
				depth -= 1;
				
				if image_angle = 0 {
					x_start = sprite_get_width(s_station_hatch)/2;
					y_start = sprite_get_height(s_station_hatch)/2;
				} else if image_angle = 90 {
					x_start = sprite_get_height(s_station_hatch)/2;
					y_start = -sprite_get_width(s_station_hatch)/2;
				} else if image_angle = 180 {
					x_start = -sprite_get_width(s_station_hatch)/2;
					y_start = -sprite_get_height(s_station_hatch)/2;
				} else if image_angle = 270 {
					x_start = -sprite_get_height(s_station_hatch)/2;
					y_start = sprite_get_width(s_station_hatch)/2;
				}
				
				x = x + x_start*global.scale;
				y = y + y_start*global.scale;
				parent = other.id;
				
				global.idle_enemies++;
				sc_station_enemy_choose_upgrades();
			}
			
			activation_cooldown = true;
			alarm_set(0, 1800);
		}
	}
} else if deploy > 0 {
	deploy--;
	
	if deploy = 0 {
		
	} else {
		image_index = 0;
	}
} else if deploy > -900 {
	deploy--;
}