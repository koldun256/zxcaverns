class_name Gun extends Node2D

@onready var bullet_scene = preload("res://perks/combat/gun/bullet.tscn")
@onready var player = get_parent() as Player
var BULLET_SPEED = 1000
func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var bullet = bullet_scene.instantiate()
		player.get_parent().add_child(bullet)
		bullet.global_position = global_position
		bullet.velocity = (player.get_global_mouse_position() - player.position).normalized() * BULLET_SPEED
