extends Node2D

var dev_blueprint = preload("res://riot/angrydev.tscn")
onready var manager: Manager = $manager
func random_position():
	return Vector2(rand_range(30, 1000), rand_range(30, 600))

var devs = []
func _ready() -> void:
	for i in range(10):
		var instance: AngryDev = dev_blueprint.instance()
		var vec = random_position()
		while vec.distance_squared_to(manager.position) < 256 * 256:
			vec = random_position()
		instance.position = vec
		add_child(instance)
		devs.append(instance)
func _input(event) -> void:
	if event is InputEventMouseMotion:
		manager.target = event.position
