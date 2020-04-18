extends Node
class_name Ticked

export var tick_rate := 1.0
var current_tick = 0.0
func _tick():
	pass

func _process(delta: float) -> void:
	current_tick += delta
	while current_tick > tick_rate:
		_tick()
		current_tick -= tick_rate
