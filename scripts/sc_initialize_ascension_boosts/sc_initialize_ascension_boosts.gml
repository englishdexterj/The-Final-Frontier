function sc_initialize_ascension_boosts() {
	var asc = global.ascension_modifier[global.selected_character];
	enemy_spawn_boost = 0;
	enemy_speed_boost = 0;
	enemy_shield_boost = 0;
	enemy_level_boost = 0;
	enemy_plated_boost = false;
	enemy_health_boost = 0;
	enemy_cooldown_boost = 0;
	enemy_flak_boost = false;
	health_debuff = 0;
	
	if asc >= 0 {
		
		if asc >= 1 {
			enemy_spawn_boost++;
			if asc >= 2 {
				enemy_speed_boost++;
				if asc >= 3 {
					enemy_shield_boost++;
					if asc >= 4 {
						enemy_level_boost++;
						if asc >= 5 {
							enemy_cooldown_boost++;
							if asc >= 6 {
								enemy_spawn_boost++;
								if asc >= 7 {
									enemy_flak_boost = true;
									if asc >= 8 {
										enemy_plated_boost = true;
										if asc >= 9 {
											enemy_spawn_boost++;
											if asc >= 10 {
												enemy_health_boost++;
												if asc >= 11 {
													health_debuff += 2;
													if asc >= 12 {
														enemy_spawn_boost++;
														if asc >= 13 {
															enemy_level_boost++;
															if asc >= 14 {
																enemy_speed_boost++;
																if asc >= 15 {
																	health_debuff = 100;
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}