extends BaseBuilding

func _bought():
	SaveState.coffee_machine += 1

func get_cost():
	return floor(10 * pow(1.1, SaveState.coffee_machine))

export var delay = 1

var current_delay = 0
func _process(delta):
	current_delay += delta
	if current_delay > delay:
		SaveState.coffee += SaveState.coffee_machine
		current_delay -= delay
		
