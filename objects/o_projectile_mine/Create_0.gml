//alarm_set(0, destroy_timer);

image_xscale *= global.scale;
image_yscale *= global.scale;

forward = 0;
turn = 0;

x_start = 0;
y_start = 0;

x_speed = 0;
y_speed = 0;
acceleration = 0;
turn_acceleration = 0;
turn_speed = 0;
max_turn_speed = 180;
target = noone;
explosion_timer = 0;
blip_timer = 0;
timer = 0;

drift = false;
drift_x = 0*global.scale;
drift_y = global.scale/4;

explosion_range = 45*global.scale;

if type = "bullet" {
	var _s = choose(sfx_weapon_singleshot1,sfx_weapon_singleshot2,sfx_weapon_singleshot3,sfx_weapon_singleshot4,sfx_weapon_singleshot5,sfx_weapon_singleshot6,sfx_weapon_singleshot7,sfx_weapon_singleshot8,sfx_weapon_singleshot9,sfx_weapon_singleshot10,sfx_weapon_singleshot11,sfx_weapon_singleshot12,sfx_weapon_singleshot13,sfx_weapon_singleshot14,sfx_weapon_singleshot15,sfx_weapon_singleshot16,sfx_weapon_singleshot17,sfx_weapon_singleshot18,sfx_weapon_singleshot19,sfx_weapon_singleshot20,sfx_weapon_singleshot21,sfx_weapon_singleshot22);
	var snd = audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	var snd2 = audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	var snd3 = audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	audio_sound_gain(snd2, .25, 0);
	audio_sound_gain(snd3, .25, 0);
	audio_sound_gain(snd, .25, 0);
}