extends Node2D

onready var miles = preload("res://lawsuit/miles.tscn")
onready var wright = preload("res://lawsuit/wright.tscn")

func get_cost():
	var x = 1
	for value in SaveState.upgrades.values():
		x *= value + 1
	for value in SaveState.buildings.values():
		x *= value + 1
	return x

func _ready():
	$CanvasModulate/case.text = "you are being sued for:\n"+str(get_cost())

func lose():
	SaveState.lose_bitcoin(get_cost() * 2)
	exit()

func win():
	exit()
	
func plead_guilty():
	SaveState.lose_bitcoin(get_cost())
	exit()

func plead_innocent():
	$Area2D.queue_free()
	$Area2D2.queue_free()
	for i in range(SaveState.buildings['lawyer']):
		var w = wright.instance()
		w.position = Vector2(0, rand_range(0, 640))
		add_child(w)
	for i in range(rand_range(1, int(ceil(SaveState.buildings['dev']))+1)):
		var m = miles.instance()
		m.position = Vector2(1024, rand_range(0, 640))
		add_child(m)

func exit():
	queue_free()
	SaveState.riot_cooldown = 20
	for child in get_parent().get_children():
		if child is CanvasItem:
			child.show()
			child.pause_mode = PAUSE_MODE_INHERIT
