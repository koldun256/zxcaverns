class_name Cell extends Area2D

@onready var inactive_texture = preload("res://perks/combat/kvadrat/inactive.png")
@onready var active_texture = preload("res://perks/combat/kvadrat/active.png")

func _ready():
	set_active(false)

func set_active(active):
	monitoring = active
	$Sprite.texture = active_texture if active else inactive_texture

func _on_body_entered(body):
	body.queue_free()
