view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0
view_yport[0] = 0;
view_wport[0] = 1920;
view_hport[0] = 1080;

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, o_player, -1, -1, 1920, 1080);

surface_resize(application_surface, 2560, 1440);

global.width = camera_get_view_width(0);
global.height = camera_get_view_height(0);