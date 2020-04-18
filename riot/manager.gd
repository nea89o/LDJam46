extends KinematicBody2D

class_name Manager

onready var target : Vector2 = get_viewport().get_mouse_position()
export var speed = 128.0

func _physics_process(delta : float) -> void:
	var move_direction := target - position
	if move_direction.length_squared() < 100:
		return
	var move_vector = move_direction.normalized() * delta * speed
	var collision = move_and_collide(move_vector)

	if collision: 
		SaveState.bitcoin = int(ceil(SaveState.bitcoin / 2.0))
		SaveState.programmers = int(ceil(SaveState.programmers * 8.0 / 10.0))
		for child in get_parent().get_parent().get_children():
			if child is CanvasItem:
				child.show()
				child.pause_mode = PAUSE_MODE_INHERIT
		SaveState.riot_cooldown = 10
		get_parent().queue_free()
