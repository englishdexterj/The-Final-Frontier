// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_spawn_enemy_initiate() {
	var k = 0;

	enemy[k][0] = o_enemy_basic; //type
	enemy[k][1] = 1; //points
	enemy[k][2] = 1; //chance
	enemy[k][3] = 1; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Fighter"; //name
	k++;
	
	enemy[k][0] = o_enemy_suicider;
	enemy[k][1] = 1;
	enemy[k][2] = 1;
	enemy[k][3] = 2; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Suicider"; //name
	k++;

	enemy[k][0] = o_enemy_ion;
	enemy[k][1] = 1;
	enemy[k][2] = .25;
	enemy[k][3] = 5; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Ion"; //name
	k++;

	enemy[k][0] = o_enemy_marauder;
	enemy[k][1] = 2;
	enemy[k][2] = .5;
	enemy[k][3] = 10; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Marauder"; //name
	k++;

	enemy[k][0] = o_enemy_bomber;
	enemy[k][1] = 2;
	enemy[k][2] = .85;
	enemy[k][3] = 20; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Bomber"; //name
	k++;
	
	enemy[k][0] = o_enemy_sentinel;
	enemy[k][1] = 3;
	enemy[k][2] = .5;
	enemy[k][3] = 25; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Sentinel"; //name
	k++;

	enemy[k][0] = o_enemy_rusher; //rusher
	enemy[k][1] = 3;
	enemy[k][2] = .5;
	enemy[k][3] = 30; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Rusher"; //name
	k++;

	enemy[k][0] = o_enemy_sniper; //ranger
	enemy[k][1] = 3;
	enemy[k][2] = .5;
	enemy[k][3] = 35; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Ranger"; //name
	k++;

	enemy[k][0] = o_enemy_gunship;
	enemy[k][1] = 4;
	enemy[k][2] = .75;
	enemy[k][3] = 40; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Gunship"; //name
	k++;

	enemy[k][0] = o_enemy_destroyer;
	enemy[k][1] = 8;
	enemy[k][2] = .5;
	enemy[k][3] = 50; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Destroyer"; //name
	k++;

	enemy[k][0] = o_enemy_shotgunner; //shotgunner
	enemy[k][1] = 5;
	enemy[k][2] = .5;
	enemy[k][3] = 60; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Shotgunner"; //name
	k++;

	enemy[k][0] = o_enemy_swarmer_controller; //swarmer
	enemy[k][1] = 3;
	enemy[k][2] = .5;
	enemy[k][3] = 70; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Swarmer"; //name
	k++;

	enemy[k][0] = o_enemy_heavy_cruiser;
	enemy[k][1] = 12;
	enemy[k][2] = .2;
	enemy[k][3] = 80; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Heavy Cruiser"; //name
	k++;

	enemy[k][0] = o_enemy_battlecruiser;
	enemy[k][1] = 25;
	enemy[k][2] = .1;
	enemy[k][3] = 100; //introduction
	enemy[k][4] = 0; //total spawned
	enemy[k][5] = "Battlecruiser"; //name
	k++;
	
	return k;
}