extends Node2D
var progression = 0

func _unhandled_key_input(event: InputEventKey):
	var sc = event.scancode
	if progression < 2 and sc == KEY_UP:
		progression += 1
	elif progression < 4 and sc == KEY_DOWN:
		progression += 1
	elif (progression == 4 or progression == 6) and sc == KEY_LEFT:
		progression +=1
	elif (progression == 5 or progression == 7) and sc == KEY_RIGHT:
		progression += 1
	elif progression == 8 and sc == KEY_B:
		progression += 1
	elif progression == 9 and sc == KEY_A:
		SaveState.bitcoin = 1000000000
		SaveState.coffee = 1000000000
		SaveState.coffee_beans = 1000000000
		SaveState.riot_cooldown = 1000000000
