extends Label

func _process(delta):
	text = str(SaveState.coffee) + "CM: "+str(SaveState.buildings["intern"])+\
		"DEVS: "+str(SaveState.programmers)+"BTC: "+str(SaveState.bitcoin)

