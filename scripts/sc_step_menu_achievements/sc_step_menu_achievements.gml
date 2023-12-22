function sc_step_menu_achievements() {
	if sel_menu = 7 { //achievements
		if mouse_wheel_up() || -gamepad_axis_value(0, gp_axislv) > 0.9 {
			achievements_adjust_y += 32;
		} else if mouse_wheel_down() || -gamepad_axis_value(0, gp_axislv) < -0.9 {
			achievements_adjust_y -= 32;
		}
	}
}