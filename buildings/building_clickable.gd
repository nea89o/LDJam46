extends Area2D
class_name BaseBuilding


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var parent = get_parent()
		if SaveState.coffee >= parent.get_cost():
			SaveState.coffee -= parent.get_cost()
			parent._bought()
