// Script assets have changed for v2.3.0 see
// https"//help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_initalize_upgrade_sprites(){
	upgrade[k, up.name] = "Bullet Speed";		upgrade[k, up.sprite] = 26; 				upgrade[k, up.req1] = 13; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Quad Shot";			upgrade[k, up.sprite] = 10; 				upgrade[k, up.req1] = 22; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shooting Speed";		upgrade[k, up.sprite] = 32; 				upgrade[k, up.req1] = 21; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Gun Cooldown";		upgrade[k, up.sprite] = 76; 				upgrade[k, up.req1] = 22; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Triple Shot";		upgrade[k, up.sprite] = 8; 					upgrade[k, up.req1] = 31; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Ion Recharge";		upgrade[k, up.sprite] = 62; 				upgrade[k, up.req1] = 32; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Cloak Length";		upgrade[k, up.sprite] = 68; 				upgrade[k, up.req1] = 33; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Turn Speed";			upgrade[k, up.sprite] = 50; 				upgrade[k, up.req1] = 37; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Flak Speed";			upgrade[k, up.sprite] = 36; 				upgrade[k, up.req1] = 30; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Flak";				upgrade[k, up.sprite] = 38; 				upgrade[k, up.req1] = 31; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Dual Shot";			upgrade[k, up.sprite] = 6; 					upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Ion Cannon";			upgrade[k, up.sprite] = 60; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloaking Device";	upgrade[k, up.sprite] = 64; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloak Recharge";		upgrade[k, up.sprite] = 66; 				upgrade[k, up.req1] = 33; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Rammer";				upgrade[k, up.sprite] = 34; 				upgrade[k, up.req1] = 38; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Hull Upgrade";		upgrade[k, up.sprite] = 28; 				upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = o_player.max_hp; k++;
	upgrade[k, up.name] = "Speed";				upgrade[k, up.sprite] = 30; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Single Shot";		upgrade[k, up.sprite] = 80; 				upgrade[k, up.req1] = -4; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shield";				upgrade[k, up.sprite] = 22; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shield Strength";	upgrade[k, up.sprite] = 70; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Shield Regen";		upgrade[k, up.sprite] = 72; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 2; k++;
	upgrade[k, up.name] = "Dual Missiles";		upgrade[k, up.sprite] = 12; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Missiles";			upgrade[k, up.sprite] = 4; 					upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Acceleration";		upgrade[k, up.sprite] = 78; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Laser";				upgrade[k, up.sprite] = 20; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Sensors UNUSED";		upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Missile Reload";		upgrade[k, up.sprite] = 74; 				upgrade[k, up.req1] = 47; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Missile Defense";	upgrade[k, up.sprite] = 48; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Drone Ship";			upgrade[k, up.sprite] = 24; 				upgrade[k, up.req1] = 49; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Laser Length UNUSED";upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Drone Construction";	upgrade[k, up.sprite] = 58; 				upgrade[k, up.req1] = 58; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Drone Hardware";		upgrade[k, up.sprite] = 40; 				upgrade[k, up.req1] = 67; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 2; k++;
	upgrade[k, up.name] = "Missile Tracking";	upgrade[k, up.sprite] = 56; 				upgrade[k, up.req1] = 21; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Plated Missiles";	upgrade[k, up.sprite] = 54; 				upgrade[k, up.req1] = 22; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Missile Reload";		upgrade[k, up.sprite] = 74; 				upgrade[k, up.req1] = 22; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Triple Missiles";	upgrade[k, up.sprite] = 14; 				upgrade[k, up.req1] = 31; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Ion Recharge";		upgrade[k, up.sprite] = 62; 				upgrade[k, up.req1] = 32; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Cloak Length";		upgrade[k, up.sprite] = 68; 				upgrade[k, up.req1] = 33; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Turn Speed";			upgrade[k, up.sprite] = 50; 				upgrade[k, up.req1] = 38; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Missile Defense";	upgrade[k, up.sprite] = 48; 				upgrade[k, up.req1] = 31; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Dual Missiles";		upgrade[k, up.sprite] = 12; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Ion Cannon";			upgrade[k, up.sprite] = 60; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloaking Device";	upgrade[k, up.sprite] = 64; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloak Recharge";		upgrade[k, up.sprite] = 66; 				upgrade[k, up.req1] = 33; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Rammer";				upgrade[k, up.sprite] = 34; 				upgrade[k, up.req1] = 38; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Hull Upgrade";		upgrade[k, up.sprite] = 28; 				upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = o_player.max_hp; k++;
	upgrade[k, up.name] = "Speed";				upgrade[k, up.sprite] = 30; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Missiles";			upgrade[k, up.sprite] = 4; 					upgrade[k, up.req1] = -4; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shield";				upgrade[k, up.sprite] = 22; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shield Strength";	upgrade[k, up.sprite] = 70; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Shield Regen";		upgrade[k, up.sprite] = 72; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Dual Shot";			upgrade[k, up.sprite] = 6; 					upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Single Shot";		upgrade[k, up.sprite] = 80; 				upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Acceleration";		upgrade[k, up.sprite] = 78; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Laser";				upgrade[k, up.sprite] = 20; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Sensors UNUSED";		upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Gun Cooldown";		upgrade[k, up.sprite] = 76; 				upgrade[k, up.req1] = 47; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Flak";				upgrade[k, up.sprite] = 38; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Drone Ship";			upgrade[k, up.sprite] = 24; 				upgrade[k, up.req1] = 49; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Laser Length UNUSED";upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Flak Speed";			upgrade[k, up.sprite] = 36; 				upgrade[k, up.req1] = 57; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Drone Construction";	upgrade[k, up.sprite] = 58; 				upgrade[k, up.req1] = 58; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Drone Hardware";		upgrade[k, up.sprite] = 40; 				upgrade[k, up.req1] = 31; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 2; k++;
	upgrade[k, up.name] = "Ion Recharge";		upgrade[k, up.sprite] = 62; 				upgrade[k, up.req1] = 32; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Cloak Length";		upgrade[k, up.sprite] = 68; 				upgrade[k, up.req1] = 33; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Turn Speed";			upgrade[k, up.sprite] = 50; 				upgrade[k, up.req1] = 38; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Max Drones";			upgrade[k, up.sprite] = 82; 				upgrade[k, up.req1] = 31; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Drone Construction";	upgrade[k, up.sprite] = 58; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Ion Cannon";			upgrade[k, up.sprite] = 60; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloaking Device";	upgrade[k, up.sprite] = 64; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloak Recharge";		upgrade[k, up.sprite] = 66; 				upgrade[k, up.req1] = 33; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Rammer";				upgrade[k, up.sprite] = 34; 				upgrade[k, up.req1] = 38; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Hull Upgrade";		upgrade[k, up.sprite] = 28; 				upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = o_player.max_hp; k++;
	upgrade[k, up.name] = "Speed";				upgrade[k, up.sprite] = 30; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Drone Ship";			upgrade[k, up.sprite] = 24; 				upgrade[k, up.req1] = -4; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shield";				upgrade[k, up.sprite] = 22; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shield Strength";	upgrade[k, up.sprite] = 70; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Shield Regen";		upgrade[k, up.sprite] = 72; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Acceleration";		upgrade[k, up.sprite] = 78; 				upgrade[k, up.req1] = 37; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Gun Cooldown";		upgrade[k, up.sprite] = 76; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Single Shot";		upgrade[k, up.sprite] = 80; 				upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Gun Turret";			upgrade[k, up.sprite] = 88; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 2; k++;
	upgrade[k, up.name] = "Missile Turret";		upgrade[k, up.sprite] = 82; 				upgrade[k, up.req1] = 49; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Laser";				upgrade[k, up.sprite] = 20; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Flak";						upgrade[k, up.sprite] = 38; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Turret Cooldown";			upgrade[k, up.sprite] = 90; 				upgrade[k, up.req1] = 49; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Missile Turret Cooldown";	upgrade[k, up.sprite] = 84; 				upgrade[k, up.req1] = 50; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Laser Length UNUSED";		upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Flak Speed";					upgrade[k, up.sprite] = 36; 				upgrade[k, up.req1] = 57; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Turret Turn Speed";			upgrade[k, up.sprite] = 92; 				upgrade[k, up.req1] = 58; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Missile Turret Turn Speed";	upgrade[k, up.sprite] = 86; 				upgrade[k, up.req1] = 59; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Flak Speed";			upgrade[k, up.sprite] = 36; 				upgrade[k, up.req1] = 21; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Flak";				upgrade[k, up.sprite] = 38; 				upgrade[k, up.req1] = 30; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Health";				upgrade[k, up.sprite] = 96; 				upgrade[k, up.req1] = 31; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 8; k++;
	upgrade[k, up.name] = "Cloak Length";		upgrade[k, up.sprite] = 68; 				upgrade[k, up.req1] = 32; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Ion Recharge";		upgrade[k, up.sprite] = 62; 				upgrade[k, up.req1] = 34; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Gun Cooldown";		upgrade[k, up.sprite] = 76; 				upgrade[k, up.req1] = 30; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Dual Shot";			upgrade[k, up.sprite] = 6; 					upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Healer Nanites";		upgrade[k, up.sprite] = 98; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 4; k++;
	upgrade[k, up.name] = "Cloaking Device";	upgrade[k, up.sprite] = 64; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloak Recharge";		upgrade[k, up.sprite] = 66; 				upgrade[k, up.req1] = 32; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Ion Cannon";			upgrade[k, up.sprite] = 60; 				upgrade[k, up.req1] = 43; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Turn Speed";			upgrade[k, up.sprite] = 50; 				upgrade[k, up.req1] = 38; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Rammer";				upgrade[k, up.sprite] = 34; 				upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Speed";				upgrade[k, up.sprite] = 30; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Hull Upgrade";		upgrade[k, up.sprite] = 28; 				upgrade[k, up.req1] = -4; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = o_player.max_hp; k++;
	upgrade[k, up.name] = "Shield";				upgrade[k, up.sprite] = 22; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shield Strength";	upgrade[k, up.sprite] = 70; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Shield Regen";		upgrade[k, up.sprite] = 72; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Dual Missiles";		upgrade[k, up.sprite] = 12; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Missiles";			upgrade[k, up.sprite] = 4; 					upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Acceleration";		upgrade[k, up.sprite] = 78; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Laser";				upgrade[k, up.sprite] = 20; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Sensors UNUSED";		upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Missile Reload";		upgrade[k, up.sprite] = 74; 				upgrade[k, up.req1] = 47; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Missile Defense";	upgrade[k, up.sprite] = 48; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Drone Ship";			upgrade[k, up.sprite] = 24; 				upgrade[k, up.req1] = 49; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Laser Length UNUSED";upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Drone Construction";	upgrade[k, up.sprite] = 58; 				upgrade[k, up.req1] = 58; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Drone Hardware";		upgrade[k, up.sprite] = 40; 				upgrade[k, up.req1] = 67; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 2; k++;
	upgrade[k, up.name] = "Gun Cooldown";		upgrade[k, up.sprite] = 76; 				upgrade[k, up.req1] = 13; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Dual Shot";			upgrade[k, up.sprite] = 6; 					upgrade[k, up.req1] = 22; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Flak Speed";			upgrade[k, up.sprite] = 36; 				upgrade[k, up.req1] = 21; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Flak";				upgrade[k, up.sprite] = 38; 				upgrade[k, up.req1] = 22; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Single Shot";		upgrade[k, up.sprite] = 80; 				upgrade[k, up.req1] = 31; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Ion Recharge";		upgrade[k, up.sprite] = 62; 				upgrade[k, up.req1] = 32; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Cloak Length";		upgrade[k, up.sprite] = 68; 				upgrade[k, up.req1] = 33; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Turn Speed";			upgrade[k, up.sprite] = 50; 				upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Acceleration";		upgrade[k, up.sprite] = 78; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 5; k++;
	upgrade[k, up.name] = "Ion Cannon";			upgrade[k, up.sprite] = 60; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloaking Device";	upgrade[k, up.sprite] = 64; 				upgrade[k, up.req1] = 42; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Cloak Recharge";		upgrade[k, up.sprite] = 66; 				upgrade[k, up.req1] = 33; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Speed";				upgrade[k, up.sprite] = 30; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 6; k++;
	upgrade[k, up.name] = "Rammer";				upgrade[k, up.sprite] = 34; 				upgrade[k, up.req1] = -4; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Shield Strength";	upgrade[k, up.sprite] = 70; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 6; k++;
	upgrade[k, up.name] = "Shield Regen";		upgrade[k, up.sprite] = 72; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Dual Missiles";		upgrade[k, up.sprite] = 12; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Missiles";			upgrade[k, up.sprite] = 4; 					upgrade[k, up.req1] = 39; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Hull Upgrade";		upgrade[k, up.sprite] = 28; 				upgrade[k, up.req1] = 40; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = o_player.max_hp; k++;
	upgrade[k, up.name] = "Laser";				upgrade[k, up.sprite] = 20; 				upgrade[k, up.req1] = 41; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Sensors UNUSED";		upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Missile Reload";		upgrade[k, up.sprite] = 74; 				upgrade[k, up.req1] = 47; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Missile Defense";	upgrade[k, up.sprite] = 48; 				upgrade[k, up.req1] = 48; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Drone Ship";			upgrade[k, up.sprite] = 24; 				upgrade[k, up.req1] = 49; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 1; k++;
	upgrade[k, up.name] = "Laser Length UNUSED";upgrade[k, up.sprite] = 0; 					upgrade[k, up.req1] = 80; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = -4; k++;
	upgrade[k, up.name] = "Drone Construction";	upgrade[k, up.sprite] = 58; 				upgrade[k, up.req1] = 58; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 3; k++;
	upgrade[k, up.name] = "Drone Hardware";		upgrade[k, up.sprite] = 40; 				upgrade[k, up.req1] = 67; 					upgrade[k, up.req2] = -4;  					upgrade[k, up.active_max] = 2; k++;
}