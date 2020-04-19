extends Node

var buildings = {
	"intern": 0,
	"dev": 1,
}
var upgrades = {
	"wageslavery": 0
}

func gain_bitcoin(amount: int) -> void:
	bitcoin += amount * (upgrades["wageslavery"] + 1)

func lose_bitcoin(amount: int) -> void:
	bitcoin -= amount 

func try_gain_coffee(amount: int) -> int:
	if amount < coffee_beans:
		coffee += amount
		coffee_beans -= amount
		return 0

	coffee += coffee_beans
	var remains = amount - coffee_beans
	coffee_beans = 0
	return remains

var coffee = 10
var coffee_beans = 1000
var bitcoin = 100
var riot_cooldown = 0

func pack_data():
	return {
		"buildings": buildings,
		"upgrades": upgrades,
		"coffee": coffee,
		"coffee_beans": coffee_beans,
		"bitcoin": bitcoin,
		"riot_cooldown": riot_cooldown,
	}
