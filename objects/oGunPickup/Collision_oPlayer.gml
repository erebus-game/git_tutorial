/// @description Equip Gun

global.hasgun = true;
instance_create_layer(oPlayer.x, oPlayer.y, layer, oGun);
instance_destroy();
