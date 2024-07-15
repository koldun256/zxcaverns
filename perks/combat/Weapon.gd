class_name Weapon extends Area2D

var SHOW_TIME = 1.0
var cur_time = 0

func hide_weapon():
	$CollisionShape2D.disabled = true
	$Sprite2D.visible = false

func show_weapon():
	$CollisionShape2D.disabled = false
	$Sprite2D.visible = true

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		show_weapon()
		cur_time = SHOW_TIME
	cur_time -= delta
	if cur_time < 0:
		cur_time = 0
		hide_weapon()

func _on_body_entered(body):
	print('asdf')
	if body is Enemy:
		(body as Enemy).destroy()
