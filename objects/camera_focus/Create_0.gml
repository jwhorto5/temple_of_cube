image_speed = 0.1;

sp = 0;

bg_layer = layer_sprite_get_id("bg", "sky_background");

layer_y("background_1", (camera_get_view_y(view_camera[0]) * 0.6) + sprite_height * 0.4);
layer_y("background_2", (camera_get_view_y(view_camera[0]) * 0.8) + sprite_height * 0.2);
layer_y("background_3", (0));