class_name Cell extends Area2D

@onready var inactive_texture = preload("res://perks/combat/kvadrat/inactive.png")
@onready var active_texture = preload("res://perks/combat/kvadrat/active.png")

func set_active(active):
	$Sprite.texture = active_texture if active else inactive_texture
