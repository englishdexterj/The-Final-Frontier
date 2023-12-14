if other.enemy != enemy {
	if other.type = "bullet" {
		if destroy = true && plated = false instance_destroy(other);
	} else if other.type = "sniper" {
		if destroy = true && plated = false instance_destroy(other);
	} else if other.type = "missile" {
		if destroy = true && plated = false instance_destroy(other);
	} else if other.type = "ion" {
		if destroy = true && plated = false instance_destroy(other);
	}
}
