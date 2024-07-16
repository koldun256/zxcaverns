class_name Boomerang extends Node2D

@onready var boomerang_projectile_scene = preload("res://perks/combat/boomerang/boomerang_projectile.tscn")
@onready var player = get_parent() as Player
var PROJECTILE_SPEED = 1000
var is_thrown = false
func _process(delta):
	if not is_thrown:
		if Input.is_action_just_pressed("attack"):
			is_thrown = true
			var boomerang_projectile = boomerang_projectile_scene.instantiate()
			player.get_parent().add_child(boomerang_projectile)
			boomerang_projectile.global_position = global_position + (player.get_global_mouse_position() - player.global_position).normalized() * 50
			boomerang_projectile.velocity = (player.get_global_mouse_position() - player.global_position).normalized() * PROJECTILE_SPEED
