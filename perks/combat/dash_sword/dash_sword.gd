class_name DashSword extends Node2D

@onready var player = get_tree().get_root().get_node('Game').get_player()

var SHOW_TIME = 0.3
var cur_time = 0
var cursor_position
var start_point
var in_dash = false

func hide_weapon():
	$Area2D/CollisionShape2D.disabled = true
	$Line2D.visible = false

func show_weapon(delta):
	
	cursor_position = get_global_mouse_position()
	look_at(cursor_position)
	print(cursor_position)
	await get_tree().create_timer(0.1).timeout
	start_point = player.global_position
	if $RayCast2D.is_colliding():
		print("changed")
		cursor_position = $RayCast2D.get_collision_point()
		print(cursor_position)
		player.global_position += (cursor_position - player.global_position)*0.8
	else:
		player.global_position += (cursor_position - player.global_position).normalized()*200
	$Area2D/CollisionShape2D.disabled = false
	$Line2D.visible = true
	$Line2D.points = [to_local(start_point), to_local(player.global_position)]
	$Area2D/CollisionShape2D.shape.a = to_local(start_point)
	$Area2D/CollisionShape2D.shape.b = to_local(player.global_position)
	player.get_stunned(SHOW_TIME)

func _process(delta):
	if Input.is_action_just_pressed("attack") and not player.stunned:
		show_weapon(delta)
		cur_time = SHOW_TIME
	cur_time -= delta
	if cur_time < 0:
		cur_time = 0
		hide_weapon()

func _on_area_2d_body_entered(body):
	if body.is_in_group('Enemy'):
		body.queue_free()
