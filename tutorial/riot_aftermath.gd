extends TutorialPopup

func _trigger():
	return SaveState.riot_cooldown > 5
