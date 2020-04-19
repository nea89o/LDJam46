extends Label

func _process(delta):
	text = JSON.print(SaveState.pack_data())

