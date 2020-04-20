extends Node2D
var blueprint = preload("res://lawsuit/objection.tscn")
onready var speed = rand_range(80, 200)
func _physics_process(delta):
	position += Vector2(speed, 0) * delta
	if position.x > 1024:
		get_parent().win()

func queue_free():
	print('p')
	
func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	queue_free()
	var objection = blueprint.instance()
	objection.position = position
	get_parent().add_child(objection)
