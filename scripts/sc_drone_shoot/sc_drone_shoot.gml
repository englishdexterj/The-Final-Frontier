function sc_drone_shoot(ang_diff) {
	//shoot
	if weapon_type = "bullet" {
		sc_drone_shoot_bullet(ang_diff);
	} else if weapon_type = "missile" {
//		sc_shoot_missile(ang_diff);
	} else if weapon_type = "laser" {
//		sc_shoot_laser(ang_diff);
	} else if weapon_type = "ion" {
//		sc_shoot_ion(ang_diff);
	}
	
	if flak = true {
		sc_drone_shoot_flak(ang_diff);
	}
}
