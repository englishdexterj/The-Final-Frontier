function sc_get_angdiff(target, _dir = 1, move_mult = 1) {
	if move_smart var ang_diff = sc_angdiff_smart(_dir, target, move_mult);
	else if leading_shot var ang_diff = sc_angdiff_smart_shot(_dir, target, .4);
	else var ang_diff = sc_angdiff(_dir, target);
	
	return ang_diff;
}