extends Sprite

func _process(delta):
	if SaveState.has_upgrade("sunglasses"):
		show()
	else:
		hide()
