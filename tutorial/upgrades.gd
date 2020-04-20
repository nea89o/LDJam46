extends TutorialPopup


func _trigger():
	return SaveState.buildings['dev'] >= 2
