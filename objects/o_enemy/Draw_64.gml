if instance_exists(o_player) and !idle {
	var _dx = x - o_player.x;
	var _dy = y - o_player.y;
	var vw = 2560;
	var vh = 1440;
	
	draw_set_color(c_red);

	if ((abs(_dx) - view_wport[0]/2) <= 100*global.scale) _cx = 1 - (abs(_dx) - view_wport[0]/2)/(100*global.scale);
	else var _cx = 0;
	var _a = 1 - (abs(_dx)-view_wport[0]/2)/(2000*global.scale) - _cx;
	draw_set_alpha(clamp(_a, 0, 1));

	if _dx > view_wport[0]/2 {
		draw_rectangle(vw-10, 0, vw, vh, false);
	} else if _dx < -view_wport[0]/2 {
		draw_rectangle(0, 0, 10, vh, false);
	}

	if ((abs(_dy) - view_hport[0]/2) <= 100*global.scale) _cy = 1 - (abs(_dy) - view_hport[0]/2)/(100*global.scale);
	else var _cy = 0;
	var _a = 1 - (abs(_dy)-view_hport[0]/2)/(1000*global.scale) - _cy;
	draw_set_alpha(clamp(_a, 0, 1));

	if _dy > view_hport[0]/2 {
		draw_rectangle(0, vh-10, vw, vh, false);
	} else if _dy < -view_hport[0]/2 {
		draw_rectangle(0, 0, vw, 10, false);
	}


	var _dx2 = (x + (room_width - view_hport[0])) - o_player.x;
	var _dx3 = (x - (room_width - view_hport[0])) - o_player.x;
	//
	if ((abs(_dx2) - view_wport[0]/2) <= 100*global.scale) _cx = 1 - (abs(_dx2) - view_wport[0]/2)/(100*global.scale);
	else var _cx = 0;
	var _a = 1 - (abs(_dx2)-view_wport[0]/2)/(2000*global.scale) - _cx;
	draw_set_alpha(clamp(_a, 0, 1));

	if _dx2 > view_wport[0]/2 {
		draw_rectangle(vw-10, 0, vw, vh, false);
	} else if _dx2 < -view_wport[0]/2 {
		draw_rectangle(0, 0, 10, vh, false);
	}

	if ((abs(_dx3) - view_wport[0]/2) <= 100*global.scale) _cx = 1 - (abs(_dx3) - view_wport[0]/2)/(100*global.scale);
	else var _cx = 0;
	var _a = 1 - (abs(_dx3)-view_wport[0]/2)/(2000*global.scale) - _cx;
	draw_set_alpha(clamp(_a, 0, 1));

	if _dx3 > view_wport[0]/2 {
		draw_rectangle(vw-10, 0, vw, vh, false);
	} else if _dx3 < -view_wport[0]/2 {
		draw_rectangle(0, 0, 10, vh, false);
	}
	//

	draw_set_alpha(1);
	draw_set_color(c_white);
}
