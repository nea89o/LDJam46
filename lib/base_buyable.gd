extends Area2D
class_name BaseBuyable


func _input_event(viewport, event, shape_idx):
	# todo RMB max
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var parent = get_parent()
		if SaveState.bitcoin >= parent.get_cost():
			SaveState.bitcoin -= parent.get_cost()
			parent._bought()
