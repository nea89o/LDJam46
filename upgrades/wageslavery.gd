extends BuildingInterface

func set_amount(amount: int) -> void:
	SaveState.upgrades['wageslavery'] = amount

func get_amount() -> int:
	return SaveState.upgrades['wageslavery']
