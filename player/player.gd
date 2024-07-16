class_name Player extends CharacterBody2D

@onready var game = get_tree().get_root().get_node("Game")
var stunned = false

func get_stunned(stun_time: float):
	stunned = true
	await get_tree().create_timer(stun_time).timeout
	stunned = false
	
func die():
	print('плаер фокин дие')
	game.restart()
