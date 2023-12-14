function sc_init_part() {
	#region Explosion Particle
	
	//engine
	var _en = part_type_create();
	part_type_sprite(_en, s_triangle, false, false, false);
	part_type_life(_en, 10, 30);
	part_type_alpha2(_en, 1, 0);
	//part_type_speed(_en, 0, o_player.spd, 0, 0);
	//part_type_direction(_en, o_player.direction - 190 , o_player.direction - 170, 0, 0);
	part_type_orientation(_en, 0, 359, 0, 0, false);
	part_type_scale(_en, .5*global.scale, .5*global.scale);
	
	part_type_color2(_en, make_color_rgb(255, 0, 0), make_color_rgb(255, 128, 0));
	
	global.pt_engine = _en;
	//
	
	//shield
	var _ps = part_type_create();
	part_type_sprite(_ps, s_triangle, false, false, false);
	part_type_life(_ps, 20, 60);
	part_type_alpha2(_ps, 1, 0);
	part_type_speed(_ps, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_ps, 0, 359, 0, 0);
	part_type_orientation(_ps, 0, 359, 0, 0, false);
	part_type_scale(_ps, .5*global.scale, .5*global.scale);
	
	part_type_color2(_ps, make_color_rgb(100, 100, 255), c_black);
	
	global.pt_shield = _ps;
	//
	
	//shield enemy
	var _ps = part_type_create();
	part_type_sprite(_ps, s_triangle, false, false, false);
	part_type_life(_ps, 20, 60);
	part_type_alpha2(_ps, 1, 0);
	part_type_speed(_ps, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_ps, 0, 359, 0, 0);
	part_type_orientation(_ps, 0, 359, 0, 0, false);
	part_type_scale(_ps, .5*global.scale, .5*global.scale);
	
	part_type_color2(_ps, make_color_rgb(255, 100, 100), c_black);
	
	global.pt_shield_enemy = _ps;
	//
	
	//flak white
	var _pf = part_type_create();
	part_type_sprite(_pf, s_triangle, false, false, false);
	part_type_life(_pf, 20, 60);
	part_type_alpha2(_pf, 1, 0);
	part_type_speed(_pf, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pf, 0, 359, 0, 0);
	part_type_orientation(_pf, 0, 359, 0, 0, false);
	part_type_scale(_pf, .25*global.scale, .25*global.scale);
	
	part_type_color2(_pf, make_color_rgb(200, 200, 200), c_black);
	
	global.pt_flak = _pf;
	//
	
	//flak red
	var _pfe = part_type_create();
	part_type_sprite(_pfe, s_triangle, false, false, false);
	part_type_life(_pfe, 20, 60);
	part_type_alpha2(_pfe, 1, 0);
	part_type_speed(_pfe, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pfe, 0, 359, 0, 0);
	part_type_orientation(_pfe, 0, 359, 0, 0, false);
	part_type_scale(_pfe, .25*global.scale, .25*global.scale);
	
	part_type_color2(_pfe, make_color_rgb(150, 150, 150), c_black);
	
	global.pt_flak_enemy = _pfe;
	//
	
	//bullet white
	var _pb = part_type_create();
	part_type_sprite(_pb, s_triangle, false, false, false);
	part_type_life(_pb, 20, 60);
	part_type_alpha2(_pb, 1, 0);
	part_type_speed(_pb, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pb, 0, 359, 0, 0);
	part_type_orientation(_pb, 0, 359, 0, 0, false);
	part_type_scale(_pb, .5*global.scale, .5*global.scale);
	
	part_type_color2(_pb, make_color_rgb(255, 255, 255), c_black);
	
	global.pt_bullet = _pb;
	//
	
	//bullet red enemy
	var _pbe = part_type_create();
	part_type_sprite(_pbe, s_triangle, false, false, false);
	part_type_life(_pbe, 20, 60);
	part_type_alpha2(_pbe, 1, 0);
	part_type_speed(_pbe, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pbe, 0, 359, 0, 0);
	part_type_orientation(_pbe, 0, 359, 0, 0, false);
	part_type_scale(_pbe, .5*global.scale, .5*global.scale);
	
	part_type_color2(_pbe, make_color_rgb(255, 0, 0), c_black);
	
	global.pt_bullet_enemy = _pbe;
	//
	
	//bullet ion
	var _pbi = part_type_create();
	part_type_sprite(_pbi, s_triangle, false, false, false);
	part_type_life(_pbi, 20, 60);
	part_type_alpha2(_pbi, 1, 0);
	part_type_speed(_pbi, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pbi, 0, 359, 0, 0);
	part_type_orientation(_pbi, 0, 359, 0, 0, false);
	part_type_scale(_pbi, .5*global.scale, .5*global.scale);
	
	part_type_color2(_pbi, make_color_rgb(155, 155, 255), c_black);
	
	global.pt_bullet_ion = _pbi;
	//
	
	//player
	var _pp = part_type_create();
	part_type_sprite(_pp, s_triangle, false, false, false);
	part_type_life(_pp, 20, 60);
	part_type_alpha2(_pp, 1, 0);
	part_type_speed(_pp, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pp, 0, 359, 0, 0);
	part_type_orientation(_pp, 0, 359, 0, 0, false);
	part_type_scale(_pp, 1*global.scale, 1*global.scale);
	
	part_type_color2(_pp, make_color_rgb(0, 0, 255), c_white);
	
	global.pt_player = _pp;
	//
	
	//basic
	var _pb = part_type_create();
	part_type_sprite(_pb, s_triangle, false, false, false);
	part_type_life(_pb, 20, 60);
	part_type_alpha2(_pb, 1, 0);
	part_type_speed(_pb, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pb, 0, 359, 0, 0);
	part_type_orientation(_pb, 0, 359, 0, 0, false);
	part_type_scale(_pb, 1*global.scale, 1*global.scale);
	
	part_type_color2(_pb, make_color_rgb(255, 0, 0), c_white);
	
	global.pt_basic = _pb;
	//
	
	//suicider
	var _ps = part_type_create();
	part_type_sprite(_ps, s_triangle, false, false, false);
	part_type_life(_ps, 20, 60);
	part_type_alpha2(_ps, 1, 0);
	part_type_speed(_ps, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_ps, 0, 359, 0, 0);
	part_type_orientation(_ps, 0, 359, 0, 0, false);
	part_type_scale(_ps, 1*global.scale, 1*global.scale);
	
	part_type_color2(_ps, make_color_rgb(255, 0, 0), c_white);
	
	global.pt_suicider = _ps;
	//
	
	//gunship
	var _pg = part_type_create();
	part_type_sprite(_pg, s_triangle, false, false, false);
	part_type_life(_pg, 20, 60);
	part_type_alpha2(_pg, 1, 0);
	part_type_speed(_pg, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pg, 0, 359, 0, 0);
	part_type_orientation(_pg, 0, 359, 0, 0, false);
	part_type_scale(_pg, 2*global.scale, 2*global.scale);
	
	part_type_color2(_pg, make_color_rgb(255, 0, 0), c_white);
	
	global.pt_gunship = _pg;
	//
	
	//destroyer
	var _pd = part_type_create();
	part_type_sprite(_pd, s_triangle, false, false, false);
	part_type_life(_pd, 20, 60);
	part_type_alpha2(_pd, 1, 0);
	part_type_speed(_pd, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pd, 0, 359, 0, 0);
	part_type_orientation(_pd, 0, 359, 0, 0, false);
	part_type_scale(_pd, 2*global.scale, 2*global.scale);
	
	part_type_color2(_pd, make_color_rgb(255, 0, 0), c_white);
	
	global.pt_destroyer = _pd;
	//
	
	//heavy cruiser
	var _phc = part_type_create();
	part_type_sprite(_phc, s_triangle, false, false, false);
	part_type_life(_phc, 20, 60);
	part_type_alpha2(_phc, 1, 0);
	part_type_speed(_phc, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_phc, 0, 359, 0, 0);
	part_type_orientation(_phc, 0, 359, 0, 0, false);
	part_type_scale(_phc, 2*global.scale, 2*global.scale);
	
	part_type_color2(_phc, make_color_rgb(255, 0, 0), c_white);
	
	global.pt_heavy_cruiser = _phc;
	//
	
	//battlecruiser
	var _pbc = part_type_create();
	part_type_sprite(_pbc, s_triangle, false, false, false);
	part_type_life(_pbc, 20, 60);
	part_type_alpha2(_pbc, 1, 0);
	part_type_speed(_pbc, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pbc, 0, 359, 0, 0);
	part_type_orientation(_pbc, 0, 359, 0, 0, false);
	part_type_scale(_pbc, 4*global.scale, 4*global.scale);
	
	part_type_color2(_pbc, make_color_rgb(255, 0, 0), c_white);
	
	global.pt_battlecruiser = _pbc;
	//
	
	#endregion
}