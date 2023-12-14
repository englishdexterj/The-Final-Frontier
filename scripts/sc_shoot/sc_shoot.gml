function sc_shoot(ang_diff) {
	//shoot
	if weapon_type = "bullet" {
		sc_shoot_bullet(ang_diff);
	} else if weapon_type = "missile" {
		sc_shoot_missile(ang_diff);
	} else if weapon_type = "shotgun" {
		sc_shoot_shotgun(ang_diff);
	} else if weapon_type = "laser" {
		sc_shoot_laser(ang_diff);
	} else if weapon_type = "ion" {
		sc_shoot_ion(ang_diff);
	} else if weapon_type = "sniper" {
		sc_shoot_sniper(ang_diff);
	}
	
	if flak = true {
		sc_shoot_flak(ang_diff);
	}
}