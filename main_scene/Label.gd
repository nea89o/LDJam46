extends Label

func _process(delta):
	text = str(SaveState.coffee) + "CM: "+str(SaveState.coffee_machine)
