if instance_exists(o_player) {
	x = o_player.x;
	y = o_player.y;
}

if global.background_color != background_index {
	if decrease_alpha = 0 {
		//layer_background_index(layer_background_get_id(layer_get_id("Background")), global.background_color);
		decrease_alpha = 1;
	} else if decrease_alpha > 0 {
		decrease_alpha -= (1/10)*(1/60);
		
		if decrease_alpha = 0 background_index = global.background_color;
	}
}

if global.spawn_level = next_background_wave and global.background_color <= 8 {
	global.background_color++;
	
	next_background_wave += 20;
}