extends BuildingInterface
class_name UpgradeInterface

func set_amount(amount: int) -> void:
	SaveState.upgrades[building_identifier] = amount

func get_amount() -> int:
	return SaveState.upgrades[building_identifier]

