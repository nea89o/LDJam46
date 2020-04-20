extends Node2D
onready var speed = rand_range(80, 200)
func _physics_process(delta):
	position += Vector2(-speed, 0) * delta
	if position.x < 0:
		get_parent().lose()

func queue_free():
	print('p')
	
func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	queue_free()
