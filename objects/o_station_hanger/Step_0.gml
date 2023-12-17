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

if target != noone {
	if activation_cooldown = false {
		if distance_to_object(target) <= activation_range*global.scale {
			with instance_create_layer(x, y, "Instances_Middle", choose(o_enemy_gunship, o_enemy_marauder, o_enemy_shotgunner, o_enemy_sniper)) {
				image_xscale = global.scale;
				image_yscale = image_xscale;
				image_index = 0;
				image_angle = other.image_angle + 45;
				direction = image_angle;
				idle = true;
				deploy = 1200;
				deploy_move = true;
				upgrades = 0; 
				depth += 1;
				x_start = 0;
				y_start = 0;
				parent = other.id;
			}
			
			lights.deploy = 1200;
			
			activation_cooldown = true;
			alarm_set(0, 1800);
		}
	}
}