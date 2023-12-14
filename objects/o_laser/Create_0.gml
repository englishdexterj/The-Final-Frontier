alarm_set(0, destroy_timer);

image_xscale *= global.scale*2;
image_yscale *= global.scale*2;

warmup_speed = 0.005;

forward = 0;
turn = 0;

x_speed = 0;
y_speed = 0;
acceleration = 0;
turn_acceleration = 0;
turn_speed = 0;

type = "laser";

if type = "laser" {
//	var _s = choose(sfx_sound_mechanicalnoise1, sfx_sound_mechanicalnoise3, sfx_sound_mechanicalnoise4);
//	var snd = audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
//	var snd2 = audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
//	var snd3 = audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
//	audio_sound_gain(snd2, .25, 0);
//	audio_sound_gain(snd3, .25, 0);
//	audio_sound_gain(snd, .25, 0);
}