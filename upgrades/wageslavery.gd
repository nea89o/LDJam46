extends Node

func _bought():
	pass

func get_cost():
	return 200 * pow(100, get_amount())

func set_amount(amount: int) -> void:
	SaveState.upgrades['wageslavery'] = amount

func get_amount() -> int:
	return SaveState.upgrades['wageslavery']
