extends BuildingInterface


func _tick() -> void:
	SaveState.try_gain_coffee(get_amount())
