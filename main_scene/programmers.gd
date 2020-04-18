extends Ticked

var riot_cooldown := 0

func _tick() -> void:
	if riot_cooldown == 0:
		SaveState.coffee -= SaveState.programmers
		if SaveState.coffee < 0:
			riot()
			SaveState.coffee = 0
	else:
		riot_cooldown -= 1
		if riot_cooldown < 0:
			riot_cooldown = 0
func riot():
	riot_cooldown = 10
