extends Ticked
class_name BuildingInterface

export var base_cost := 1.0
export var cost_multiplier := 1.0
export var building_identifier := ""

func _process(delta):
	._process(delta)
	update_label()

func update_label():
	var label : Label = $Label
	label.text = str(get_amount())

func get_cost() -> float:
	return floor(base_cost * pow(cost_multiplier, get_amount()))

func get_amount() -> int:
	return SaveState.buildings[building_identifier]

func set_amount(value : int) -> void:
	SaveState.buildings[building_identifier] = value

func _bought() -> void:
	set_amount(get_amount() + 1)
