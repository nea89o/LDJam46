extends Node

var buildings = {
	"intern": 0
}
var upgrades = {
	"wageslavery": 0
}

func gain_bitcoin(amount: int) -> void:
	bitcoin += amount * (upgrades["wageslavery"] + 1)

var coffee = 0
var programmers = 1
var coffee_beans = 1000
var bitcoin = 100
var riot_cooldown = 60
