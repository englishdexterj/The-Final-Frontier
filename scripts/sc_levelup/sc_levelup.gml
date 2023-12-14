function sc_levelup() {
	for (var i = 0; i < 3; i++) {
		levelup_choice[i] = -1;
		while levelup_choice[i] = -1 {
			var _r = irandom(levelup_total);
			if (levelup[_r][7] = -1 || levelup[_r][7] = global.selected_character) && (levelup_choice[0] != _r || levelup[levelup_choice[0]][6] = true) && ((levelup_choice[1] != _r || levelup[levelup_choice[1]][6] = true)) && levelup[_r][1] < levelup[_r][2] && (levelup[_r][3] = -1 || levelup[levelup[_r][3]][1] > 0) {
				levelup_choice[i] = _r
			}
		}
	}
}