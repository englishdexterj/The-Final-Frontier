function sc_step_menu_stats(){
	if sel_menu = 9 { //stats
		if mouse_wheel_up() || keyboard_check(global.key[ctrl.forward]) || gamepad_button_check(0, gp_padu) || -gamepad_axis_value(0, gp_axislv) > 0.9 {
			stats_adjust_y += 32;
			stats_adjust_y = clamp(stats_adjust_y, -9600, 0);
		} else if mouse_wheel_down() || keyboard_check(global.key[ctrl.backward]) || gamepad_button_check(0, gp_padd) || -gamepad_axis_value(0, gp_axislv) < -0.9 {
			stats_adjust_y -= 32;
			stats_adjust_y = clamp(stats_adjust_y, -9600, 0);
		}
	}
	
	if global.steam_api and !stats_initialized {
		sc_initialize_menu_stats_steam();
		stats_initialized = true;
	}
}