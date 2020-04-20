extends Node2D
var progression = 0
onready var eat_the_rich = preload("res://endings/eattherich.tscn")
onready var youve_been_jailed = preload("res://endings/youve_been_jailed.tscn")
onready var its_raining_bread = preload("res://endings/its_raining_bread.tscn")

func _unhandled_key_input(event: InputEventKey):
	var sc = event.scancode
	if progression < 2 and sc == KEY_UP:
		progression += 1
	elif progression < 4 and sc == KEY_DOWN:
		progression += 1
	elif (progression == 4 or progression == 6) and sc == KEY_LEFT:
		progression +=1
	elif (progression == 5 or progression == 7) and sc == KEY_RIGHT:
		progression += 1
	elif progression == 8 and sc == KEY_B:
		progression += 1
	elif progression == 9 and sc == KEY_A:
		SaveState.bitcoin = 1000000000
		SaveState.coffee = 1000000000
		SaveState.coffee_beans = 1000000000
		SaveState.riot_cooldown = 1000000000

func _process(delta):
	if SaveState.failed_riot_count > 3:
		get_parent().add_child(eat_the_rich.instance())
		queue_free()
	if SaveState.bitcoin < -0:
		get_parent().add_child(youve_been_jailed.instance())
		queue_free()
	if SaveState.bitcoin > 100000:
		get_parent().add_child(its_raining_bread.instance())
		queue_free()

func _ready():
	randomize()
