/// @description event collide w/ enemy

with(other) {
	hp--;
	flash = 3;
	hitfrom = other.direction;
}

instance_destroy();
