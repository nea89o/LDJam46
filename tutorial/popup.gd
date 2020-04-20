extends Label
class_name TutorialPopup

export var identifier = ""
var time_on_screen = 0
var _mt = false
func _input(event):
	if not is_visible_in_tree() or time_on_screen < 2:
		return
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			SaveState.tutorial[identifier] = true
			hide()
			get_tree().paused = false

func _trigger() -> bool:
	return false
func _ready():
	hide() # like the goblin you are

func manual_trigger():
	_mt = true

func _process(delta):
	if SaveState.tutorial[identifier]:
		return
	if is_visible_in_tree():
		time_on_screen += delta
	if _trigger() or _mt:
		show()
		get_tree().paused = true
