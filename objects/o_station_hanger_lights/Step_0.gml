if deploy > 0 {
	deploy--;
	
	if deploy = 0 {
		image_index = 0;
	} else if deploy = 300 {
		image_index = 0;
	} else if deploy < 300 {
		if deploy mod 30 = 0 {
			if image_index = 0 {
				image_index = 10;
			} else {
				image_index = 0;
			}
		}
	} else if deploy mod 20 = 0 {
		image_index++;
		if image_index > 10 image_index = 0;
	}
}

if instance_exists(parent) {
	x = parent.x + x_start*global.scale;
	y = parent.y + y_start*global.scale;
} else {
	instance_destroy();
}