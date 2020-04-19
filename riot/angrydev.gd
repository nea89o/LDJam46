extends Ticked
class_name AngryDev

var min_pitchfork_rotation : float = -15.0
var max_pitchfork_rotation : float = 50.0
export var rotation_speed : float = 1
var target: Node2D = null
var total_tick = 0.0
export var speed : float = 100.0
onready var pitchfork : Sprite = $pitchfork
onready var body : Sprite = $body
export (Texture) var laser_pitchfork_texture: Texture = null
var laser = false
onready var pitchfork_nuzzle : Node2D = $pitchfork/nuzzle
var shooting_windup = 10000000
var shoot_direction = null
var laser_blast_blueprint = preload("res://riot/laser_blast.tscn")

func _ready():
	if SaveState.has_upgrade("sunglasses"):
		shooting_windup = 5
		pitchfork.texture = laser_pitchfork_texture

func interpolate(a, b, progress):
	return a + (b-a) * progress

func _process(delta : float) -> void:
	if shooting_windup < 3:
		if shooting_windup > 0.2:
			pitchfork.rotation = get_angle_to(target.position) + PI / 2
		return
	total_tick += delta
	var normalized_progress = (sin(total_tick * rotation_speed) + 1.0) / 2.0
	var rot = interpolate(min_pitchfork_rotation, max_pitchfork_rotation, normalized_progress)
	pitchfork.rotation_degrees = rot


func _physics_process(delta: float) -> void:
	shooting_windup -= delta
	var normalized_move = (target.position - position).normalized()
	if shooting_windup <= 0.2 and shoot_direction == null:
		shoot_direction = normalized_move
	if shooting_windup <= 0:
		var laser_blast = laser_blast_blueprint.instance()
		laser_blast.position = pitchfork_nuzzle.position
		laser_blast.move = shoot_direction
		laser_blast.rotation = Vector2(0,0).angle_to_point(shoot_direction) + PI / 2
		shoot_direction = null
		add_child(laser_blast)
		shooting_windup = rand_range(8, 12)
	if shooting_windup < 3:
		return
	
	position += normalized_move * delta * speed

