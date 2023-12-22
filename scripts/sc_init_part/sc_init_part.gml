function sc_init_part() {
	#region Explosion Particle
	//mine enemy
	var _pme = part_type_create();
	part_type_shape(_pme, pt_shape_circle);
	part_type_life(_pme, 30, 30);
	part_type_alpha2(_pme, 1, 0);
	part_type_speed(_pme, 0, 0, 0, 0);
	part_type_direction(_pme, 0, 359, 0, 0);
	part_type_orientation(_pme, 0, 359, 0, 0, false);
	part_type_scale(_pme, 1, 1);
	part_type_size(_pme, 1, 1, 1, 0);
	
	part_type_color2(_pme, make_color_rgb(255, 55, 55), make_color_rgb(55, 0, 0));
	
	global.pt_mine_enemy = _pme;
	//
	
	//mine friendly
	var _pm = part_type_create();
	part_type_shape(_pm, pt_shape_circle);
	part_type_life(_pm, 30, 30);
	part_type_alpha2(_pm, 1, 0);
	part_type_speed(_pm, 0, 0, 0, 0);
	part_type_direction(_pm, 0, 359, 0, 0);
	part_type_orientation(_pm, 0, 359, 0, 0, false);
	part_type_scale(_pm, 1, 1);
	part_type_size(_pm, 1, 1, 1, 0);
	
	part_type_color2(_pm, make_color_rgb(255, 255, 255), c_white);
	
	global.pt_mine = _pm;
	//
	
	//shield glow
	var _sg = part_type_create();
	part_type_shape(_sg, pt_shape_pixel);
	part_type_size(_sg, 16, 32, -.2, .1);
	part_type_color1(_sg, make_color_rgb(200, 120, 120));
	part_type_alpha3(_sg, 1, .8, 0);
	//part_type_blend(_sg, bm_add);
	
	part_type_life(_sg, 300, 600);
	
	part_type_speed(_sg, 2, 3, 0, .1); // Set particle speed range
	part_type_direction(_sg, 0, 360, 0, 1); // Allow particles to move in any direction
	
	global.pt_shield_glow = _sg;
	//
	
	//hanger
	var _hg = part_type_create();
	part_type_shape(_hg, pt_shape_pixel);
	part_type_size(_hg, 16, 32, -.2, .1);
	part_type_color1(_hg, make_color_rgb(255, 100, 100));
	part_type_alpha3(_hg, 1, .8, 0);
	//part_type_blend(_sg, bm_add);
	
	part_type_life(_hg, 300, 600);
	
	part_type_speed(_hg, 2, 3, 0, .1); // Set particle speed range
	part_type_direction(_hg, 0, 360, 0, 1); // Allow particles to move in any direction
	
	global.pt_hanger = _hg;
	//
	
	//destroy small
	var _dss = part_type_create();
	part_type_sprite(_dss, s_triangle, false, false, false);
	part_type_life(_dss, 10, 30);
	part_type_alpha2(_dss, 1, 0);
	part_type_speed(_dss, 0, 4*global.scale, 0, 0);
	part_type_direction(_dss, 0, 359, 0, 0);
	part_type_orientation(_dss, 0, 359, 0, 0, false);
	part_type_scale(_dss, .5*global.scale, .5*global.scale);
	
	part_type_color2(_dss, make_color_rgb(123, 50, 25), make_color_rgb(189, 118, 94));
	
	global.pt_destroy_small = _dss;
	//
	
	//destroy
	var _ds = part_type_create();
	part_type_sprite(_ds, s_triangle, false, false, false);
	part_type_life(_ds, 10, 30);
	part_type_alpha2(_ds, 1, 0);
	part_type_speed(_ds, 0, 4*global.scale, 0, 0);
	part_type_direction(_ds, 0, 359, 0, 0);
	part_type_orientation(_ds, 0, 359, 0, 0, false);
	part_type_scale(_ds, 4*global.scale, 4*global.scale);
	
	part_type_color2(_ds, make_color_rgb(123, 50, 25), make_color_rgb(189, 118, 94));
	
	global.pt_destroy = _ds;
	//
	
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
	
	//station small
	var _pss = part_type_create();
	part_type_sprite(_pss, s_triangle, false, false, false);
	part_type_life(_pss, 20, 60);
	part_type_alpha2(_pss, 1, 0);
	part_type_speed(_pss, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_pss, 0, 359, 0, 0);
	part_type_orientation(_pss, 0, 359, 0, 0, false);
	part_type_scale(_pss, 1*global.scale, 1*global.scale);
	
	part_type_color2(_pss, make_color_rgb(123, 50, 25), make_color_rgb(189, 118, 94));
	
	global.pt_station_small = _pss;
	//
	
	//station medium
	var _psm = part_type_create();
	part_type_sprite(_psm, s_triangle, false, false, false);
	part_type_life(_psm, 40, 120);
	part_type_alpha2(_psm, 1, 0);
	part_type_speed(_psm, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_psm, 0, 359, 0, 0);
	part_type_orientation(_psm, 0, 359, random_range(-1,1), 0, false);
	part_type_scale(_psm, 2*global.scale, 2*global.scale);
	
	part_type_color2(_psm, make_color_rgb(123, 50, 25), make_color_rgb(189, 118, 94));
	
	global.pt_station_medium = _psm;
	//
	
	//station large
	var _psl = part_type_create();
	part_type_sprite(_psl, s_triangle, false, false, false);
	part_type_life(_psl, 60, 180);
	part_type_alpha2(_psl, 1, 0);
	part_type_speed(_psl, 0, 60*global.spd*global.scale, 0, 0);
	part_type_direction(_psl, 0, 359, 0, 0);
	part_type_orientation(_psl, 0, 359, random_range(-1,1), 0, false);
	part_type_scale(_psl, 4*global.scale, 4*global.scale);
	
	part_type_color2(_psl, make_color_rgb(123, 50, 25), make_color_rgb(189, 118, 94));
	
	global.pt_station_large = _psl;
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
	
	//sentinel
	var _psen = part_type_create();
	part_type_sprite(_psen, s_triangle, false, false, false);
	part_type_life(_psen, 20, 60);
	part_type_alpha2(_psen, 1, 0);
	part_type_speed(_psen, 0, 20*global.spd*global.scale, 0, 0);
	part_type_direction(_psen, 0, 359, 0, 0);
	part_type_orientation(_psen, 0, 359, 0, 0, false);
	part_type_scale(_psen, 1.5*global.scale, 1.5*global.scale);
	
	part_type_color2(_psen, make_color_rgb(255, 0, 0), c_white);
	
	global.pt_sentinel = _psen;
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