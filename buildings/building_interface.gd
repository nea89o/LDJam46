extends Sprite

export var base_cost := 1.0
export var cost_multiplier := 1.0
export var base_cps := 1.0
export var building_identifier := ""
export var tick_rate := 1.0

var current_tick := 0.0

func _process(delta: float) -> void:
	update_label()
	current_tick += delta
	while current_tick > tick_rate:
		SaveState.coffee += get_amount() * base_cps
		current_tick -= tick_rate

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
