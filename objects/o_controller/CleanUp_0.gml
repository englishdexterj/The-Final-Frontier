part_system_destroy(global.particle_sys);

if audio_is_playing(current_audio) {
	audio_stop_sound(current_audio);
}