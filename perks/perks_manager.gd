class_name PerkManager extends Node

@export var mobility_perks: Array[PackedScene]
@export var combat_perks: Array[PackedScene]

signal on_set_perks(perks: Array[Perk])

func roll_perks() -> Array[PackedScene]:
	return [mobility_perks.pick_random(), combat_perks.pick_random()]
	
func set_perks(perk_scenes: Array[PackedScene]):
	for perk_scene in perk_scenes:
		var perk = perk_scene.instantiate()
		add_child(perk)
	on_set_perks.emit(get_children())
	
func update_perks():
	set_perks(roll_perks())
	
func _ready():
	update_perks()
	
	
