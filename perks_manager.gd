class_name PerkManager extends Node

@export var mobility_perks: Array[PackedScene]
@export var combat_perks: Array[PackedScene]

func roll_perks():
	return [mobility_perks.pick_random(), combat_perks.pick_random()]
	
func _ready():
	var perks = roll_perks()
	for perk_scene in perks:
		var perk = perk_scene.instantiate()
		add_child(perk)
