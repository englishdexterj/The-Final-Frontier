/// @description rammer cooldown
rammer_cooldown -= 1;

if rammer_cooldown > 0 alarm_set(9, rammer_cooldown_speed);
