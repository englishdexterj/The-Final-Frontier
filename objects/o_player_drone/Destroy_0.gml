if instance_exists(o_player) {
	o_player.drones -= 1;
} else o_main_menu.menu_friendlies--;

part_particles_create(global.particle_sys, x, y, global.pt_player, 30*size);

var _s = choose(sfx_exp_short_soft1,sfx_exp_short_soft2,sfx_exp_short_soft3,sfx_exp_short_soft4,sfx_exp_short_soft5,sfx_exp_short_soft6,sfx_exp_short_soft7,sfx_exp_short_soft8,sfx_exp_short_soft9,sfx_exp_short_soft10,sfx_exp_short_soft11,sfx_exp_short_soft12);
audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
