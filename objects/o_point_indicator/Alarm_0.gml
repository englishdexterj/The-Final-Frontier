var _audio = sfx_point_low;

switch points {
	case 25:
		scale = 0;
		scale_max = 3;
		color = make_color_rgb(126, 211, 53);
		subimage = 0;
		alpha_reduction = 120;
		alpha = 1;
		image_angle_change = random_range(-1.5, 1.5);
		_audio = sfx_point_low;
		break;
	case 50:
		scale = 0;
		scale_max = 4;
		color = make_color_rgb(126, 211, 53);
		subimage = 1;
		alpha_reduction = 120;
		alpha = 1;
		image_angle_change = random_range(-1.5, 1.5);
		_audio = sfx_point_low;
		break;
	case 100:
		scale = 0;
		scale_max = 6;
		color = make_color_rgb(0, 209, 253);
		subimage = 2;
		alpha_reduction = 120;
		alpha = 1;
		image_angle_change = random_range(-1, 1);
		_audio = sfx_point_low;
		break;
	case 200:
		scale = 0;
		scale_max = 8;
		color = make_color_rgb(255, 169, 115);
		subimage = 3;
		alpha_reduction = 120;
		alpha = 1.2;
		image_angle_change = random_range(-.8, .8);
		_audio = sfx_point_middle;
		break;
	case 400:
		scale = 0;
		scale_max = 12;
		color = make_color_rgb(243, 162, 255);
		subimage = 4;
		alpha_reduction = 180;
		alpha = 1.2;
		image_angle_change = random_range(-.4, .4);
		_audio = sfx_point_middle;
		break;
	case 800:
		scale = 0;
		scale_max = 16;
		color = make_color_rgb(255, 249, 253);
		subimage = 5;
		alpha_reduction = 180;
		alpha = 1.5;
		image_angle_change = random_range(-.2, .2);
		_audio = sfx_point_middle_high;
		break;
	case 1600:
		scale = 0;
		scale_max = 24;
		color = make_color_rgb(247, 255, 199);
		subimage = 6;
		alpha_reduction = 240;
		alpha = 2.5;
		image_angle_change = random_range(-.1, .1);
		_audio = sfx_point_middle_high;
		break;
	case 6400:
		scale = 0;
		scale_max = 48;
		color = make_color_rgb(255, 215, 0);
		subimage = 7;
		alpha_reduction = 360;
		alpha = 3;
		image_angle_change = 0;
		change_y = -6;
		change_x = random_range(-4, 4);
		
		_audio = sfx_coin_cluster3;
		if original {
			spawn_timer = 60;
			spawn_count = 4;
			y -= 2 * 1.1*sprite_get_height(sprite_index)*scale_max;
		} else if spawn_count = 0 {
			_audio = sfx_sounds_powerup18;
		}
		break;
	default:
		scale = 0;
		scale_max = 2;
		color = c_white;
		subimage = 0;
		alpha_reduction = 120;
		alpha = 1;
		image_angle_change = random_range(-1, 1);
		break;
}

audio_play_sound(_audio, 10, false);

global.pts += points*global.xp_gain;

ready = true;