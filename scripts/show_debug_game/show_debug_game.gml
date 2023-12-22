function show_debug_game(msg) {
	if variable_global_exists("tick") {
		show_debug_message(string(global.tick) + ": " + string(msg));
	} else {
		show_debug_message("0: " + string(msg));
	}
}