if global.background_objects <= 1 and sprite_index = s_asteroid3 instance_destroy();
else if global.background_objects = 0 and (sprite_index = s_enemy_basic or sprite_index = s_enemy_bomber or sprite_index = s_enemy_suicider) instance_destroy();

if life_warmup_start > 0 life_warmup_start--;
else if life_warmup_current < life_warmup_time {
	life_warmup_current++;
	image_alpha = (life_warmup_current / life_warmup_time);
} else if life > 0 life--;
else {
	life--;
	image_alpha = (life_warmup_time - abs(life)) / life_warmup_time;
	if image_alpha = 0 instance_destroy();
}

if parent != noone {
	if distance_to_object(parent) >= parent_max_distance and life > 0 {
		life = 0;
	}
}

if instance_exists(o_player) {
	//switch side of map
	if distance_to_object(o_player) > view_wport[0] && room_width - x < view_wport[0]*2 
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x - (room_width - view_wport[0]), y, o_player.x, o_player.y)) {
		x -= (room_width - view_wport[0]);
	} else if distance_to_object(o_player) > view_wport[0] && x < view_wport[0]*2
	and (point_distance(x, y, o_player.x, o_player.y) > point_distance(x + (room_width - view_wport[0]), y, o_player.x, o_player.y)){
		x += (room_width - view_wport[0]);
	}
}

if y < -2000*global.scale or y > room_height + 2000*global.scale {
	instance_destroy();
}

x += x_speed;
y += y_speed;