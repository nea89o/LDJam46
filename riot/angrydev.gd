extends Node2D
class_name AngryDev

var min_pitchfork_rotation : float = -15.0
var max_pitchfork_rotation : float = 50.0
export  var rotation_speed : float = 1
var total_tick = 0.0
onready var pitchfork : Sprite = $pitchfork


func interpolate(a, b, progress):
	return a + (b-a) * progress

func _process(delta : float) -> void:
	total_tick += delta
	var normalized_progress = (sin(total_tick * rotation_speed) + 1.0) / 2.0
	var rot = interpolate(min_pitchfork_rotation, max_pitchfork_rotation, normalized_progress)
	pitchfork.rotation_degrees = rot
	

func rotate_towards(player: Node2D) -> void:
	if player.position.x > position.x:
		scale.x = -abs(scale.x)
