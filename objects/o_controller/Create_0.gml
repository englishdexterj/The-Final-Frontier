randomize();

sc_initialize_ascension_boosts();

game_set_speed(setfps, gamespeed_fps);

global.scale = 16;
sc_init_part();

audio_group_load(ag_game_sounds);
audio_group_load(ag_menu_sounds);

audio_group_set_gain(ag_game_sounds, global.volume / 100, 0);
audio_group_set_gain(ag_menu_sounds, global.volume / 100, 0);

global.next_boss_wave = -1;

global.xp_gain = 1;

global.debug_pathing = false;
debug = 0;
spawn = 0;
spawn_level = 0;

round_intermission = false;

instance_create_layer(room_width div 2, room_height div 2, "Instances", o_menu);
instance_create_layer(room_width div 2, room_height div 2, "Instances", o_player);
if room = game instance_create_layer(room_width div 2, room_height div 2, "Instances", o_camera);
//instance_create_layer(room_width div 2, room_height div 2, "Instances", o_minimap);
instance_create_layer(room_width div 2, room_height div 2, "Instances", o_controller_sound);
instance_create_layer(room_width div 2, room_height div 2, "Instances", o_upgrade_tree);
instance_create_layer(room_width div 2, room_height div 2, "Instances", o_controller_asteroids);

height = camera_get_view_height(0)/2;
width = camera_get_view_width(0)/2;
alarm_set(2, 2);

//spawn enemy
global.spawn_level = 0;
alarm_set(0, 210);
spawn_timer = 720;
//
global.ships_destroyed = 0;

global.level = 1;