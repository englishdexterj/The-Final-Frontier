if instance_exists(pt) {
	x = pt.x;
	y = pt.y;
	image_angle = pt.image_angle;
	
	if variable_instance_exists(pt, "idle") and pt.idle {
		image_xscale = 0;
		image_yscale = 0;
	} else {
		if hit_reduce > 0 {
			if image_xscale >= hit_reduce/10 {
				image_xscale -= hit_reduce/10;
				image_yscale = image_xscale;
			} else if image_xscale > 0 {
				image_xscale = 0;
				image_yscale = 0;
			}
			hit_reduce -= max(hit_reduce/10, .005);
		
		} else if hit_reduce < 0 hit_reduce = 0;
	
		if station {
			if image_xscale < 1 {
				image_xscale += shield_regen * clamp((image_xscale*2 / 1), .25, 1);
				image_yscale = image_xscale;
			}
		} else {
			if image_xscale < 1 {
				image_xscale += shield_regen;
				image_yscale = image_xscale;
			}
		}
	}
	
	time += .015;
	time2 += .01;
} else instance_destroy();