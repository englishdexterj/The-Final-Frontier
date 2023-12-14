if other.enemy != enemy && other.type = "missile" && other.destroy = true {
	instance_destroy(other);
	instance_destroy();
}