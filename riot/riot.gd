extends Node2D

var dev = preload("res://riot/angrydev.tscn")

func random_position():
	return Vector2(rand_range(30, 1000), rand_range(30, 600))

var devs = []
func _ready() -> void:
	for i in range(10):
		var instance: AngryDev = dev.instance()
		instance.position = random_position()
		add_child(instance)
		devs.append(instance)
func _input(event) -> void:
	if event is InputEventMouseMotion:
		print(event.position)
