class_name StaticTrapWeapon extends Node2D

@onready var trap_scene = preload("res://perks/combat/static_trap/static_trap.tscn")
@onready var link_scene = preload("res://perks/combat/static_trap/static_link.tscn")
@onready var game = get_tree().get_root().get_node('Game')
@onready var level = game.get_level()

var trap_to_place = 0
var traps = [null, null]

func _ready():
	var link = link_scene.instantiate()
	add_child(link)
	link.global_position = Vector2.ZERO

func place_trap():
	if traps[trap_to_place]:
		traps[trap_to_place].queue_free()
	
	traps[trap_to_place] = trap_scene.instantiate()
	level.add_child(traps[trap_to_place])
	traps[trap_to_place].global_position = global_position
	
	trap_to_place = (trap_to_place + 1) % len(traps)

func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		place_trap()
