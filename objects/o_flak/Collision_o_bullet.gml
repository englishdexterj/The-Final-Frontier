if !global.cheats and global.steam_api and instance_exists(o_player) var _stats = true;
else var _stats = false;

if other.enemy != enemy {
	if other.type = "bullet" {
		if other.destroy = true {
			instance_destroy(other);
			if _stats {
				if enemy {
					steam_set_stat_int("player_bullets_shotby_flak", steam_get_stat_int("player_bullets_shotby_flak") + 1);
				} else {
					steam_set_stat_int("enemy_bullets_shotby_flak", steam_get_stat_int("enemy_bullets_shotby_flak") + 1);
				}
			}
		}
	}
	if other.type = "missile" and missiles and other.plated = false {
		if other.destroy = true {
			instance_destroy(other);
			if _stats {
				if enemy {
					steam_set_stat_int("player_missiles_shotby_flak", steam_get_stat_int("player_missiles_shotby_flak") + 1);
				} else {
					steam_set_stat_int("enemy_missiles_shotby_flak", steam_get_stat_int("enemy_missiles_shotby_flak") + 1);
				}
			}
		}
	}
	instance_destroy();
}