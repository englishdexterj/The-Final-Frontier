/// @description initialize achievements
if global.steam_api sc_initialize_menu_achievements();
else alarm_set(2, 60);