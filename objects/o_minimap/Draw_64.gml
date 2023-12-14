if 1 = 2 {
draw_set_color(c_white);
draw_sprite(s_minimap, 0, camera_get_view_width(0) - 128 - 32, 128 + 32)
draw_circle(camera_get_view_width(0) - 128 - 32, 128 + 32, 3, false);
for (var i = 0; i < instance_number(o_enemy); i++) {
	with o_player {
		var enemy = instance_find(o_enemy, i);
		if distance_to_object(enemy) < 256*4 - 64 {
			draw_set_color(c_red);
			draw_circle(camera_get_view_width(0) - 128 - 32 - (x - enemy.x)/8, 128 + 32 - (y - enemy.y)/8, enemy.size*2, false);
		}
	}
}
}