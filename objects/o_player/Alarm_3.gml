/// @description flak / missile flak heat reduction

if (flak_heat >= flak_cooldown_speed) flak_heat -= flak_cooldown_speed;
else flak_heat = 0;

if (missile_flak_heat >= flak_cooldown_speed) missile_flak_heat -= flak_cooldown_speed;
else missile_flak_heat = 0;

alarm_set(3, 5);