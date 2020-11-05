/// @description Set up dead player object

hsp = 0;
vsp = 0;
grv = 0.2;
done = false;

image_speed = 0;
image_index = 0;

ScreenShake(6, 60);
game_set_speed(30, gamespeed_fps);

with (oCamera) follow = other.id;