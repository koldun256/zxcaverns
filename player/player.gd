class_name Player extends CharacterBody2D

var stunned = false

func get_stunned(stun_time: float):
	stunned = true
	await get_tree().create_timer(stun_time).timeout
	stunned = false
