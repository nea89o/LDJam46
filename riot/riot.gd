extends Node2D

var dev_blueprint = preload("res://riot/angrydev.tscn")
onready var manager: Manager = $manager
onready var riot_won: TutorialPopup = $CanvasLayer/riot_won
var time_passed = 0.0
func random_position():
	return Vector2(rand_range(30, 1000), rand_range(30, 600))

func _process(delta):
	time_passed += delta
	$CanvasLayer/timer.text = "Security will arive in "+ str(30-time_passed)
	if time_passed > 30:
		riot_won.manual_trigger()
	if time_passed > 30.5:
		for child in get_parent().get_children():
			if child is CanvasItem:
				child.show()
				child.pause_mode = PAUSE_MODE_INHERIT
		SaveState.riot_cooldown = 20
		queue_free()

var devs = []
func _ready() -> void:
	print("Ready")
	for i in range(SaveState.upgrades['wageslavery'] + 1):
		var instance: AngryDev = dev_blueprint.instance()
		var vec = random_position()
		while vec.distance_squared_to(manager.position) < 256 * 256:
			vec = random_position()
		instance.position = vec
		instance.target = manager
		add_child(instance)
		devs.append(instance)
func _input(event) -> void:
	if event is InputEventMouseMotion:
		manager.target = event.position
