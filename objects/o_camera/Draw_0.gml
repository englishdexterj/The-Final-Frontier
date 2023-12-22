var _px = o_player.x/global.scale - (view_wport[0]/global.scale)/2;
var _py = o_player.y/global.scale - (view_hport[0]/global.scale)/2;

if background_index != global.background_color {
	if decrease_alpha > 0 var _a = decrease_alpha;
	else var _a = 1;
	
	draw_sprite_part_ext(s_bg_left, global.background_color, _px - 500, _py - 500, view_wport[0] + 1000*global.scale, view_hport[0] + 1000*global.scale, 
															 o_player.x - view_wport[0]/2 - 500*global.scale, o_player.y - view_hport[0]/2 - 500*global.scale, global.scale, global.scale, c_white, 1);
															 
	draw_sprite_part_ext(s_bg_right, global.background_color, _px - 3500, _py - 500, view_wport[0] + 1000*global.scale, view_hport[0] + 1000*global.scale, 
															 o_player.x - view_wport[0]/2 - 500*global.scale, o_player.y - view_hport[0]/2 - 500*global.scale, global.scale, global.scale, c_white, 1);
	
	draw_sprite_part_ext(s_bg_left, background_index, _px - 500, _py - 500, view_wport[0] + 1000*global.scale, view_hport[0] + 1000*global.scale, 
															 o_player.x - view_wport[0]/2 - 500*global.scale, o_player.y - view_hport[0]/2 - 500*global.scale, global.scale, global.scale, c_white, _a);
															 
	draw_sprite_part_ext(s_bg_right, background_index, _px - 3500, _py - 500, view_wport[0] + 1000*global.scale, view_hport[0] + 1000*global.scale, 
															 o_player.x - view_wport[0]/2 - 500*global.scale, o_player.y - view_hport[0]/2 - 500*global.scale, global.scale, global.scale, c_white, _a);
} else {
	draw_sprite_part_ext(s_bg_left, global.background_color, _px - 500, _py - 500, view_wport[0] + 1000*global.scale, view_hport[0] + 1000*global.scale, 
															 o_player.x - view_wport[0]/2 - 500*global.scale, o_player.y - view_hport[0]/2 - 500*global.scale, global.scale, global.scale, c_white, 1);
															 
	draw_sprite_part_ext(s_bg_right, global.background_color, _px - 3500, _py - 500, view_wport[0] + 1000*global.scale, view_hport[0] + 1000*global.scale, 
															 o_player.x - view_wport[0]/2 - 500*global.scale, o_player.y - view_hport[0]/2 - 500*global.scale, global.scale, global.scale, c_white, 1);
}