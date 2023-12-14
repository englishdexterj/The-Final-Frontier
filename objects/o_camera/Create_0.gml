view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0
view_yport[0] = 0;
view_wport[0] = 854*global.scale;
view_hport[0] = 480*global.scale;

//TESTING
view_wport[0] = 960*global.scale;
view_hport[0] = 540*global.scale;

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, o_player, -1, -1, view_wport[0], view_hport[0]);

var d_width = display_get_width();
var d_height = display_get_height();
var x_pos = d_width / 2 - 1920;
var y_pos = d_height / 2 - 1080;
//window_set_size(1920, 1080);
//window_set_rectangle(d_width - 1920, d_height - 1080, 1920, 1080);

surface_resize(application_surface, 2560, 1440);

global.width = camera_get_view_width(0);
global.height = camera_get_view_height(0);