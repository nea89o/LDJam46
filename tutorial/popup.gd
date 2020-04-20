extends Label
class_name TutorialPopup

export var identifier = ""

func _input(event):
	if not is_visible_in_tree():
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

func _process(delta):
	if SaveState.tutorial[identifier]:
		return
	if _trigger():
		show()
		get_tree().paused = true
