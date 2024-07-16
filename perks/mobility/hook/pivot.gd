class_name Pivot extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("hook_and_stuff"):
		look_at(get_global_mouse_position())
