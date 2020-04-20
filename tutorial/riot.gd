extends TutorialPopup
var i = 0
func _trigger():
	return i > 1
func _process(delta):
	._process(delta)
	i+=delta
