class_name RockWeapon extends Node2D

var holds_rock = true
var THROW_SPEED = 1000.0
@onready var rock_scene = preload("res://perks/combat/rock/rock.tscn")
@onready var game = get_tree().get_root().get_node("Game")
@onready var player = game.get_player()
@onready var level = game.get_level()

func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		if holds_rock:
			throw()

func throw():
	var rock = rock_scene.instantiate()
	level.add_child(rock)
	rock.global_position = global_position + Vector2.UP * 30
	rock.velocity = (player.get_global_mouse_position() - player.position).normalized() * THROW_SPEED
	holds_rock = false

func give_rock():
	holds_rock = true
