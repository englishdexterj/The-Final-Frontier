if other.enemy != enemy && other.image_alpha = 1 {
	if other.type = "bullet" and !hurt {
		hp -= 1;
			
		hurt = true;
		alarm_set(7, 10);
	} else if other.type = "missile" and !hurt {
		hp -= 2;
			
		hurt = true;
		alarm_set(7, 10);
	} else if other.type = "laser" and !hurt {
		hp -= 1;
			
		hurt = true;
		alarm_set(7, 10);
	} else if other.type = "sniper" and !hurt {
		hp -= 2;
			
		hurt = true;
		alarm_set(7, 10);
	} else if other.type = "ion" {
		//disabled = true;
		//alarm_set(6, 240);
	}
	
	if (other.destroy) instance_destroy(other);
}