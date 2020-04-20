extends BuildingInterface


var riot := preload("res://riot/riot.tscn")
var law_suit := preload("res://lawsuit/lawsuit.tscn")

func _tick() -> void:
	if get_amount() == 0:
		return

	if SaveState.riot_cooldown == 0:
		SaveState.coffee -= get_amount() * int(pow(2, SaveState.upgrades['wageslavery']))
		if SaveState.coffee < 0:
			invoke_riot()
			SaveState.coffee = 0
		else:
			SaveState.gain_bitcoin(int(
				pow(get_amount(), 
					1 + SaveState.upgrades['wageslavery'] / 10.0)
				 * (SaveState.upgrades['sunglasses'] + 1)))
	else:
		SaveState.riot_cooldown -= 1


func invoke_riot() -> void:
	SaveState.riot_cooldown = -1
	var mgt = find_parent('management')
	mgt.hide()
	mgt.pause_mode = PAUSE_MODE_STOP
	mgt.get_parent().add_child(riot.instance())


