extends Sprite

export var speed = 700.0
var move: Vector2 = Vector2(0, 0)
func _physics_process(delta):
	move
	position += move * delta * speed
