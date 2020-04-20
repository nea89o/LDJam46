extends TutorialPopup
func _trigger():
	return SaveState.coffee_beans == 0 or (SaveState.bitcoin >= 100 and SaveState.buildings['dev'] > 0)
