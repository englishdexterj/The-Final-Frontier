/// @description cloaking
cloaking_cooldown--;

if cloaking_cooldown = 8 cloaking_active = false;

if cloaking_cooldown > 0 {
	if cloaking_cooldown <= 8 {
		alarm_set(11, cloaking_recharge);
	} else {
		alarm_set(11, cloaking_length);
	}
}
