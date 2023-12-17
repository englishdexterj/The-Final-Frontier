image_xscale = global.scale;
image_yscale = image_xscale;

points = 1600;

#region sides
for (var i = 0; i < 4; i++) {
	with instance_create_layer(x, y, "Instances", o_station_side) {
		type = irandom(3);
		image_xscale = global.scale;
		image_yscale = image_xscale;
		image_index = i*4 + type;
		parent = other.id;
		
		if type = 0 { //blank
			
		} else if type = 1 { //hatch
			if i = 0 {
				with instance_create_layer(x+159*global.scale, y-13*global.scale, "Instances_Upper_Middle", o_station_hatch) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					x_start = 159;
					y_start = -13;
					parent = other.id;
				}
				with instance_create_layer(x+159*global.scale, y-39*global.scale, "Instances_Upper_Middle", o_station_hatch) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					x_start = 159;
					y_start = -39;
					parent = other.id;
				}
			} else if i = 1 {
				with instance_create_layer(x+38*global.scale, y+158*global.scale, "Instances_Upper_Middle", o_station_hatch) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 270;
					image_index = 0;
					x_start = 38;
					y_start = 158;
					parent = other.id;
				}
				with instance_create_layer(x+12*global.scale, y+158*global.scale, "Instances_Upper_Middle", o_station_hatch) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 270;
					image_index = 0;
					x_start = 12;
					y_start = 158;
					parent = other.id;
				}
			} else if i = 2 {
				with instance_create_layer(x-158*global.scale, y+12*global.scale, "Instances_Upper_Middle", o_station_hatch) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 180;
					image_index = 0;
					x_start = -158;
					y_start = 12;
					parent = other.id;
				}
				with instance_create_layer(x-158*global.scale, y+38*global.scale, "Instances_Upper_Middle", o_station_hatch) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 180;
					image_index = 0;
					x_start = -158;
					y_start = 38;
					parent = other.id;
				}
			} else if i = 3 {
				with instance_create_layer(x-13*global.scale, y-159*global.scale, "Instances_Upper_Middle", o_station_hatch) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 90;
					image_index = 0;
					x_start = -13;
					y_start = -159;
					parent = other.id;
				}
				with instance_create_layer(x-39*global.scale, y-159*global.scale, "Instances_Upper_Middle", o_station_hatch) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 90;
					image_index = 0;
					x_start = -39;
					y_start = -159;
					parent = other.id;
				}
			}
		} else if type = 2 { //missile
			if i = 0 {
				with instance_create_layer(x+168*global.scale, y-12*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = 168;
					y_start = -12;
				}
				with instance_create_layer(x+185*global.scale, y-12*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = 185;
					y_start = -12;
				}
				with instance_create_layer(x+185*global.scale, y-29*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = 185;
					y_start = -29;
				}
				with instance_create_layer(x+168*global.scale, y-29*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = 168;
					y_start = -29;
				}
			} else if i = 1 {
				with instance_create_layer(x+11*global.scale, y+167*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = 11;
					y_start = 167;
				}
				with instance_create_layer(x+28*global.scale, y+167*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = 28;
					y_start = 167;
				}
				with instance_create_layer(x+28*global.scale, y+184*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = 28;
					y_start = 184;
				}
				with instance_create_layer(x+11*global.scale, y+184*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = 11;
					y_start = 185;
				}
			} else if i = 2 {
				with instance_create_layer(x-167*global.scale, y+10*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = -167;
					y_start = 10;
				}
				with instance_create_layer(x-167*global.scale, y+27*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = -167;
					y_start = 27;
				}
				with instance_create_layer(x-184*global.scale, y+10*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = -184;
					y_start = 10;
				}
				with instance_create_layer(x-184*global.scale, y+27*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = -184;
					y_start = 27;
				}
			} else if i = 3 {
				with instance_create_layer(x-10*global.scale, y-168*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = -10;
					y_start = -168;
				}
				with instance_create_layer(x-27*global.scale, y-168*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = -27;
					y_start = -168;
				}
				with instance_create_layer(x-10*global.scale, y-185*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = -10;
					y_start = -185;
				}
				with instance_create_layer(x-27*global.scale, y-185*global.scale, "Instances_Upper_Middle", o_station_rocket_launcher) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					parent = other.id;
					x_start = -27;
					y_start = -185;
					
				}
			}
		} else if type = 3 { //shield
			if i = 0 {
				with instance_create_layer(x+169*global.scale, y-3*global.scale, "Instances_Upper_Middle", o_station_shield) {
					shield_type = 2;
					shield_size = 1;
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = (shield_type-1) * 6;
					x_start = 169;
					y_start = -3;
					parent = other.id;
				}
			} else if i = 1 {
				with instance_create_layer(x+1*global.scale, y+169*global.scale, "Instances_Upper_Middle", o_station_shield) {
					shield_type = 2;
					shield_size = 1;
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = (shield_type-1) * 6;
					x_start = 1;
					y_start = 169;
					parent = other.id;
				}
			} else if i = 2 {
				with instance_create_layer(x-169*global.scale, y+1*global.scale, "Instances_Upper_Middle", o_station_shield) {
					shield_type = 2;
					shield_size = 1;
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = (shield_type-1) * 6;
					x_start = -169;
					y_start = 1;
					parent = other.id;
				}
			} else if i = 3 {
				with instance_create_layer(x-1*global.scale, y-169*global.scale, "Instances_Upper_Middle", o_station_shield) {
					shield_type = 2;
					shield_size = 1;
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = (shield_type-1) * 6;
					x_start = -1;
					y_start = -169;
					parent = other.id;
				}
			}
		}
	}
}
#endregion

#region corners
for (var i = 0; i < 4; i++) {
	with instance_create_layer(x, y, "Instances", o_station_corner) {
		type = irandom(3);
		image_xscale = global.scale;
		image_yscale = image_xscale;
		image_index = i*4 + type;
		parent = other.id;
		
		if type = 0 { //conveyor
			if i = 0 {
				with instance_create_layer(x+158*global.scale, y-75*global.scale, "Instances_Upper_Middle", o_enemy_turret_station_double) {
					on_station = true;
					pt = other.id;
					x_start = 158;
					y_start = -75;
					parent = other.id;
					depth--;
				}
			} else if i = 1 {
				with instance_create_layer(x+75*global.scale, y+158*global.scale, "Instances_Upper_Middle", o_enemy_turret_station_double) {
					on_station = true;
					pt = other.id;
					x_start = 75;
					y_start = 158;
					parent = other.id;
					depth--;
				}
			} else if i = 2 {
				with instance_create_layer(x-158*global.scale, y+75*global.scale, "Instances_Upper_Middle", o_enemy_turret_station_double) {
					on_station = true;
					pt = other.id;
					x_start = -158;
					y_start = 75;
					parent = other.id;
					depth--;
				}
			} else if i = 3 {
				with instance_create_layer(x-75*global.scale, y-158*global.scale, "Instances_Upper_Middle", o_enemy_turret_station_double) {
					on_station = true;
					pt = other.id;
					x_start = -75;
					y_start = -158;
					parent = other.id;
					depth--;
				}
			}
		} else if type = 1 { //helipad
			if i = 0 {
				with instance_create_layer(x+77*global.scale, y-154*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = 45;
					direction = image_angle;
					idle = true;
					upgrades = 0;
					x_start = 77;
					y_start = -154;
					parent = other.id;
				}
				with instance_create_layer(x+100*global.scale, y-133*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = 45;
					direction = image_angle;
					idle = true;
					upgrades = 0;
					x_start = 100;
					y_start = -133;
					parent = other.id;
				}
				with instance_create_layer(x+122*global.scale, y-111*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = 45;
					direction = image_angle;
					idle = true;
					upgrades = 0;
					x_start = 122;
					y_start = -111;
					parent = other.id;
				}
			} else if i = 1 {
				with instance_create_layer(x+154*global.scale, y+77*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = -45;
					direction = image_angle;
					idle = true;
					upgrades = 0; 
					x_start = 154;
					y_start = 77;
					parent = other.id;
				}
				with instance_create_layer(x+132*global.scale, y+99*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = -45;
					direction = image_angle;
					idle = true;
					upgrades = 0; 
					x_start = 132;
					y_start = 99;
					parent = other.id;
				}
				with instance_create_layer(x+110*global.scale, y+121*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = -45;
					direction = image_angle;
					idle = true;
					upgrades = 0;
					x_start = 110;
					y_start = 121;
					parent = other.id;
				}
			} else if i = 2 {
				with instance_create_layer(x-78*global.scale, y+155*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = -135;
					direction = image_angle;
					idle = true;
					upgrades = 0;
					x_start = -78;
					y_start = 155;
					parent = other.id;
				}
				with instance_create_layer(x-100*global.scale, y+133*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = -135;
					direction = image_angle;
					idle = true;
					upgrades = 0;
					x_start = -100;
					y_start = 133;
					parent = other.id;
				}
				with instance_create_layer(x-122*global.scale, y+111*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = -135;
					direction = image_angle;
					idle = true;
					upgrades = 0; 
					x_start = -122;
					y_start = 111;
					parent = other.id;
				}
			} else if i = 3 {
				with instance_create_layer(x-111*global.scale, y-121*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = 135;
					direction = image_angle;
					idle = true;
					upgrades = 0;
					x_start = -111;
					y_start = -121;
					parent = other.id;
				}
				with instance_create_layer(x-133*global.scale, y-99*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = 135;
					direction = image_angle;
					idle = true;
					upgrades = 0;
					x_start = -133;
					y_start = -99;
					parent = other.id;
				}
				with instance_create_layer(x-155*global.scale, y-77*global.scale, "Instances_Top", choose(o_enemy_basic, o_enemy_basic, o_enemy_suicider, o_enemy_suicider, o_enemy_bomber, o_enemy_rusher, o_enemy_ion, o_enemy_bomber)) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					image_angle = 135;
					direction = image_angle;
					idle = true;
					upgrades = 0; 
					x_start = -155;
					y_start = -77;
					parent = other.id;
				}
			}
		} else if type = 2 { //hanger
			if i = 0 {
				with instance_create_layer(x+59*global.scale, y-59*global.scale, "Instances", o_station_hanger) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_index = 0;
					x_start = 59;
					y_start = -59;
					parent = other.id;
				}
				image_alpha = 0;
				//instance_destroy();
			} else if i = 1 {
				with instance_create_layer(x+56*global.scale, y+56*global.scale, "Instances", o_station_hanger) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 270;
					image_index = 0;
					x_start = 56;
					y_start = 56;
					parent = other.id;
				}
				image_alpha = 0;
				//instance_destroy();
			} else if i = 2 {
				with instance_create_layer(x-61*global.scale, y+57*global.scale, "Instances", o_station_hanger) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 180;
					image_index = 0;
					x_start = -61;
					y_start = 57;
					parent = other.id;
				}
				image_alpha = 0;
				//instance_destroy();
			} else if i = 3 {
				with instance_create_layer(x-59*global.scale, y-59*global.scale, "Instances", o_station_hanger) {
					image_xscale = global.scale;
					image_yscale = image_xscale;
					image_angle = 90;
					image_index = 0;
					x_start = -59;
					y_start = -59;
					parent = other.id;
				}
				image_alpha = 0;
				//instance_destroy();
			}
		} else if type = 3 { //blank
			
		}
	}
}
#endregion

with instance_create_layer(x+83*global.scale, y-43*global.scale, "Instances_Upper_Middle", o_station_shield) {
	shield_type = 1;
	shield_size = 2;
	image_xscale = global.scale;
	image_yscale = image_xscale;
	image_index = (shield_type-1) * 6;
	x_start = 83;
	y_start = -43;
	parent = other.id;
}

with instance_create_layer(x+83*global.scale, y-43*global.scale, "Instances_Upper_Middle", o_station_shield) {
	shield_type = 3;
	shield_size = 2;
	image_xscale = global.scale;
	image_yscale = image_xscale;
	image_index = (shield_type-1) * 6;
	x_start = -75;
	y_start = 53;
	parent = other.id;
}

with instance_create_layer(x+1*global.scale, y-1*global.scale, "Instances_Upper_Middle", o_station_core) {
	image_xscale = global.scale;
	image_yscale = image_xscale;
	image_index = 0;
	x_start = 1;
	y_start = -1;
	parent = other.id;
}

with instance_create_layer(x+16*global.scale, y-52*global.scale, "Instances_Upper_Middle", choose(o_enemy_turret_station, o_enemy_turret_station_double)) {
	on_station = true;
	pt = other.id;
	x_start = 16;
	y_start = -52;
	depth--;
}


with instance_create_layer(x+83*global.scale, y-17*global.scale, "Instances_Upper_Middle", choose(o_enemy_turret_station, o_enemy_turret_station_double)) {
	on_station = true;
	pt = other.id;
	x_start = 83;
	y_start = -17;
	depth--;
}

with instance_create_layer(x+41*global.scale, y-99*global.scale, "Instances_Upper_Middle", choose(o_enemy_turret_station, o_enemy_turret_station_double)) {
	on_station = true;
	pt = other.id;
	x_start = 41;
	y_start = -99;
	depth--;
}

with instance_create_layer(x+83*global.scale, y-1*global.scale, "Instances_Upper_Middle", choose(o_enemy_turret_station, o_enemy_turret_station_double)) {
	on_station = true;
	pt = other.id;
	x_start = 83;
	y_start = -1;
	depth--;
}

with instance_create_layer(x+36*global.scale, y+101*global.scale, "Instances_Upper_Middle", choose(o_enemy_turret_station, o_enemy_turret_station_double)) {
	on_station = true;
	pt = other.id;
	x_start = 36;
	y_start = 101;
	depth--;
}

with instance_create_layer(x-34*global.scale, y+102*global.scale, "Instances_Upper_Middle", choose(o_enemy_turret_station, o_enemy_turret_station_double)) {
	on_station = true;
	pt = other.id;
	x_start = -34;
	y_start = 102;
	depth--;
}

with instance_create_layer(x-98*global.scale, y-23*global.scale, "Instances_Upper_Middle", choose(o_enemy_turret_station, o_enemy_turret_station_double)) {
	on_station = true;
	pt = other.id;
	x_start = -98;
	y_start = -23;
	depth--;
}