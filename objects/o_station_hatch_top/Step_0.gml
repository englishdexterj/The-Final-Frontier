event_inherited();

if deploy > 0 {
	deploy--;
	
	if deploy = 0 {
		deploy_wait = 60;
	} else {
		image_index = 21 - (deploy div (600/21));
	}
} else if deploy_wait > 0 {
	deploy_wait--;
} else if deploy <= 0 and image_index != 0 {
	deploy--;
	
	image_index = 21 + (deploy div (600/21));
}