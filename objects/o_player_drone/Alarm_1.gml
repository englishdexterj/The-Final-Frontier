/// @description gun heat reduction

if (heat >= cooldown_speed) heat -= cooldown_speed;
else heat = 0;

alarm_set(1, 10);
