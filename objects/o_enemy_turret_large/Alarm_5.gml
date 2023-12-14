/// @description flak heat reduction

if (flak_heat >= cooldown_speed) flak_heat -= cooldown_speed;
else flak_heat = 0;

alarm_set(5, 5);