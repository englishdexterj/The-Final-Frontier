/// @description gun / laser / missile / hull heat reduction

if (heat >= cooldown_speed) heat -= cooldown_speed;
else heat = 0;

if (missile_heat >= missile_cooldown_speed) missile_heat -= missile_cooldown_speed;
else missile_heat = 0;

if (laser_cooldown_heat >= laser_cooldown_speed) laser_cooldown_heat -= laser_cooldown_speed;
else laser_cooldown_heat = 0;

if (ion_heat >= ion_cooldown_speed) ion_heat -= ion_cooldown_speed;
else ion_heat = 0;

if (drone_heat >= drone_cooldown_speed) drone_heat -= drone_cooldown_speed;
else drone_heat = 0;

if hull_health < hull_level {
	hull_health += hull_repair_speed;
}

if healers > 0 {
	hp += healer_repair_speed*healers;
	hp = clamp(hp, 0, current_max_hp);
}

alarm_set(1, 5);