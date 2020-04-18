extends ClickableArea

func _click():
	if SaveState.bitcoin >= 100:
		SaveState.programmers += 1
		SaveState.bitcoin -= 100
