/// @description spawning heat reduction

if (spawn_heat >= cooldown_speed) spawn_heat -= cooldown_speed;
else spawn_heat = 0;

alarm_set(3, 10);