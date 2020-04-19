extends Ticked
class_name AngryDev

var min_pitchfork_rotation : float = -15.0
var max_pitchfork_rotation : float = 50.0
export var rotation_speed : float = 1
var target: Manager = null
var total_tick = 0.0
export var speed : float = 100.0
onready var pitchfork : Sprite = $pitchfork
onready var body : Sprite = $body
export (Texture) var laser_pitchfork_texture: Texture = null
var laser = false

func _ready():
	if SaveState.has_upgrade("sunglasses"):
		laser = true
		pitchfork.texture = laser_pitchfork_texture

func interpolate(a, b, progress):
	return a + (b-a) * progress

func _process(delta : float) -> void:
	if laser:
		pitchfork.rotation = get_angle_to(target.position) + PI / 2
		return
	total_tick += delta
	var normalized_progress = (sin(total_tick * rotation_speed) + 1.0) / 2.0
	var rot = interpolate(min_pitchfork_rotation, max_pitchfork_rotation, normalized_progress)
	pitchfork.rotation_degrees = rot


func _physics_process(delta: float) -> void:
	if laser:
		return
	var normalized_move = (target.position - body.position).normalized()
	
	position += normalized_move * delta * speed


func rotate_towards(player: Node2D) -> void:
	if player.position.x > position.x:
		scale.x = -abs(scale.x)
