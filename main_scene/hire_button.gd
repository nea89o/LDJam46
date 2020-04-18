extends ClickableArea

func _click():
	if SaveState.coffee >= 100:
		SaveState.programmers += 1
		SaveState.coffee -= 100
