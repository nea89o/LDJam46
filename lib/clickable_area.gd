extends Area2D
class_name ClickableArea

func _click():
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		_click()
