if other.enemy = true && other.image_alpha = 1 {
	if other.type = "ion" {

		disabled = true;
		alarm_set(4, 120);
		audio_play_sound_at(sfx_sounds_interaction13, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(sfx_sounds_interaction13, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		audio_play_sound_at(sfx_sounds_interaction13, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
	} else {
		if flash_alpha = 0 {
			part_particles_create(global.particle_sys, x, y, global.pt_player, 30);
			flash_alpha = 1;
			hp -= 1;
		
			var _s = choose(sfx_exp_shortest_hard1,sfx_exp_shortest_hard2,sfx_exp_shortest_hard3,sfx_exp_shortest_hard4,sfx_exp_shortest_hard5,sfx_exp_shortest_hard6,sfx_exp_shortest_hard7,sfx_exp_shortest_hard8,sfx_exp_shortest_hard9,sfx_exp_shortest_hard10);
			
			audio_play_sound_at(_s, x, y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
			audio_play_sound_at(_s, x - (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
			audio_play_sound_at(_s, x + (room_width - view_hport[0]), y, 0, 100*global.scale, 1000*global.scale, 1, false, 1);
		}
	}
			
	if (other.destroy) instance_destroy(other);
}
