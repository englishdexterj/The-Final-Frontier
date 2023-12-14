function sc_initialize_menu_start() {
	enum char {
		fighter,
		bomber,
		summoner,
		healer,
		basher
	}
	
	character[char.fighter][0] = "Fighter"; //name
	character[char.bomber][0] = "Bomber";
	character[char.summoner][0] = "Summoner";
	character[char.healer][0] = "Healer";
	character[char.basher][0] = "Basher";
	
	character[char.fighter][1] = 5; //hp
	character[char.bomber][1] = 8;
	character[char.summoner][1] = 3;
	character[char.healer][1] = 5;
	character[char.basher][1] = 6;
	
	character[char.fighter][2] = "Blaster"; //weapon
	character[char.bomber][2] = "Missile";
	character[char.summoner][2] = "Drones";
	character[char.healer][2] = "Blaster";
	character[char.basher][2] = "None";
	
	character[char.fighter][3] = "Standard fighter ship with blaster"; //description
	character[char.bomber][3] = "Slow moving and equipped with missiles";
	character[char.summoner][3] = "Spawns attack drones and uses \nautomatic turrets";
	character[char.healer][3] = "Fixes hull damage over time";
	character[char.basher][3] = "Takes no damage from running\ninto enemies";
	
	character[char.fighter][4] = 0; //cost
	character[char.bomber][4] = 250;
	character[char.summoner][4] = 500;
	character[char.healer][4] = 500;
	character[char.basher][4] = 1000;
	
	character[char.fighter][5] = 20; //base speed
	character[char.bomber][5] = 17;
	character[char.summoner][5] = 22;
	character[char.healer][5] = 18;
	character[char.basher][5] = 25;
	
	ascension_text[0] = "";
	ascension_text[1] = "More Enemies";
	ascension_text[2] = "Faster Enemies";
	ascension_text[3] = "More Enemy Shields";
	ascension_text[4] = "More High Level Enemies";
	ascension_text[5] = "Faster Enemy Gun Cooldown";
	ascension_text[6] = "More Enemies";
	ascension_text[7] = "All Enemies Have Flak";
	ascension_text[8] = "All Enemy Missiles Plated";
	ascension_text[9] = "More Enemies";
	ascension_text[10] = "Enemies Have More Health";
	ascension_text[11] = "Less Player Health";
	ascension_text[12] = "More Enemy Shields";
	ascension_text[13] = "More High Level Enemies";
	ascension_text[14] = "Faster Enemies";
	ascension_text[15] = "One Health";
	
	if room = menu {
		global.selected_character = 0;
		selected_character_y = 0;
	
		pressing_left = false;
		pressing_right = false;
		pressing = false;
	
		ini_open("data.ini");

		if !ini_section_exists("ascensions") {
			for (var i = 0; i < 5; i++) {
				ini_write_real("ascensions", i, -1);
				global.ascension_modifier_max[i] = -1;
				global.ascension_modifier[i] = 0;
			}
			ini_write_real("ascensions", 0, 0);
			global.ascension_modifier_max[0] = 0;
		} else {
			for (var i = 0; i < 5; i++) {
				if !ini_key_exists("ascensions", i) {
					ini_write_real("ascensions", i, -1);
					global.ascension_modifier_max[i] = -1;
					global.ascension_modifier[i] = 0;
				
					if i = 0 {
						global.ascension_modifier_max[0] = 0;
						ini_write_real("ascensions", 0, 0);
					}
				} else {
					global.ascension_modifier_max[i] = ini_read_real("ascensions", i, 0);
					global.ascension_modifier[i] = 0;
				}
			}
		}
		
		if !ini_section_exists("colors") {
			for (var i = 0; i < 5; i++) {
				for (var j = 0; j < 5; j++) {
					ini_write_real("colors", string(i) + ":" + string(j), 0);
					global.color_modifier_purchased[i][j] = 0;
					global.color_modifier[i] = 0;
					
					if j = 0 {
						global.color_modifier_purchased[i][0] = 1;
						ini_write_real("colors", string(i) + ":0", 1);
					}
				}
			}
		} else {
			for (var i = 0; i < 5; i++) {
				for (var j = 0; j < 5; j++) {
					if !ini_key_exists("colors", string(i) + ":" + string(j)) {
						ini_write_real("colors", string(i) + ":" + string(j), 0);
						global.color_modifier_purchased[i][j] = 0;
						global.color_modifier[i] = 0;
				
						if j = 0 {
							global.color_modifier_purchased[i][0] = 1;
							ini_write_real("colors", string(i) + ":0", 1);
						}
					} else {
						global.color_modifier_purchased[i][j] = ini_read_real("colors", string(i) + ":" + string(j), 0);
						global.color_modifier[i] = 0;
					}
				}
			}
		}
	
		ini_close();
	}
	
	enum colors {
		blue,
		green,
		orange,
		purple,
		yellow
	}
	
	color[colors.blue][0] = "Blue"; //color
	color[colors.green][0] = "Green";
	color[colors.orange][0] = "Orange";
	color[colors.purple][0] = "Purple";
	color[colors.yellow][0] = "Yellow";
	
	color[colors.blue][1] = 0; //cost
	color[colors.green][1] = 500;
	color[colors.orange][1] = 500;
	color[colors.purple][1] = 500;
	color[colors.yellow][1] = 500;
	
	color[colors.blue][2] = "No Modifier"; //description
	color[colors.green][2] = "+1 Health";
	color[colors.orange][2] = "+10% Gun Cooldown";
	color[colors.purple][2] = "+5% Point Gain";
	color[colors.yellow][2] = "+20% Speed";
}