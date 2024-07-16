class_name Pidor extends CharacterBody2D

@onready var game = get_tree().get_root().get_node("Game")
@onready var player = game.get_player()
@onready var level = game.get_level()
var sees_player = false

@export var MAX_CD = 2
var cd = 0

@onready var projectile_scene = preload('res://enemies/pidor/projectile.tscn')

func _process(delta):
	$RayCast2D.target_position = player.global_position - position
	sees_player = $RayCast2D.get_collider() is Player
	
	cd = maxf(0, cd - delta)
	if cd == 0 and sees_player:
		attack()

func attack():
	var projectile = projectile_scene.instantiate()
	level.add_child(projectile)
	projectile.global_position = global_position
	projectile.velocity = (player.global_position - global_position).normalized() * 100
	cd = MAX_CD
