extends Button
class_name BaseBuilding


func _pressed():
	if SaveState.coffee >= get_cost():
		SaveState.coffee -= get_cost()
		_bought()

func get_cost():
	pass
		
func _bought():
	pass
