extends Ticked

var riot := preload("res://riot/riot.tscn")

func _tick() -> void:
	if SaveState.riot_cooldown == 0:
		SaveState.coffee -= SaveState.programmers
		if SaveState.coffee < 0:
			invoke_riot()
			SaveState.coffee = 0
		else:
			SaveState.bitcoin += SaveState.programmers
	else:
		SaveState.riot_cooldown -= 1

func invoke_riot() -> void:
	SaveState.riot_cooldown = -1
	get_parent().hide()
	get_parent().pause_mode = PAUSE_MODE_STOP
	get_parent().get_parent().add_child(riot.instance())
