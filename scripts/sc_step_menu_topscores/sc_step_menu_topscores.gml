function sc_step_menu_topscores() {
	if sel_menu = 4 {
		if mouse_wheel_up() || gamepad_button_check(0, gp_padu) || -gamepad_axis_value(0, gp_axislv) > 0.9 {
			topscores_adjust_y += 32;
			topscores_adjust_y = clamp(topscores_adjust_y, -3200, 0);
		} else if mouse_wheel_down() || gamepad_button_check(0, gp_padd) || -gamepad_axis_value(0, gp_axislv) < -0.9 {
			topscores_adjust_y -= 32;
			topscores_adjust_y = clamp(topscores_adjust_y, -3200, 0);
		}
	}
}