extends Sprite

func _bought():
	set_amount(get_amount() + 1000)

func get_amount():
	return SaveState.coffee_beans

func set_amount(amount):
	SaveState.coffee_beans = amount

func get_cost():
	return 50
