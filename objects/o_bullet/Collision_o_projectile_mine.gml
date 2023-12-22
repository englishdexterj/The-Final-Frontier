if other.enemy != enemy {
	if type = "bullet" {
		if other.destroy = true && other.plated = false instance_destroy(other);
		if destroy = true instance_destroy();
	} else if type = "sniper" {
		if other.destroy = true && other.plated = false instance_destroy(other);
		if destroy = true instance_destroy();
	} else if type = "missile" {
		if other.destroy = true && other.plated = false instance_destroy(other);
		if destroy = true instance_destroy();
	} else if type = "laser" {
		if other.destroy = true instance_destroy(other);
	} else if type = "ion" {
		if other.destroy = true && other.plated = false instance_destroy(other);
		if destroy = true instance_destroy();
	}
}