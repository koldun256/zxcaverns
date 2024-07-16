class_name StaticTrapWeapon extends Node2D

var trap1: StaticTrap
var trap2: StaticTrap
var trap1_placed = false
var trap2_placed = false

@onready var trap_scene = preload("res://perks/combat/static_trap/static_trap.tscn")
@onready var link_scene = preload("res://perks/combat/static_trap/static_link.tscn")
@onready var game = get_tree().get_root().get_node('Game')
@onready var level = game.get_level()

func _ready():
	var link = link_scene.instantiate()
	add_child(link)
	link.global_position = Vector2.ZERO

func place_trap1():
	if trap1_placed:
		trap1.queue_free()
	trap1 = trap_scene.instantiate()
	level.add_child(trap1)
	trap1.global_position = global_position
	trap1_placed = true
	
func place_trap2():
	if trap2_placed:
		trap2.queue_free()
	trap2 = trap_scene.instantiate()
	level.add_child(trap2)
	trap2.global_position = global_position
	trap2_placed = true

func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		place_trap1()
	if Input.is_action_just_pressed("move_action"):
		place_trap2()
