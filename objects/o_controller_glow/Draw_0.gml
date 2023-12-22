var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);

//// Horizontal pass
surface_set_target(surBase);
draw_clear(c_black);

// Draw everything that glows
with (o_laser_updated) {
	for (var i = 0; i < laser_width/(global.scale*2); i++) {
		var _sx = (x + lengthdir_x(2*global.scale * i, direction+90));
		var _sy = (y + lengthdir_y(2*global.scale * i, direction+90));
	
		if enemy var collision = collision_line_first_point(_sx, _sy, _sx + lengthdir_x(laser_length, direction), _sy + lengthdir_y(laser_length, direction), o_friendly_parent);
		else var collision = collision_line_first_point(_sx, _sy, _sx + lengthdir_x(laser_length, direction), _sy + lengthdir_y(laser_length, direction), o_enemy_parent);
	
		if collision[0] != noone {
			//if object_is_ancestor(collision[0].object_index, o_projectile_parent) instance_destroy(collision[0]);
			draw_line_width((_sx - _vx) / global.scale, (_sy - _vy) / global.scale, (collision[1] - _vx) / global.scale, (collision[2] - _vy) / global.scale, 2);
			//draw_line(_sx, _sy, collision[1], collision[2]);
		} else {
			draw_line_width((_sx - _vx) / global.scale, (_sy - _vy) / global.scale, ((_sx - _vx) + lengthdir_x(laser_length, direction)) / global.scale, ((_sy - _vy) + lengthdir_y(laser_length, direction)) / global.scale, 2);
			//draw_line(_sx, _sy, _sx + lengthdir_x(laser_length, direction), _sy + lengthdir_y(laser_length, direction));
		}
	
		//shader_set(sh_glow);
		draw_set_color(make_color_rgb(i*20, 100+i*20, 240-i*20));
		//draw_line_width(_sx, _sy, _sx + lengthdir_x(laser_length, direction), _sy + lengthdir_y(laser_length, direction), 2*global.scale);
		draw_set_color(c_white);
		//shader_reset();
	}
}
surface_reset_target();

// Make it glow horizontally
surface_set_target(surPass);
draw_clear_alpha(c_black, 0);

shader_set(sh_blur_horizontal);
shader_set_uniform_f(shader_get_uniform(sh_blur_horizontal, "u_glowProperties"), uOuterIntensity, uInnerIntensity, uInnerLengthMultiplier);
shader_set_uniform_f(shader_get_uniform(sh_blur_horizontal, "u_time"), current_time);

gpu_set_blendenable(false); //necessary!
draw_surface(surBase, 0, 0);
gpu_set_blendenable(true);

shader_reset();
surface_reset_target();

//// Vertical pass + final adjustments, add on top
gpu_set_blendmode(bm_add);

shader_set(sh_blur_vertical);
shader_set_uniform_f(shader_get_uniform(sh_blur_vertical, "u_glowProperties"), uOuterIntensity, uInnerIntensity, uInnerLengthMultiplier);
shader_set_uniform_f(shader_get_uniform(sh_blur_vertical, "u_time"), current_time);
draw_surface_stretched(surPass, _vx, _vy, surface_get_width(surPass)*global.scale, surface_get_height(surPass)*global.scale);
shader_reset();

gpu_set_blendmode(bm_normal);