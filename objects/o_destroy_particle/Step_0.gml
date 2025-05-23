alpha -= 1/destroy_timer;
var _c = clamp(255-(1-alpha)*255/2, 127, 255);
color = make_color_rgb(_c, _c, _c);

image_alpha = clamp(alpha, 0, 1);

if image_alpha = 0 instance_destroy();

if (alpha-.5)*2/60 > random(2) {
	var _x = 0
	var _y = 0;
	
	if type = "station" {
		switch image_index {
			case 0:
				_x = 50;
				_y = -50;
				break;
			case 1:
				_x = -25;
				_y = -55;
				break;
			case 2:
				_x = -95;
				_y = -35;
				break;
			case 3:
				_x = -110;
				_y = 30;
				break;
			case 4:
				_x = -40;
				_y = 50;
				break;
			case 5:
				_x = 65;
				_y = 45;
				break;
			default:
				show_debug_message("ERR o_destroy_particle step");
				break;
		}
		
		_x += irandom_range(-5, 5);
		_y += irandom_range(-5, 5);
		part_particles_create(global.particle_sys, x + _x*global.scale, y + _y*global.scale, global.pt_destroy, 3);
	}
	
	if audio {
		var _s = choose(sfx_exp_short_hard11, sfx_exp_short_hard12, sfx_exp_short_hard13, sfx_exp_short_hard14, sfx_exp_short_hard15, sfx_exp_short_hard16);
		audio_play_sound_at(_s, x, y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
		audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
		audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 200*global.scale, 1000*global.scale, 1, false, 1, .3);
	}
}